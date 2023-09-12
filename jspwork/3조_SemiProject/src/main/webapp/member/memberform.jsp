<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	//이메일 중복체크 버튼 이벤트... emailcheck.jsp(팝업창처럼)
	$(".emailcheck").click(function(){
		//os기준 중앙에 창 뜨게
		var popupWidth=500;
		var popupHeight=300;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		window.open("member/emailcheck.jsp","",'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	});
	
	//가입버튼 클릭시
	$(".gaipBtn").click(function(){
		
		//이용동의 클릭
		var a=$(".chkagree").is(":checked");
		if(a) 
		{
			alert("환영합니다.가입이 완료되었습니다."); 
		}
		//이용동의 클릭 안했을 시
		else{
			alert("이용약관에 동의해주시기 바랍니다.");
		}
		
	});
	
});
</script>
</head>
<body>

<div class="signupdiv">
<span class="signupHead">BORAM3에 오신것을 환영합니다</span>
<div class="signupFrame">
	<form action="member/memberadd.jsp" method="post" class="signupForm" onsubmit="return check(this)" name="mfrm">
		<table>
			<tr>
				<th align="left">이름</th>
			</tr>
			<tr>
				<td>
					<input type="text" required="required" name="name" class="inputbox" placeholder="이름을 입력해주세요">
				</td>
			</tr>
			<tr>
				<th align="left" style="padding-top: 43px;">이메일</th>
			</tr>
			<tr>
				<td class="emailform">
					<input type="text" class="emailinput" name="email" id="email" readonly="readonly" >
					<button class="emailcheck">입력</button>
					
				</td>
			</tr>
			<tr>
				<th align="left" style="padding-top: 30px;">비밀번호</th>
			</tr>
			<tr>
				<td>
					<input type="password" required="required" name="password" class="inputbox" placeholder="비밀번호을 입력해주세요">
				</td>
			</tr>
			<tr class="chkbox">
				<td style="padding-top: 20px; padding-top: 20px; display: flex; align-items: center;">
					<input type="checkbox" required="required" class="chkagree">
					<span><u>이용약관</u>,<u>개인정보 수집 및 이용</u> 동의(필수)</span>
				</td>
			</tr>
			<tr>
				<td class="signupBtn">
					<button type="submit" class="gaipBtn" >회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</div>


</body>
</html>