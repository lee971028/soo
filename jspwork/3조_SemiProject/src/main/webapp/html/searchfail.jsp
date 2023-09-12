<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BORAM3 클래스 검색결과</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/search.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<!-- [조아라] 검색결과 페이지 -->
<div class="header">
        <div class="headercontent">            
            <a href="main.html" class="logo">
               <img src="../image/logo.png" alt="">
            </a>
            
            <div class="searchbar">
               	<form action="#" method="#">
    			 	<div class="searchinput">
    			 		<div class="searchimg">
    			 			<img alt="검색아이콘" class="simg" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
    			 		</div>
    			 		<input type="search" placeholder="무엇을 배우고 싶나요?" class="searchtext">
    			 		<!-- <div class="searchdel">
    			 			<img alt="검색어 삭제 아이콘" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMgMykiPgogICAgICAgICAgICA8Y2lyY2xlIGZpbGw9IiNDNUM1QzUiIGN4PSI5IiBjeT0iOSIgcj0iOSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS13aWR0aD0iMS41IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im02IDYgNi4wMDUgNi4wMDZNMTIuMDA1IDYgNiAxMi4wMDYiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=">
    			 		</div> -->
    			 		
    			 	</div>
				</form>
            </div>
			<!-- 로그인 전 버튼 -->
            <div class="headerlogin">
                <a href="" class="loginbtn">로그인</a>
                <button type="button" class="gaipbtn">회원가입</button>
            </div>
            <!-- 로그인 후 버튼 -->
              <div class="headerlogout" style="display: none;">
                <a href="" class="logoutbtn">로그아웃</a>
                 <a href="#" class="cart">장바구니 <span class="cnt">0</span></a>
                <button type="button" class="mypage">마이페이지</button>
              </div>
         </div>
    </div>
    
    <div class="searchresult">
    	<span class="sresult">검색결과</span>
		<div class="searchclass">
		<!-- 찾는 클래스가 없을 때 -->
		<span class="search_nofind">해당 클래스가 없습니다!</span>
		<!-- 찾는 클래스가 있을 때 -->
		
		</div>
    </div>
    
    
    
    
    <div class="footer">
        <div class="footercontent">   
        <div class="topfooter">
            <span>
                <p class="footer-hp">3333-3333</p>
                <p class="footer-time">
                	평일 10:00 - 18:00<br>
                	(점심시간 13:00 - 14:00 제외 주말/공휴일 제외)
                </p>
                
                <a href="https://www.apple.com/kr/app-store/">
                    <img src="https://assets.cdn.soomgo.com/icons/icon-download-appstore.svg" alt="앱스토어" class="footerbtn">
                    APP STORE
                </a>
                <a href="https://play.google.com/store/apps">
                    <img src="https://assets.cdn.soomgo.com/icons/icon-download-palystore.svg" alt="플레이스토어" class="footerbtn">
                    PLAY STORE
                </a>
            </span>
            <span class="topfooter-right">
                <span>
                    <p class="contop">고객센터</p>
                    <p>문의하기</p>
                </span>
                <span>
                    <p class="contop">FAQ</p>
                    <p>이용안내</p>
                    <p>안전정책</p>
                    <p>예상금액</p>
                    <p>강사찾기</p>
                </span>
                <span>
                    <p class="contop">고객센터</p>
                    <p>보람가입</p>
                    <p>보람센터</p>
                    <p>보람가이드</p>
                    <p>제품안내</p>
                </span>
                <span>
                    <p class="contop">BORAM3조</p>
                    <p>이다솔</p>
                    <p>임현정</p>
                    <p>강나리</p>
                    <p>조아라</p>
                    <p>차동현</p>
                    <p>신지환</p>
                </span>
            </span>
        </div>
    	</div>
    
	    <div class="footer-bottom">
	        <p>이용약관&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보처리방침&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사업자 정보확인</p>
	        <p class="f-boram3">
	            (주)BORAM3 은 SEMI PROJECT 입니다<br>
	            쌍용교육센터 보람3조 화이팅
	        </p>
	        <br>
	        <p class="f-address">
	            상호명:(주)BORAM3조 · 개인정보책임관리자:BORAM3· 주소:서울특별시 강남구 보람타워 3층<br>
	            사업자등록번호:333-33-33333· 통신판매업신고증:제 3333-서울강남-3333 호 · 직업정보제공사업 신고번호:서울청 제 3333-33호<br>
	            고객센터:3333-333 · 이메일:BORAM3@naver.com<br>
	            Copyright ©Brave Mobile Inc. All Rights Reserved.
	        </p>
	    </div>
	</div>

<script>
		let header = document.querySelector(".header");
		let headerHeight = header.offsetHeight;
		
		window.onscroll = function () {
		  let windowTop = window.scrollY;
		  if (windowTop >= headerHeight) {
		    header.classList.add("drop");
		  } else {
		    header.classList.remove("drop");
		  }
		};
</script>
</body>
</html>
