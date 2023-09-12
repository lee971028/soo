<%@page import="dao.LessonDao"%>
<%@page import="dto.CartDto"%>
<%@page import="dto.LessonDto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dto.SignupDto"%>
<%@page import="dao.SignupDao"%>
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
LessonDao ldao=new LessonDao();
String cnum=request.getParameter("cnum");

//cart에서 lnum과 mnum 받아오기
SignupDao sdao=new SignupDao();
String lnum=sdao.getCartLnum(cnum);
String mnum=sdao.getCartMnum(cnum);

//수강클래스로 담기
sdao.insertSignup(lnum, mnum);

//중복으로 담기지 않도록 담긴클래스는 장바구니에서 삭제
ldao.deleteCart(cnum);

//마이클래스로 이동
response.sendRedirect("../index.jsp?boranMain=mypage/myclass.jsp");
%>

</body>
</html>