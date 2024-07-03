<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type = "text/javascript" src="./resources/js/validation.js"></script>
<title>후기 등록 페이지</title>
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
<div class="container py-4">
    <%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
	 	<div class="container-fluid py-5">
	 	  <h1 class="display-5 fw-bold"><fmt:message key="title" /></h1>
	 	  	<p class="col-md-8 fs-4">Add Review</p> 
    	</div>
	</div>
	
	<div class="row align-items-md-stretch">
		<div class="text-end">
		  <a href="?language=ko">Korean </a> | <a href="?language=en">English </a>
		</div>
		<form name="newArticle" action="./processAddArticle.jsp" class = "form-horizontal" method="post" enctype="multipart/form-data">
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="articleId" /></label>
				<div class="col-sm-3">
					<input type="text" id="articleId" name="articleId" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="name" /></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="writer" /></label>
				<div class="col-sm-3">
					<input type="text" name="writer" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control" placeholder = "월/년">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea name="description" id=description cols="50" rows="2"
					class="form-control" placeholder = "원하는 만큼 적어주세요"></textarea>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="Image" /></label>
				<div class="col-sm-5">
					<input type="file" name="Image" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<div class = "col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value = "<fmt:message key="button" />" onclick="CheckAddArticle()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
	</div>
</fmt:bundle>
</body>
</html>