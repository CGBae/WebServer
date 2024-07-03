<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String articleId = request.getParameter("articleId");
	String userName = request.getParameter("userName");
	String commentText = request.getParameter("commentText");

	PreparedStatement pstmt = null;

	try {
		String sql = "INSERT INTO comments (article_id, user_name, comment_text) VALUES (?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleId);
		pstmt.setString(2, userName);
		pstmt.setString(3, commentText);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		out.println(e.getMessage());
	} finally {
		if (pstmt != null) 
			try { pstmt.close(); } catch (SQLException e) { out.println(e.getMessage()); }
		if (conn != null) 
			try { conn.close(); } catch (SQLException e) { out.println(e.getMessage()); }
	}

	response.sendRedirect("article.jsp?id=" + articleId);
%>
