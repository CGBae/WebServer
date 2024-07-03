<%@ page contentType="text/html; charset=UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
 
 <header class="pb-3 mb-4 border-bottom">
   <div class="container ">  
   <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">  
     <a href="../welcome.jsp" class="d-flex align-items-center text-dark text-decoration-none">
      <svg  width="32" height="32" fill="Green" class="bi bi-box-fill" viewBox="0 0 16 16">
  			<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
  			<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
	 </svg>   
     <span class="fs-4">Cafe</span>
     </a>    
      <ul class="nav nav-pills">
      
        <c:choose>
          <c:when test="${empty sessionId}">
            <li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인 </a></li>
            <li class="nav-item"><a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">회원 가입</a></li>
          </c:when>
            <c:otherwise>
            <li style="padding-top: 7px"> [<%=sessionId%>님]</li>
            <li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃 </a></li>
            <li class="nav-item"><a class="nav-link" href="<c:url value="/member/Information.jsp"/>">내 정보</a></li>

        	<li class ="nav-item"><a class="nav-link" href= "<c:url value="/bookmark.jsp"/>" >북마크</a></li>
            <li class ="nav-item"><a class="nav-link" href= "<c:url value="/addArticle.jsp"/>" >후기 추가</a></li>
        	<li class ="nav-item"><a class="nav-link" href= "<c:url value="/articles.jsp"/>" >후기 목록</a></li>
        	<li class= "nav-item"><a class="nav-link" href= "<c:url value="/editArticle.jsp?edit=update"/>" >후기 수정</a></li>
        	<li class= "nav-item"><a class="nav-link" href= "<c:url value="/editArticle.jsp?edit=delete"/>" >후기 삭제</a></li>
        	<li class ="nav-item"><a class="nav-link" href= "<c:url value="/BoardListAction.do?pageNum=1"/>" >자유 게시판</a></li>

          
         
            
          </c:otherwise>
        </c:choose>                
      
        
      </ul> 
    </div>
  </div>  
      
</header>    