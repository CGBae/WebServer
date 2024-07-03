<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String articleId = request.getParameter("id");

	PreparedStatement pstmt = null;	 
	ResultSet rs = null;

	String sql = "SELECT * FROM article";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	if (rs.next()) {
		sql = "DELETE FROM article WHERE a_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleId);
		pstmt.executeUpdate();

	} else
		out.println("해당하는 목록이 없습니다");
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editBook.jsp?edit=delete");
%>
