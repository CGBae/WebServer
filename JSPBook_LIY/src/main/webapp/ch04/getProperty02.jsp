<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>[예제4-11]Action Tag</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.com.dao.Person"></jsp:useBean>
	<jsp:setProperty name="person" property="id" value="20230824" />
	<jsp:setProperty name="person" property="name" value="홍길동" />
	<p> 아이디 : <jsp:getProperty property="id" name="person" />
	<p> 이 름 : <jsp:getProperty property="name" name="person" />
</body>
</html>