<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>페이지 오류</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
    <div class="p-5 mb-4 bg-body-teritiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
      </div>
    </div>
    </div>
  <div class="row align-items-md-stretch">
    <div class="col-md-12">
      <div class="h-100 p-5">
        <p> <%=request.getRequestURL() %> </p>
      	<p> <a href="books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
      </div>
    </div>
  </div>
</body>
</html>