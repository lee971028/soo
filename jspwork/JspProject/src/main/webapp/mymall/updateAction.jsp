<%@page import="model.mymall.MallDao"%>
<%@page import="model.mymall.MallDto"%>
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
	//데이타읽기
	request.setCharacterEncoding("utf-8");
	String no=request.getParameter("no");
	String sangpum = request.getParameter("sangpum");
	String photo = request.getParameter("photo");
	int price = Integer.parseInt(request.getParameter("price"));
	String ipgoday = request.getParameter("ipgoday");
	
	//dto에 담기
	MallDto dto=new MallDto();
	dto.setNo(no);
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	
	//dao선언
	MallDao dao = new MallDao();
	
	//update
	dao.updateMall(dto);
	
	response.sendRedirect("list.jsp");

%>
</body>
</html>