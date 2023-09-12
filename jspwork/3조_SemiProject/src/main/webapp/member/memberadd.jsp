<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
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
request.setCharacterEncoding("utf-8");

MemberDto dto=new MemberDto();

String name= request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");

dto.setName(name);
dto.setEmail(email);
dto.setPassword(password);

MemberDao dao=new MemberDao();
dao.insertMember(dto);

//가입되면...로그인페이지로
response.sendRedirect("../index.jsp?boramMain=login/loginform.jsp");
%>
</body>
</html>