<%@page import="dto.CartDto"%>
<%@page import="dao.MemberDao"%>
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
request.setCharacterEncoding("utf-8");
/* 클래스번호,회원번호 받고 */
String lnum = request.getParameter("lnum");
String mnum = request.getParameter("mnum");

/* 클래스 번호에 해당하는 클래스 장바구니에 담기 */
LessonDao ldao = new LessonDao();
CartDto cdto = new CartDto();
cdto.setLnum(lnum);
cdto.setMnum(mnum);

ldao.insertCart(cdto);
%>
</body>
</html>