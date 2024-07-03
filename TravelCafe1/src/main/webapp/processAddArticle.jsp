<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import ="com.oreilly.servlet.multipart.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\Users\\82107\\workspace_webServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\TravelCafe\\resources\\images";
	int maxSize=5 * 1024 * 1024;	// 최대 업로드 파일 크기 5MB
	String encType="UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String articleId = multi.getParameter("articleId");
	String name = multi.getParameter("name");
	String writer = multi.getParameter("writer");
	String releaseDate = multi.getParameter("releaseDate");
	String description = multi.getParameter("description");
	
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String sql = "INSERT INTO article VALUES(?,?,?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, articleId);
	pstmt.setString(2, name);
	pstmt.setString(3, writer);
	pstmt.setString(4, description);
	pstmt.setString(5, releaseDate);
	pstmt.setString(6, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (pstmt != null)
		conn.close();
	
	response.sendRedirect("articles.jsp");
%>