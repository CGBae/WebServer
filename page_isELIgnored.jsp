<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="true" %>
<html>
<head>
<title>[예제3-8]Directives Tag</title>
</head>
<body>
	<%
		request.setAttribute("RequestAttribute", "request 내장 객체");
	%>
	${requestScope.RequestAttribute}
</body>
</html>