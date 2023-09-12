<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BORAM3 CLASS</title>
<!-- Link (메인베너)Swiper's CSS -->
<link rel="stylesheet"  href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/category.css">
<link rel="stylesheet" href="css/detailpage.css">
<link rel="stylesheet" href="css/find_password.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/memberform.css">
<link rel="stylesheet" href="css/myCart.css">
<link rel="stylesheet" href="css/myprofile.css">
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet" href="css/writeReview.css">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!-- 제이쿼리링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- alert창 꾸미는 링크 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<%
	//프로젝트 경로구하기
	String root=request.getContextPath();
	String mainPage="layout/main.jsp";	//기본페이지
	
	//url을 통해서 main값을 읽어 메인페이지에 출력한다.
	if(request.getParameter("boramMain")!=null){
		mainPage=request.getParameter("boramMain");
	}
	
%>
<body>
<!-- webapp에 있는 파일임 -->

<div>
	<jsp:include page="layout/header.jsp" />
</div>

<div class="boramMain">
	<jsp:include page="<%=mainPage %>" />
</div>

<div>
	<jsp:include page="layout/footer.jsp" />
</div>


<script>
		
		//[임현정] search바 클릭하면 border color 변경	
		$(".searchtext").on("focus", function(){ 
			$("div.searchinput").css({
		 		"border":"1px solid #1a93ff" 
		 	}); 
		});
	
		//[임현정] search바 클릭 안하면 border color 원래대로 돌아오게
	  $(".searchtext").on("blur", function(){
	   $("div.searchinput").css({
	    "border":"1px solid #e2e2e2"
		    }); 
	    }); 

		//[임현정] header 영역 스크롤 내려도 고정되게
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
		
		  //[임현정] 메인베너
        var swiper = new Swiper(".mySwiper.banner", {
         spaceBetween: 30,
         centeredSlides: true,
         autoplay: {
           delay: 3000,
           disableOnInteraction: false,
         },
         pagination: {
           el: ".swiper-pagination",
           clickable: true,
         },
        // navigation: {
         //  nextEl: ".swiper-button-next",
          // prevEl: ".swiper-button-prev",
        // },
       });
      
       //[임현정] 클래스 메인 슬라이드
       var swipermain = new Swiper(".mySwiper.mainswiper", {
       slidesPerView: 4,        
       spaceBetween: 20,
       autoplay: {
         delay: 5000,
        disableOnInteraction: false,
       },
       navigation: {
       nextEl: ".swiper-button-next.mainswiper",
       prevEl: ".swiper-button-prev.mainswiper",
      },
     });


 	 //[임현정] 클래스 서브01 슬라이드
       var swipersub01 = new Swiper(".mySwiper.sub01", {
       slidesPerView: 4,        
       spaceBetween: 20,
       autoplay: {
          delay: 5000,
          disableOnInteraction: false,
       },
       navigation: {
       nextEl: ".swiper-button-next.sub01",
       prevEl: ".swiper-button-prev.sub01",
      },
     });
     
     
     //[임현정] 클래스 서브02 슬라이드
       var swipersub02 = new Swiper(".mySwiper.sub02", {
       slidesPerView: 4,        
       spaceBetween: 20,
       autoplay: {
          delay: 5000,
          disableOnInteraction: false,
       },
       navigation: {
       nextEl: ".swiper-button-next.sub02",
       prevEl: ".swiper-button-prev.sub02",
      },
     });
     
     //[임현정] 클래스 서브03 슬라이드
       var swipersub03 = new Swiper(".mySwiper.sub03", {
       slidesPerView: 4,        
       spaceBetween: 20,
       autoplay: {
          delay: 5000,
          disableOnInteraction: false,
       },
       navigation: {
       nextEl: ".swiper-button-next.sub03",
       prevEl: ".swiper-button-prev.sub03",
      },
     });

      
</script>
</body>
</html>