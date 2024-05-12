<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>[예제4-10]Action Tag</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<p> 아이디 : <jsp:getProperty name="person" property="id" />
	<p> 이 름 : <jsp:getProperty name="person" property="name" />
</body>
</html>