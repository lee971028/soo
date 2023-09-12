<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

    <form action="login/loginaction.jsp" method="post">
    <div class="main_login">
    	<span class="f_login">로그인</span>
		<div class="box_main_white">
			<div>
			  <span class="f_email">이메일</span>
			  <input type="text" name="email" class="email_input" placeholder="이메일을 입력해주세요." required="required">
			</div>
			
			<div>
			  <span class="f_password">비밀번호</span>
			  <input type="password" name="password" class="password_input" placeholder="비밀번호를 입력해주세요." required="required">
			</div>
					
			<div class="f_pw_search" onclick="location.href='index.jsp?boramMain=login/findPassword.jsp'">비밀번호 찾기</div>
			
			<div>
			  <button type="submit" class="bt_email_login">이메일 로그인</button>
			  <button type="button" class="bt_kakao_login" id="kakaoLogin"><img src="image/ico-kakao.png"> Kakao로 시작하기</button>
			  <button type="button" class="bt_gaip_login" onclick="location.href='index.jsp?boramMain=member/memberform.jsp'">계정이 없으신가요?</button>
			</div>
		</div>
    </div>
    </form>
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
   
        function saveToDos(token) { //item을 localStorage에 저장합니다. 
            typeof(Storage) !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token)); 
        };

        window.Kakao.init('52988c2b58e5716ae57a779b78d54157');
        
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣고
                success: function(response) {
                    saveToDos(response.access_token)  // 로그인 성공하면 사용자 엑세스 토큰 sessionStorage에 저장
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            alert('BORAM3 로그인을 환영합니다');
                            window.location.href='index.jsp'
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        };

        const login = document.querySelector('#kakaoLogin');
        login.addEventListener('click', kakaoLogin);
    </script>
</body>
</html>