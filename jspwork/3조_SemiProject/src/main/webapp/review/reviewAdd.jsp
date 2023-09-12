<%@page import="dao.ReviewDao"%>
<%@page import="dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- DB에 리뷰 추가 -->
<%
request.setCharacterEncoding("utf-8");
/* 파라마터 받기 */
String lnum = request.getParameter("lnum");
String mnum = request.getParameter("mnum");
int rstar = Integer.parseInt(request.getParameter("rating"));
String rcontents = request.getParameter("content");

/* review DB에 추가 */
//dto세팅
ReviewDto dto = new ReviewDto();
dto.setLnum(lnum);
dto.setMnum(mnum);
dto.setRstar(rstar);
dto.setRcontents(rcontents);

//dao.insertReview호출
ReviewDao dao = new ReviewDao();
dao.insertReview(dto);

response.sendRedirect("../index.jsp?boramMain=mypage/myclass.jsp");
%>
</body>
</html>