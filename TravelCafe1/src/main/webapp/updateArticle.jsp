<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

<title>후기 수정</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">후기 수정</h1>
        <p class="col-md-8 fs-4">Updating Review</p>      
      </div>
    </div>
  <%@ include file="dbconn.jsp"%>
  <%
  	String articleId = request.getParameter("id");
  	PreparedStatement pstmt = null;
  	ResultSet rs = null;
  	String sql = "SELECT * FROM article WHERE a_id=?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, articleId);
  	rs=pstmt.executeQuery();
  	if (rs.next()) {

	%>		
	 <div class="row align-items-md-stretch">	  	
		
		<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("a_filename")%>" alt="image" style="width: 100%" />
			</div>
		<div class="col-md-7">	
		<form name="newArticle" action="./processUpdateArticle.jsp" method="post" enctype ="multipart/form-data">
		
			
			<div class="mb-3 row">
				<label class="col-sm-2">글 코드</label>
				<div class="col-sm-5">
					<input type="text" name="articleId" id="articleId" class="form-control" value='<%=rs.getString("a_id")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-5">
					<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("a_name")%>'>
				</div>
			</div>
				
			<div class="mb-3 row">
				<label class="col-sm-2">글쓴이</label>
				<div class="col-sm-5">
					<input type="text" name="writer" class="form-control" value='<%=rs.getString("a_writer")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">작성일</label>
				<div class="col-sm-5">
					<input type="text" name="releaseDate" class="form-control" value='<%=rs.getString("a_releaseDate")%>'>
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-8">
					<textarea  name="description" id="description" cols="50" rows="2"
						class="form-control" placeholder="100자 이상 적어주세요"><%=rs.getString("a_description")%></textarea>
				</div>
			</div>			
			
			<div class="mb-3 row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-8">
					<input type="file" name="articleImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록 " >
				</div>
			</div>
		</form>
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
	<jsp:include page="footer.jsp" />
</div>	

</body>
</html>
