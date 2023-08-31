<%@page import="member.model.MemberDto"%>
<%@page import="member.model.MemberDao"%>
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
	String realPath=getServletContext().getRealPath("/upload");
	int uploadSize=1024*1024*3;
	
	System.out.println(realPath);
	
	MultipartRequest multi=null;
	
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
			new DefaultFileRenamePolicy());
	
	//dao선언
	MemberDao dao=new MemberDao();
	//dto
	MemberDto dto=new MemberDto();
	
	dto.setId(multi.getParameter("id"));
	dto.setPass(multi.getParameter("pass"));
	dto.setName(multi.getParameter("name"));
	dto.setHp(multi.getParameter("hp"));
	
	//dto.setImage(multi.getFilesystemName("uploadImage"));
	String photo=multi.getFilesystemName("uploadImage");
	
	if(photo==null)
		dto.setImage("../image/noimage.PNG"); //사진선택안한경우
	else
		dto.setImage("../upload/"+photo);//사진선택한경우
	
	//db에 insert
	dao.insertMember(dto);
	
	//성공후 이동
	response.sendRedirect("memberList.jsp");

%>
</body>
</html>