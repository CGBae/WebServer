<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BookmarketDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>	
<title>회원 정보</title>
</head>
<body onload="init()">

<div class="container py-4">
   <jsp:include page="/menu.jsp" />

 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 정보</h1>
        <p class="col-md-8 fs-4">Member information</p>      
      </div>
    </div>
	<c:forEach var="row" items="${resultSet.rows}">
		<div class="container">
			<div class="mb-3 row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<p class="form-control-plaintext"><c:out value='${row.id }'/>
				</div>
			</div>
				
			<div class="mb-3 row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<p class="form-control-plaintext"><c:out value='${row.name }'/>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<p class="form-control-plaintext"><c:out value='${row.gender }'/>
				</div>
			</div>
			  <div class="mb-3 row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-10  ">
				  <div class="row">
					<div class="col-sm-2">
					<p class="form-control-plaintext"><c:out value='${row.birth }'/>
					</div>
				  </div>
				</div>
			</div>
			  <div class="mb-3 row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
				  <div class="row">
				    <div class="col-sm-4">
					  <p class="form-control-plaintext"><c:out value='${row.mail }'/>
					</div>
				  </div>
				</div>
			  </div>
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<p class="form-control-plaintext"><c:out value='${row.phone }'/>
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<p class="form-control-plaintext"><c:out value='${row.address }'/>
				</div>
			</div>
			
		</div>
		<a href="updateMember.jsp" class="btn btn-primary btn-lg">수정</a>
		<a href="deleteMember.jsp" class="btn btn-primary btn-lg">탈퇴</a>
		
	</c:forEach>
	
		   <jsp:include page="/footer.jsp" />  
  </div>	
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm'); 
		for (i = 0, j = selectBirth.length; i < j; i++){
			if (selectBirth.options[i].value == val){
				selectBirth.options[i].selected = true; 
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>