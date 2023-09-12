<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Gasoek+One&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
  //num,currentPage읽기
  String num=request.getParameter("num");
  String currentPage=request.getParameter("currentPage");
  //dao선언
  SmartDao dao=new SmartDao();
  //삭제메서드 호출
  dao.deleteSmart(num);
  //목록으로 가기..페이지유지하며
  response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage="+currentPage);
%>
</body>
</html>