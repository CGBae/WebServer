<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
  String bookmarkId = session.getId();
%>
<title>북마크</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
	 <div class="container-fluid py-5">
	 	<h1 class="display-5 fw-bold">북마크된 글 목록</h1>
        <p class="col-md-8 fs-4">BookMark</p>
     </div>
	</div>
	
	<div class="row align-items-md-stretch">
	  <div class="row">
		<table width="100%">
		<tr>
		<td align="left"><a href="./deleteBookMark.jsp?bookmarkId=<%=bookmarkId%>" class="btn btn-danger">북마크에서 제거</a></td>
		<!--  <td align="right"><a href="./shippingInfo.jsp?bookmarkId=<%=bookmarkId%>"class="btn btn-success">주문하기</a></td>  -->
		</tr>
		</table>
	  </div>	
	  <div style="padding-top: 50px">
	  <table class="table table-hover">
	  <tr>
	    <th>후기</th>
	    
	  </tr>
	  <%
	    int sum = 0;
	    ArrayList<Article> bookmarkList = (ArrayList<Article>) session.getAttribute("bookmarklist");
	    if (bookmarkList == null) 
	    	bookmarkList = new ArrayList<Article>();
	    for (int i = 0; i < bookmarkList.size(); i++) {
	    	Article article = bookmarkList.get(i);
	    	
	  %>
	  <tr>
	  <td><%=article.getArticleId() %> - <%=article.getName() %></td>
	 
	  <td><a href="./removeBookmark.jsp?id=<%=article.getArticleId()%>" class="badge text-bg-danger">삭제</a></td>
	  </tr>
	   <%
	   }
	   %>
	   <tr>
	     <th></th>
	     <th></th>
	     <th></th>
	   </tr>
	  </table>
	  <a href="./articles.jsp" class="btn btn-secondary">&laquo; 후기 목록</a>
	  </div>
	</div>

<jsp:include page="footer.jsp" />
</div>
</body>
</html>