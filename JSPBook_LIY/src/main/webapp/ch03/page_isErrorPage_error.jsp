<%@ page contentType="text/xml; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>

<title>[예제3-7_에러페이지]Directives Tag</title>
</head>
<body>
   <h4>에러가 발생되었습니다.</h4>
   <h5>exception 내장 객체 변수</h5>
   <%
     exception.printStackTrace(new java.io.PrintWriter(out));
   %>
</body>
</html>