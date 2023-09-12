<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("loginok");
	session.removeAttribute("emailok");
	response.sendRedirect("../index.jsp");

%>