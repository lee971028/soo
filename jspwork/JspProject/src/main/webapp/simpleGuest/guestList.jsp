<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.simpleguest.SimpleGuestDao"%>
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
	SimpleGuestDao dao=new SimpleGuestDao();
	ArrayList<SimpleGuestDto> list=dao.getAllGuests();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<body>
<div style="margin: 50px; 100px;">
<button type="button" class="btn btn-outline-success"
  	onclick="location.href='insertForm.jsp'">글쓰기</button><br><br>
  	
  <%
    for(int i=0;i<list.size();i++)
    {
    	SimpleGuestDto dto=list.get(i);
    	int no=list.size()-i;
    	%>
    	
    	<table class="table" style="width: 500px;">
    	  <tr>
    	     <td>
    	       <b>No.<%=no %></b>
    	       <b><%=dto.getNick() %></b>
    	     </td>
    	     <td align="right">
    	        <b style="color: gray;"><%=sdf.format(dto.getWriteday()) %></b>
    	     </td>
    	  </tr>
    	  
    	  <tr height="150">
    	    <td colspan="2" >
    	    
    	      <img alt="" src="../avata/b<%=dto.getImage()%>.png"
    	      align="left" width="100px;" hspace="20">
    	    
    	      <pre>
    	        <%=dto.getStory() %>
    	      </pre>
    	      
    	     
    	    </td>
    	  </tr>
    	  
    	</table>
    	
    	<div style="position: absolute; left: 450px;">
    	    <input type="button" value="수정" 
    	    onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'"
    	   class="btn btn-success btn-sm">
    	   <input type="button" value="삭제" onclick="location.href=''"
    	   class="btn btn-warning btn-sm">
    	   
    	</div>
    	  
    	<br><br>
    <%}
  %>	
  	
  	
  	
 </div>
</body>
</html>