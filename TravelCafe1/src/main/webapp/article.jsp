<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.Article"%>
<%@ page import="dao.ArticleRepository"%> 
<%@ page errorPage="exceptionNoBookId.jsp"%> 
<jsp:useBean id="articleDAO" class="dao.ArticleRepository" scope="session" />
<!-- 11장 추가 -->
<html>
<head>
  <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
  <title>자세한 후기</title>
  <script type="text/javascript"> 
  
    function addToBookMark() {
        if (confirm("글을 북마크에 추가하시겠습니까?")) {
            document.addForm.submit();
        } else {        
            document.addForm.reset();
        }
    }

    function likeArticle(articleId, userId) {
        fetch(`likeArticle.jsp?articleId=${articleId}&userId=${userId}`, { method: 'POST' })
            .then(response => response.text())
            .then(data => {
                document.getElementById('likesCountContainer').innerHTML = data;
                const likeButton = document.getElementById('likeButton');
                if (likeButton.classList.contains('btn-primary')) {
                    likeButton.classList.remove('btn-primary');
                    likeButton.classList.add('btn-warning');
                    likeButton.innerText = '좋아요 취소';
                } else {
                    likeButton.classList.remove('btn-warning');
                    likeButton.classList.add('btn-primary');
                    likeButton.innerText = '좋아요';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('좋아요 처리 중 오류가 발생했습니다.');
            });
    }
  </script>
</head>
<body>
<%@ include file="dbconn.jsp" %> <!-- DB연결 -->

<div class="container py-4">
   <%@ include file="menu.jsp"%>
   
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">여행 후기 글</h1>
        <p class="col-md-8 fs-4">Reviews</p>      
      </div>
    </div>
    <%
        String articleId = request.getParameter("id");
        String userId = (String) session.getAttribute("userId"); // 세션에서 userId 가져오기
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int likesCount = 0;
        try {
            String sql = "select * from article where a_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, articleId);
            rs = pstmt.executeQuery();
            if (rs.next()) {        
    %>
     <div class="row align-items-md-stretch">       
            <div class="col-md-5">
              <img src="./resources/images/<%=rs.getString("a_filename")%>" style="width: 250px; height:350px;" />        
            </div>         
           <div class="col-md-6">
            	<h3><b><%=rs.getString("a_name")%></b></h3>
                <p><%=rs.getString("a_description")%>
                <p><b>후기 번호 : </b><span class="badge text-bg-danger"> <%=rs.getString("a_id")%></span>                            
                <p><b>작성자</b> : <%=rs.getString("a_writer")%>    
                <p><b>작성일</b> : <%=rs.getString("a_releaseDate")%>                    
                
                <!--  13장. 장바구니 추가 -->
                <p><form name="addForm" action="./addBookMark.jsp?id=<%=rs.getString("a_id")%>" method="post">
                    <a href="#" class="btn btn-info" onClick="addToBookmark()"> 북마크에 추가 &raquo;</a> 
                    <a href="./bookmark.jsp" class="btn btn-warning"> 북마크 &raquo;</a><!--  북마크 추가 -->
                    <a href="./articles.jsp" class="btn btn-secondary"> 글 목록 &raquo;</a>
                </form>
            </div>
     </div>
     <%
            } else {
                out.println("<p>글 정보를 찾을 수 없습니다.</p>");
            }

            // 좋아요 수 가져오기
            try {
                String likeSql = "SELECT SUM(likes_count) AS total_likes FROM likes WHERE article_id = ?";
                pstmt = conn.prepareStatement(likeSql);
                pstmt.setString(1, articleId);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    likesCount = rs.getInt("total_likes");
                }
            } catch (SQLException e) {
                out.println("<p>좋아요 수를 불러오는 중 오류 발생: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
        } catch (SQLException e) {
            out.println("<p>오류 발생: " + e.getMessage() + "</p>");
            out.println(e.getMessage());
        } finally {
            if (rs != null) 
                try { rs.close(); } catch (SQLException e) { out.println(e.getMessage()); }
            if (pstmt != null)
                try { pstmt.close(); } catch (SQLException e) { out.println(e.getMessage()); }
        }
     %>

     <!-- 좋아요 버튼 및 좋아요 수 -->
     <div class="row">
        <div class="col-md-12">
            <h3>좋아요 <span id="likesCountContainer"><span id="likesCount"><%= likesCount %></span>개</span></h3>
            <button id="likeButton" class="btn btn-primary" onclick="likeArticle('<%= articleId %>', '<%= userId %>')">좋아요</button>
        </div>
     </div>

     <!-- 댓글 입력 폼 -->
     <div class="row">
        <div class="col-md-12">
            <h3>댓글 작성</h3>
            <form action="addComment.jsp" method="post">
                <input type="hidden" name="articleId" value="<%=articleId%>">
                <div class="mb-3">
                    <label for="userName" class="form-label">이름</label>
                    <input type="text" class="form-control" id="userName" name="userName" required>
                </div>
                <div class="mb-3">
                    <label for="commentText" class="form-label">댓글</label>
                    <textarea class="form-control" id="commentText" name="commentText" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">댓글 작성</button>
            </form>
        </div>
     </div>

     <!-- 댓글 목록 -->
     <div class="row mt-4">
        <div class="col-md-12">
            <h3>댓글 목록</h3>
            <%
                try {
                    String commentSql = "SELECT * FROM comments WHERE article_id = ? ORDER BY comment_date DESC";
                    pstmt = conn.prepareStatement(commentSql);
                    pstmt.setString(1, articleId);
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        int commentId = rs.getInt("comment_id");
                        String commentText = rs.getString("comment_text");
                        String userName = rs.getString("user_name");
                        Timestamp commentDate = rs.getTimestamp("comment_date");
            %>
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title"><%= userName %></h5>
                    <p class="card-text"><%= commentText %></p>
                    <p class="card-text"><small class="text-muted"><%= commentDate %></small></p>
                    
                    <form action="editComment.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="commentId" value="<%= commentId %>">
                        <input type="hidden" name="articleId" value="<%= articleId %>">
                        <textarea name="commentText"><%= commentText %></textarea>
                        <button type="submit" class="btn btn-secondary">수정</button>
                    </form>
                    <form action="deleteComment.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="commentId" value="<%= commentId %>">
                        <input type="hidden" name="articleId" value="<%= articleId %>">
                        <button type="submit" class="btn btn-danger">삭제</button>
                    </form>
                </div>
            </div>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<p>댓글을 불러오는 중 오류 발생: " + e.getMessage() + "</p>");
                    out.println(e.getMessage());
                } finally {
                    if (rs != null) 
                        try { rs.close(); } catch (SQLException e) { out.println(e.getMessage()); }
                    if (pstmt != null)
                        try { pstmt.close(); } catch (SQLException e) { out.println(e.getMessage()); }
                    if (conn != null)
                        try { conn.close(); } catch (SQLException e) { out.println(e.getMessage()); }
                }
            %>
        </div>
     </div>

    <jsp:include page="footer.jsp" />
</div>
</body>
</html>
