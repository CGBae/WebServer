<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>[예제5-5]Implicit Objects</title>
</head>
<body>
	<p>이 페이지는 2초마다 새로고침 됩니다.
	<%
		response.setIntHeader("Refresh", 2);
	%>
	<p><%=(new java.util.Date()) %>
</body>
</html>