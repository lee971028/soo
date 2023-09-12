<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">
  $(function(){
	  
	  $(".btndelete").click(function(){
		  
		  var num=$(this).attr("num");
		  //alert(num);
		  
		  var ans=confirm("정말 탈퇴하실거에요??");
		  
		  if(ans){
			  location.href="member/deleteme.jsp?num="+num;
		  }
	  });
  });
</script>
</head>
<%
  MemberDao dao=new MemberDao();
  List<MemberDto> list=dao.getAllMembers();
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
  
  String loginok=(String)session.getAttribute("loginok");
  String myid=(String)session.getAttribute("myid");
  
%>
<body>
<div style="margin: 100px 200px;">
  <table class="table table-bordered" style="width: 600px;">
  	<%
    for(MemberDto dto:list)
    {
      if(loginok!=null && myid.equals(dto.getId())){%>
    	  
    	  <tr>
    	   <td style="width: 200px;" align="center" rowspan="5" valign="middle">
    	      <img alt="" src="image/mainImg.png" style="width: 150px; border-radius: 30px;">
    	   </td>
    	   <td>이름: <%=dto.getName() %></td>
    	   <td rowspan="5" width="200" align="center" valign="middle">
    	      <button type="button" class="btn btn-outline-info"
    	      onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'">수정</button><br><br>
    	      <button type="button" class="btn btn-outline-danger btndelete" num=<%=dto.getNum() %>
    	      onclick="location.href=''">탈퇴</button>
    	   </td>
    	   
    	</tr>
    	<tr>
    	   <td>아이디: <%=dto.getId() %></td>
    	</tr>
    	<tr>
    	   <td>핸드폰: <%=dto.getHp() %></td>
    	</tr>
    	<tr>
    	   <td>주소: <%=dto.getAddr() %></td>
    	</tr>
    	<tr>
    	   <td>이메일: <%=dto.getEmail() %></td>
    	</tr>
      <%}
    %>
       
      
    	
    <%}
  %>
  </table>
  </div>
</body>
</html>