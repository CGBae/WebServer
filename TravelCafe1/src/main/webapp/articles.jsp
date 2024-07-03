<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import = "dao.ArticleRepository" %>
<%@ page import = "dto.Article" %>
<jsp:useBean id="articleDAO" class="dao.ArticleRepository" scope="session"/>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<title>글 목록</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="menu.jsp" %>
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
	 <div class="container-fluid py-5">
	 	<h1 class="display-5 fw-bold">후기 목록</h1>
          <p class="col-md-8 fs-4">Travel Review</p> 
		</div>
	</div>
	<%@ include file = "dbconn.jsp" %>
	<%
		ArrayList<Article> listOfArticles = articleDAO.getAllArticles();
	%>
	<div class="row align-items-md-stretch text-center">
		<!--  <%
			for (int i = 0; i < listOfArticles.size(); i++) {
				Article article = listOfArticles.get(i);
			
		%>
		<div class="col-md-4">
			<div class="h-100 p-2">
			<img src="./resources/images/<%= article.getFilename() %>" style="width: 250px; height: 350px;" />
				<h5><b><%=article.getName() %></b></h5>
				<p><%=article.getWriter() %>
				<p><%=article.getDescription().substring(0,10) %>...			
				<p><a href="./article.jsp?id=<%= article.getArticleId() %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
                
			</div>	
		</div>
		<%
			}
		%>	-->
	
	
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM article";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while (rs.next()) {
	%>
	<div class="col-md-4">
		<div class="h-100 p-2">
			<img src ="./resources/images/<%=rs.getString("a_filename") %>" style="width : 250; height : 350" />
			<h5><b><%=rs.getString("a_name") %></b></h5>
			<p> <%=rs.getString("a_writer") %>
			<p> <%=rs.getString("a_description").substring(0,60) %>...
			<p> <a href=" ./article.jsp?id=<%=rs.getString("a_id") %>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a></div>	
		</div>	
		<%
		  }
		  if (rs!=null)
		  	  rs.close();
		  if (pstmt !=null )
			  pstmt.close();
		  if (conn != null)
			  conn.close();
		%>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>