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
<!-- 리뷰 수정 -->
<%
request.setCharacterEncoding("utf-8");

/* 파라마터 받기 */
String rnum = request.getParameter("rnum");
String lnum = request.getParameter("lnum");
String mnum = request.getParameter("mnum");
int rstar = Integer.parseInt(request.getParameter("rating"));
String rcontents = request.getParameter("content");

/* DTO세팅 */
ReviewDto dto = new ReviewDto();
dto.setRnum(rnum);
dto.setLnum(lnum);
dto.setMnum(mnum);
dto.setRstar(rstar);
dto.setRcontents(rcontents);

//dao.updateReview호출
ReviewDao dao = new ReviewDao();
dao.updateReview(dto);

response.sendRedirect("../index.jsp?boramMain=mypage/myreview.jsp");
%>
<body>

</body>
</html>