<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.LessonDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.LessonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson db 확인</title>
</head>
<%
//dao 선언
LessonDao dao = new LessonDao();
List<LessonDto> list = dao.getAllDatas();
%>
<body>

<table class="table table-bordered" style="width: 1850px;">
  <caption><b>Lesson db 확인</b>
  </caption>
    <tr style="background-color: #ffc0cb;">
      <th style="width: 30px;">번호</th>
      <th style="width: 150px;">제목</th>
      <th style="width: 80px;">작성자</th>
      <th style="width: 80px;">카테고리</th>
      <th style="width: 80px;">가격</th>
      <th style="width: 450px;">내용</th>
      <th style="width: 100px;">이미지</th>
      <th style="width: 100px;">작성일</th>
      <th style="width: 50px;">수강생</th>
    </tr>
    
    <%
    //출력할 날짜 형식
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
    for(LessonDto dto:list)
    {
    	%>
    	<tr>
    	
    	<!-- 번호 -->
    	<td align="center"><%=dto.getLnum() %></td>
    	
    	<!-- 제목 -->
    	<td align="center"><%=dto.getTitle() %></td>
    	
    	<!-- 작성자 -->
    	<td align="center"><%=dto.getTutor() %></td>
    	
    	<!-- 카테고리 -->
    	<td align="center"><%=dto.getCategory() %></td>
    	
    	<!-- 가격 -->
    	<td align="center"><%=dto.getPrice() %></td>
    	
    	<!-- 내용 -->
    	<td align="left"><%=dto.getIntro() %></td>
    	
    	<!-- 이미지 -->
    	<td>
    		<img alt="" src="<%=dto.getPhoto() %>"
    		style="width: 100px; height: 50px;">
    	</td>
    	
    	<!-- 작성일(format 형식으로) -->
    	<td align="center"><%=sdf.format(dto.getRegistday()) %></td>
    	
    	<!-- 수강생 -->
    	<td align="center"><%=dto.getPerson() %></td>
    	
    	</tr>
    <%}%>

</table>


</body>
</html>