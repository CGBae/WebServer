<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository"  %>

<%
	String id=request.getParameter("articleId");
	if (id==null || id.trim().equals("")) {
		response.sendRedirect("bookmark.jsp");
		return;
	}
	
	session.invalidate();
	response.sendRedirect("bookmark.jsp");
%>