<%@page import="data.dao.MemberDao"%>
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
<%
  //절대경로잡기
  String root=request.getContextPath();
  //로그인세션
  String loginok=(String)session.getAttribute("loginok");
  //아이디얻기
  String myid=(String)session.getAttribute("myid");
  //dao에서 이름얻기
  MemberDao dao=new MemberDao();
  String name=dao.getName(myid);
%>
<body>
<a href="<%=root%>" style="color: black;"><img alt="" src="<%=root%>/image/K-055.png" width="200"
hspace="300"></a>


<%
if(loginok==null){%>
	<button type="button" class="btn btn-success" style="width: 100px;"
	onclick="location.href='index.jsp?main=login/loginform.jsp'">Login</button>
<%}else{%>
    <b style="font-size: "><%=name %>님 로그인중...</b>
	<button type="button" class="btn btn-danger" style="width: 100px;"
	onclick="location.href='login/logoutaction.jsp'">Logout</button>
<%}
%>
</body>
</html>