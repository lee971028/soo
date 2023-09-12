<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
  //db에 저장할 아이디얻기
  String myid=(String)session.getAttribute("myid");
  
	//실제경로
	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*3;
	
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	
		//num,currentPage
		String num=multi.getParameter("num");
		String currentPage=multi.getParameter("currentPage");
		
		//주의 : requset가 아님 multi변수로 모든 폼데이타를 읽어야 한다
		String content=multi.getParameter("content");
		String photoname=multi.getFilesystemName("photo");
		
		
		//dao
		GuestDao dao=new GuestDao();
		
		//기존 포토 가져오기
		String old_photo=dao.getData(num).getPhotoname();
		
		//dto에 저장
		GuestDto dto=new GuestDto();
		dto.setNum(num);
		dto.setMyid(myid);
		dto.setContent(content);
		dto.setPhotoname(photoname==null?old_photo:photoname);
				
		
		//update
		dao.updateGuest(dto);
		
		//방명록 목록으로 이동..현재수정된 페이지
		response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
	
	}catch(Exception e){
		
	}
	
%>
</body>
</html>