<%@ page language = "java" contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.util.Date" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>FirstPage</title>
</head>
<body>
<div class="container py-4">
	<%@ include file = "menu.jsp" %>
	 <%!String greeting = "Cafe - FirstPage";
	String tagline = "Press the button!";%>	
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><%=greeting%></h1>
        <p class="col-md-8 fs-4">여행을 떠나요</p>
      </div>
    </div>
    
    <div class="row align-items-md-stretch   text-center">
      <div class="col-md-12">
        <div class="h-100 p-5">
        <h3>Login or Register to enter cafe</h3>
          	<%
          	  String error=request.getParameter("error");
          	if (error != null) {
          		out.println("<div class='alert alert-danger'>");
          		out.println("아이디와 비밀번호를 확인해 주세요");
          		out.println("</div>");
          	  }
          	%>
          	
          <h3><%=tagline%></h3>    
          <%
          		
          		Date day = new java.util.Date();
          		String am_pm;
          		int hour = day.getHours();
          		int minute = day.getMinutes();
          		int second = day.getSeconds();
          		if (hour / 12 == 0) {
          			am_pm = "AM";
          		} else {
          			am_pm = "PM";
          			
          		}
          		
          		String CT = hour + "시" + minute + "분" + second +"초";
          		out.println("Current time: " + CT + "\n");
          	%>     
        </div>
      </div>   
    </div> 
    <%@ include file = "footer.jsp" %>
  </div>
</body>
</html>
  