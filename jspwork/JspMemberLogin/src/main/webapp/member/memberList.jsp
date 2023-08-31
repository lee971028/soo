<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.model.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Gasoek+One&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.memberlist table{
		width: 1000px;
		border: 2px solid gray;
	}
	
	img{
		width:50px;
		height: 50px;
		border: 1px solid black;
	}
</style>
<script type="text/javascript">
  function funcdel(num)
  {
	  //alert(num);
	 
	  $("#myModal").modal();
	  
	  $("#btnmdel").click(function(){
		   
		  //이동
		   location.href="../member/deleteMember.jsp?num="+num;
	   });
	  
  }
  
  
</script>
</head>
<%
MemberDao dao=new MemberDao();

List<MemberDto>list=dao.getMemberList();


/* 로그인한 본인꺼만 수정/삭제 보이도록.... */
String loginok=(String)session.getAttribute("loginok");
String id=(String)session.getAttribute("idok");
%>
<body>
<%
 if(loginok!=null)
 {%>
	 <button type="button" class="btn btn-danger"
	onclick="location.href='../login/logoutAction.jsp'">로그아웃</button>
	 	 
 <%}else{%>
	 <button type="button" class="btn btn-info" onclick="location.href='../login/loginMain.jsp'">로그인</button>
 <%}
%>


	
<div class="memberlist" style="margin: 30px; 100px;">
	<b>총 <%=list.size()%> 명의 멤버가 있습니다</b>
	
	<br>
	<button type="button" class="btn btn-info"
	onclick="location.href='../member/addForm.jsp'">글쓰기</button><br>
	
	<table class="table table-bordered">
		<caption><b>전체 회원 명단</b></caption>
		<tr bgcolor="#ccc">
			<th width="50">번호</th>
			<th width="100">아이디</th>
			<th width="100">회원명</th>
			<th width="150">핸드폰</th>
			<th width="150">가입일</th>
			<th>관리</th>			
		</tr>
		<%
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		int i=1;
		for(MemberDto dto:list)
		{%>
		  
			<tr align="center">
				<td><%=i++%></td>
				<td><%=dto.getId()%></td>
				<td>
						<img  src="<%=dto.getImage()%>"
							class="img-circle">
						<b><%=dto.getName()%></b>
					
				</td>
				<td><%=dto.getHp() %></td>
				
				<td><%=sdf.format(dto.getGaip()) %></td>
				<td>
				
				<%
				  
				  
				  //로그인한 본인꺼만 나오도록
				  if(loginok!=null && dto.getId().equals(id))
				  {%>
					  <button type="button" class="btn btn-info btn-sm"
					onclick="location.href='../member/updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
					
					<button type="button" class="btn btn-info btn-sm"
					onclick="funcdel(<%=dto.getNum()%>)">삭제</button>	
				  <%}else{%>
					  
					  <h5>권한없음</h5>
				  <%}
				%>
									
				</td>
			</tr>
		<%}
		%>
	</table>
</div>


 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원탈퇴</h4>
        </div>
        <div class="modal-body">
          <p>회원탈퇴를 원하시면<br> [탈퇴확인]을 눌러주세요</p>
          <button type="button" class="btn btn-danger"
          id="btnmdel" num="">탈퇴확인</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<!-- <script type="text/javascript">
   $("#btnmdel").click(function(){
	   
	   //버튼에 있는 num값 읽어오기
	   var num=$(this).attr("num");	
	   //이동
	   location.href="../member/deleteMember.jsp?num="+num;
   });
</script> -->


</body>
</html>