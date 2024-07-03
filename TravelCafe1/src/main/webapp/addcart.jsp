<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>

<%
  String id = request.getParameter("id");
  if (id == null || id.trim().equals("")) {
	  response.sendRedirect("articles.jsp");
	  return;
  }
  
  ArticleRepository dao=ArticleRepository.getInstance();
  Article article = dao.getArticleById(id);
  
  if (article == null) {
	  response.sendRedirect("exceptionNoBookId.jsp");
	  return;
  }
  
  ArrayList<Article> goodsList = dao.getAllArticles();
  Article goods = new Article();
  
  for (int i = 0; i < goodsList.size(); i++) {
	  goods = goodsList.get(i);
	  if (goods.getArticleId().equals(id)) {
		  break;
	  }
  }
  
  ArrayList<Article> bookmarklist = (ArrayList<Article>) session.getAttribute("bookmarklist");
  if (bookmarklist == null) {
	  bookmarklist = new ArrayList<Article>();
	  session.setAttribute("bookmarklist", bookmarklist);
  }
  
  
  
  response.sendRedirect("article.jsp?id=" + id);
%>