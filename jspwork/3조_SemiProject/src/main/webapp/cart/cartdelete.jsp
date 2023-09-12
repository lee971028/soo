<%@page import="dao.LessonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

String cnum=request.getParameter("cnum");
LessonDao dao=new LessonDao();
dao.deleteCart(cnum);

%>
</body>
</html>