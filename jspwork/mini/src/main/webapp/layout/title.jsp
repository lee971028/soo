<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Gasoek+One&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
  div.cart{
    float: right;
    cursor: pointer;
  }
  .count{
    width: 30px;
    height: 30px;
    float: right;
    background-color: red;
    border-radius: 100px;
    text-align: center;
    line-height:30px;
    z-index: 10;
    position: relative;
    left: -20px;
    top: 10px;
    color: white;
    font-size: 0.8em;
  }
</style>
<script type="text/javascript">
  $(function(){
	  
	  $("div.cart").click(function(){
		  
		  location.href="index.jsp?main=shop/mycart.jsp";
	  });
  });
</script>
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

<div class="cart">
  <%
    ShopDao sdao=new ShopDao();
    //카트갯수
    int cartSize=sdao.getCartList(myid).size();
  %>
   <i class="bi bi-cart3 carticon" style="font-size: 1.2em;"></i>
   <div class="count"><%=cartSize %></div>
</div>
</body>
</html>