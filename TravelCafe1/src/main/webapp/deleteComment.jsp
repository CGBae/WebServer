<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String commentId = request.getParameter("commentId");
	String articleId = request.getParameter("articleId");

	PreparedStatement pstmt = null;

	try {
		String sql = "DELETE FROM comments WHERE comment_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, commentId);
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
