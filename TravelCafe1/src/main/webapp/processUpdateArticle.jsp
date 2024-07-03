<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\Users\\82107\\workspace_webServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\TravelCafe\\resources\\images";
	
	String encType="UTF-8";
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
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
	ResultSet rs = null;

	String sql = "SELECT * FROM article WHERE a_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, articleId);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {		

		if (fileName != null) {
			sql = "UPDATE article SET a_name=?, a_writer =?, a_description=?, a_releaseDate = ?, a_fileName=? WHERE a_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, writer);
			pstmt.setString(3, description);
			pstmt.setString(4, releaseDate);
			pstmt.setString(5, fileName);
			pstmt.setString(6, articleId);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE article SET a_name=?, a_writer =?, a_description=?, a_releaseDate = ?, a_fileName=? WHERE a_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, writer);
			pstmt.setString(3, description);
			pstmt.setString(4, releaseDate);
			pstmt.setString(5, fileName);
			pstmt.executeUpdate();
		}
	}
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	

	response.sendRedirect("editArticle.jsp?edit=update");

%>
