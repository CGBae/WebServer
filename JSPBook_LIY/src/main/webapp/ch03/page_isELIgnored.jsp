<%@ page contentType="text/xml; charset=utf-8" %>
<%@ page is ELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>

<title>Directives Tag</title>
</head>
<body>
   <%
   request.setAttribute("RequestAttribute", "request 내장 객체");
   %>
   ${requestScope.RequestAttribute }
</body>
</html>