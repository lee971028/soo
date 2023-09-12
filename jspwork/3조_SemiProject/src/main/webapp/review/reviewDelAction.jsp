<%@page import="dao.ReviewDao"%>
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
String rnum=request.getParameter("rnum");

//리뷰삭제메서드
ReviewDao rdao=new ReviewDao();
rdao.reviewDelete(rnum);

response.sendRedirect("../index.jsp?boramMain=mypage/myreview.jsp");

%>

</body>
</html>