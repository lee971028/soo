<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String loginok = (String)session.getAttribute("loginok");
	String email = (String)session.getAttribute("emailok");
	
	MemberDao mdao = new MemberDao();
	String name = mdao.getName(email);
	String num = mdao.getMnum(email);
%>
<body>

		<div class="main-myprofile">
		 
		  <div class="toptoolbar">
		     <!-- 상단 사용자이름 출력 -->
		     <span class="welcomename"><%=name %>님 안녕하세요</span>
		       <br><br><br>
		       
		    <!-- 나의프로필,나의클래스,나의리뷰 선택버튼 -->
		    <a href="index.jsp?boramMain=mypage/myprofile.jsp" class="myprofile mypageActive">나의 프로필</a>
		    <a href="index.jsp?boramMain=mypage/myclass.jsp" class="myclass">나의 클래스</a>
		    <a href="index.jsp?boramMain=mypage/myreview.jsp" class="myreview">나의 리뷰</a>
		    <br><br>
		         
		  </div>
		
		<!-- 인적사항 입력 -->
		 <div class="personaldata">
		 
		   <span class="myprofile-info">이름</span><br>
		    <input type="text" name="name" class="writeinfo" required="required" placeholder="이름을 입력해주세요." id="delName">
		    <br>
		    
		   <span class="myprofile-info">이메일</span><br>
		    <input type="text" name="email" class="writeinfo" required="required" placeholder="이메일을 입력해주세요." id="delEmail">
		    <br>
		    
		   <span class="myprofile-info">비밀번호</span><br>
		    <input type="password" name="pass" class="writeinfo" placeholder="비밀번호를 입력해주세요." required="required" id="delPass">
		    <br>

			 <button type="button" class="dropbutton">탈퇴하기</button>
			 <input type="hidden" id="delnum" value="<%=num %>">
		   
		  </div>
		  
		</div>
		
			   
<script type="text/javascript">
	 
		//삭제확인 이벤트
		$("button.dropbutton").click(function () {		
		//alert(<%=num%>);
		let drop = confirm("정말 탈퇴 하시겠습니까?");
	 	
	 	if (drop==true) {
	 		//num값을 받고
			let mnum= $("#delnum").val();
			
			//이름, 이메일, 비밀번호 읽기
			let name=$("#delName").val();
			let email=$("#delEmail").val();
			let password=$("#delPass").val();			
			//삭제파일 호출
			location.href="member/memberdelete.jsp?mnum="+mnum+"&name="+name+"&email="+email+"&password="+password;
		}
		
	});


</script>
</body>
</html>