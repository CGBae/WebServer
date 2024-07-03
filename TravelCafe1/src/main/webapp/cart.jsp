<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
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
        <h1 class="display-5 fw-bold">즐겨찾기</h1>
        <p class="col-md-8 fs-4">BookMark</p>
     </div>
    </div>
    
    <div class="row align-items-md-stretch">
      <div class="row">
        <table width="100%">
        <tr>
        <td align="left"><a href="./deleteCart.jsp?bookmarkId=<%=bookmarkId%>" class="btn btn-danger">삭제하기</a></td>
        </tr>
        </table>
      </div>    
      <div style="padding-top: 50px">
      <table class="table table-hover">
      <tr>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>비고</th>
      </tr>
      <%
        int sum = 0;
        ArrayList<Article> bookmarkList = (ArrayList<Article>) session.getAttribute("bookmarklist");
        if (bookmarkList == null) 
        	bookmarkList = new ArrayList<Article>();
        for (int i = 0; i < bookmarkList.size(); i++) {
            Article article = bookmarkList.get(i);
            String likeCountSql = "SELECT SUM(likes_count) AS total_likes FROM likes WHERE article_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(likeCountSql)) {
                pstmt.setString(1, article.getArticleId());
                try (ResultSet rs = pstmt.executeQuery()) {
                    int totalLikes = 0;
                    if (rs.next()) {
                        totalLikes = rs.getInt("total_likes");
                    }
      %>
      <tr>
      <td><a href="./article.jsp?id=<%=article.getArticleId()%>"><%=article.getName() %></a></td>
      <td><%=article.getWriter() %></td>
      <td><%=article.getReleaseDate() %></td>
      <td><a href="./removeCart.jsp?id=<%=article.getArticleId()%>" class="badge text-bg-danger">삭제</a></td>
      </tr>
       <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
       }
       %>
      </table>
      <a href="./articles.jsp" class="btn btn-secondary">&laquo; 후기 목록으로 돌아가기</a>
      </div>
    </div>

<jsp:include page="footer.jsp" />
</div>
</body>
</html>
