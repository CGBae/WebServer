<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>

<%
  	String id=request.getParameter("id");
  	if (id==null || id.trim().equals("")) {
	  response.sendRedirect("books.jsp");
	  return;
  	}
  
  	ArticleRepository dao=ArticleRepository.getInstance();
  
  	Article article = dao.getArticleById(id);
  	if (article==null) {
		  response.sendRedirect("exceptionNoBookId.jsp");
  	}
 	
  	ArrayList<Article> bookmarkList=(ArrayList<Article>) session.getAttribute("bookmarklist");
  	Article goodsQnt=new Article();
  	for (int i = 0; i < bookmarkList.size(); i++) {
  		goodsQnt=bookmarkList.get(i);
  		if (goodsQnt.getArticleId().equals(id)) {
  			bookmarkList.remove(goodsQnt);
  		}
  	}
 
  	response.sendRedirect("cart.jsp");
%>