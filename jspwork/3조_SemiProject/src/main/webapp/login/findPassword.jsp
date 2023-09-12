<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%
	
	//String password = request.getParameter("password");
	
%>
<body>

<div class="findPwdiv">
		<!-- 비밀번호 찾기 헤더 -->
		<span class="findPwHead">비밀번호 찾기</span>
		<div class="findPwFrame">
			<form action="login/findPasswordaction.jsp" method="post" class="findPwForm">
				<table>
					<tr>
						<th align="left">이름을 입력해주세요</th>
					</tr>
					<tr>
						<td>
							<input type="text" required="required" class="inputbox" placeholder="이름을 입력해주세요" name="name" id="name">
						</td>
					</tr>
					<tr>
						<th align="left" style="padding-top: 30px;">가입한 이메일 주소를 입력해주세요</th>
					</tr>
					<tr>
						<td>
							<input type="text" required="required" class="inputbox" placeholder="이메일을 입력해주세요" name="email" id="email">
						</td>
					</tr>
					<tr>
						<td class="findPwBtn">
							<!-- 클릭시 submit <span>비밀번호 찾기</span>-->							
							<button type="button" id="passLook">비밀번호 찾기</button>
						</td>
					</tr>
					<tr>
						<td class="preText">
<pre>
가입하신 이름과 이메일주소를 입력하고
비밀번호 찾기 버튼을 눌러주세요
비밀번호를 알려드립니다
</pre>							
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" readonly="readonly" class="inputbox" id="password">
						</td>
					</tr>
				</table>
			</form>
		</div>
</div>


<script type="text/javascript">
	
	
	$("#passLook").click(function () {
		//alert("클릭");
		let name = $("#name").val();
		let email =  $("#email").val();
		//alert(name);
		//alert(email);
		
		$.ajax({
			type:"post",
			dataType:"html",
			url:"login/findPasswordaction.jsp",
			data:{"name":name, "email":email},
			success: function (data) {
				//alert("성공");
				$("#password").val(data);
			}
		});
		
	})
</script>
</body>
</html>