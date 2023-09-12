<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="dto.LessonDto"%>
<%@page import="dao.LessonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
LessonDao ldao = new LessonDao();
LessonDto ldto = new LessonDto();

String loginok = (String)session.getAttribute("loginok");
NumberFormat nf = NumberFormat.getInstance();
%>
<style type="text/css">
.swipertitle {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.swiper-img { cursor: pointer; }
.se02_myclass, .se02_cart { cursor: pointer; }
</style>

<script type="text/javascript">
$(function(){
	
	//클래스 선택시 detail page 이동
	$(".swiper-img").click(function() {
		//태그에 넣어둔 lnum
		var lnum=$(this).attr("lnum");
		//alert(lnum); num값 넘어오는지 확인
		location.href='index.jsp?boramMain=detail/detailpage.jsp?lnum='+lnum;		
	});
	
	
	//section02 배너 클릭시 로그인 확인 후 페이지 이동
	$(".se02_myclass").click(function() {
		<%if(loginok==null){%>
		<!-- 로그아웃 상태 -->
		location.href='index.jsp?boramMain=login/loginform.jsp';
		<%}else{%>
		<!-- 로그인 상태 -->
		location.href='index.jsp?boramMain=mypage/myclass.jsp';
		<%}%>
	});
	
	$(".se02_cart").click(function() {
		<%if(loginok==null){%>
		<!-- 로그아웃 상태 -->
		location.href='index.jsp?boramMain=login/loginform.jsp';
		<%}else{%>
		<!-- 로그인 상태 -->
		location.href='index.jsp?boramMain=cart/mycartform.jsp';
		<%}%>
	});
	
});
</script>
</head>

<body>

	<div class="main"> <!-- 메인 시작 -->

		<!-- 상단 배너 시작 -->
			<div class="swiper mySwiper banner">
				<div class="swiper-wrapper">
					<div class="swiper-slide banner">
						<img src="image/banner-01.png" alt="">
					</div>
                	<div class="swiper-slide banner">
                  		<img src="image/banner-02.png" alt="">   
                	</div>
                	<div class="swiper-slide banner">
                  		<img src="image/banner-03.png" alt="">   
                	</div>
                	<div class="swiper-slide banner">
                  		<img src="image/banner-04.png" alt="">   
                	</div>
                	<div class="swiper-slide banner">
                  		<img src="image/banner-05.png" alt="">   
                	</div>
                	<div class="swiper-slide banner">
                  		<img src="image/banner-06.png" alt="">   
                	</div>
                	<div class="swiper-slide banner">
                  		<img src="image/banner-07.png" alt="">   
                	</div>
              	</div>

              	<div class="swiper-pagination "></div>
			</div>
		<!-- 상단 배너 끝 -->


		<!-- 카테고리 아이콘 시작 -->			
	        <div class="category">
	            <a href="index.jsp?boramMain=category/category.jsp?category=a">
	                <span class="c01"><img src="image/ico-c-1.png" alt=""></span><br>
	                운동
	            </a>
	            <a href="index.jsp?boramMain=category/category.jsp?category=b">
	                <span class="c02"><img src="image/ico-c-2.png" alt=""></span><br>
	                요리
	            </a>
	            <a href="index.jsp?boramMain=category/category.jsp?category=c">
	                <span class="c03"><img src="image/ico-c-3.png" alt=""></span><br>
	                미술
	            </a>
	            <a href="index.jsp?boramMain=category/category.jsp?category=d">
	                <span class="c04"><img src="image/ico-c-4.png" alt=""></span><br>
	                사진/영상
	            </a>
	            <a href="index.jsp?boramMain=category/category.jsp?category=e">
	        		<span class="c05"><img src="image/ico-c-5.png" alt=""></span><br>
	                개발
	            </a>
	            <a href="index.jsp?boramMain=category/category.jsp?category=f">
	                <span class="c06"><img src="image/ico-c-6.png" alt=""></span><br>
	                음악
	            </a>
	            <a href="index.jsp?boramMain=category/category.jsp?category=g">
	               <span class="c07"><img src="image/ico-c-7.png" alt=""></span><br>
	                외국어
	            </a>
	            <a href="index.jsp?boramMain=category/category.jsp?category=h">
	                <span class="c08"><img src="image/ico-c-8.png" alt=""></span><br>
	                기타
	            </a>
	        </div>
		<!-- 카테고리 아이콘 끝 -->


		<!-- section01 인기 클래스 시작 -->
        <div class="section01">
            <p class="title">지금바로 원하는 클래스를 찾아보세요!</p>
            <div class="tags">
                <img src="image/tag-1.png" alt="">
                <img src="image/tag-2.png" alt="">
                <img src="image/tag-3.png" alt="">
                <img src="image/tag-4.png" alt="">
            </div>
            
			<!-- 메인 슬라이드 시작 -->      
	        <div class="po-slider">
	        	<div class="swiper mySwiper mainswiper">
	        		<div class="swiper-wrapper mainswiper" >
		                <%
		                //List<LessonDto> list = ldao.getAllDatas();
		                List<LessonDto> list = ldao.getAllLimitData(12);
		                for(LessonDto dto:list)
		                {
		                %>
		                	<div class="swiper-slide mainswiper">
		                	<div class="imgbox">
		                		<img src="savePhoto/<%=dto.getPhoto() %>" class="swiper-img" lnum="<%=dto.getLnum() %>">
		                	</div>
								<p class="swipertitle"><%=dto.getTitle() %></p>
								<p class="money"><%=nf.format(dto.getPrice()) %>원</p>
		                	</div>
		                <%
		                }
		                %>
					</div>       
				</div>
				<div class="swiper-button-next mainswiper"></div>
				<div class="swiper-button-prev mainswiper"></div> 
			</div>
			<!-- 메인 슬라이드 끝 -->
			
		</div>
		<!-- section01 인기 클래스 끝 -->


		<!-- section02 VOD/카트 배너 시작 -->
        <div class="section02">
            <div class="se02_myclass">
                <span><b>VOD! 집에서 편하게 집중하는 나만의 클래스</b><br>BORAM3 나의 클래스</span>
                <img src="image/ico-vod.png" alt="">
            </div>
            <div class="se02_cart">
                <span><b>결제하고 보람차게 수업듣자</b><br>BORAM3 장바구니</span>
                <img src="image/ico-market.png" alt="">
            </div>
        </div>
        <!-- section02 VOD/카트 배너 끝 -->
        

		<!-- section03 요리 클래스 시작 -->
        <div class="section03">
			<p class="title">BORAM3 요리를 부탁해</p>
			
			<!-- 서브1 슬라이드 -->
			<div class="po-slider">
				<div class="swiper mySwiper sub01">
					<div class="swiper-wrapper sub01">
		                <%
		                List<LessonDto> sub1list = ldao.getCategoryPersonData("요리", 12);
		                for(LessonDto dto:sub1list)
		                {
		                %>
		                	<div class="swiper-slide sub01">
		                	<div class="imgbox">
		                		<img src="savePhoto/<%=dto.getPhoto() %>" class="swiper-img" lnum="<%=dto.getLnum() %>">
		                	</div>
								<p class="swipertitle"><%=dto.getTitle() %></p>
		                	</div>
		                <%
		                }
		                %>
            		</div>             
          		</div>
				<div class="swiper-button-next sub01"></div>
				<div class="swiper-button-prev sub01"></div>
			</div>                   
		</div>
		<!-- section03 요리 클래스 끝 -->
        
        
		<!-- section03 외국어(영어) 클래스 시작 -->
        <div class="section03-2">
			<p class="title">BORAM의 영어 노하우</p>
			
			<!-- 서브2 슬라이드 -->
			<div class="po-slider">      
				<div class="swiper mySwiper sub02">
	            	<div class="swiper-wrapper sub02">
		                <%
		                //List<LessonDto> sub2list = ldao.getCategoryPersonData("외국어", 12);
		                List<LessonDto> sub2list = ldao.getEnglishData("영어", "영포자", "토익", "토플", "오픽");
		                for(LessonDto dto:sub2list)
		                {
		                %>
		                	<div class="swiper-slide sub02">
		                	<div class="imgbox">
		                		<img src="savePhoto/<%=dto.getPhoto() %>" class="swiper-img" lnum="<%=dto.getLnum() %>">
		                	</div>
								<p class="swipertitle"><%=dto.getTitle() %></p>
		                	</div>
		                <%
		                }
		                %>
	            	</div>             
				</div>
				<div class="swiper-button-next sub02"></div>
				<div class="swiper-button-prev sub02"></div>
			</div>                
		</div>
		<!-- section03 외국어(영어) 클래스 끝 -->
        

		<!-- section04 개발자 소개 시작 -->
        <div class="section04">
            <p class="title">BORAM3 개발자 소개</p>

	        <div class="se04layout">
	            <span>
	             	<a href="https://github.com/Leedasol2" target="_blank"><img src="image/dasol.png" alt=""></a>
	                <p class="name">이다솔</p>
	                <p class="job">백엔드 개발자</p>
	                <p class="mark"><img src="image/ico-star.png" alt="">5.0(24)</p>
	            </span>
	
	            <span>
	                <a href="https://github.com/cocohyuncoco" target="_blank"><img src="image/hyun.png" alt=""></a>
	                <p class="name">임현정</p>
	                <p class="job">백엔드 개발자</p>
	                <p class="mark"><img src="image/ico-star.png" alt="">5.0(24)</p>
	            </span>
	
	            <span>
	                <a href="https://github.com/cdkfk96" target="_blank"><img src="image/ara.png" alt=""></a>
	                <p class="name">조아라</p>
	                <p class="job">백엔드 개발자</p>
	                <p class="mark"><img src="image/ico-star.png" alt="">5.0(25)</p>
	            </span>
	
	            <span>
	                <a href="https://github.com/Wyna2" target="_blank"><img src="image/nari.png" alt=""></a>
	                <p class="name">강나리</p>
	                <p class="job">백엔드 개발자</p>
	                <p class="mark"><img src="image/ico-star.png" alt="">5.0(28)</p>
	            </span>
	
	            <span>
	                <a href="https://github.com/sjihwan" target="_blank"><img src="image/jihwan.png" alt=""></a>
	                <p class="name">신지환</p>
	                <p class="job">백엔드 개발자</p>
	                <p class="mark"><img src="image/ico-star.png" alt="">5.0(25)</p>
	            </span>
	
	            <span>
	                <a href="https://github.com/donghyun0502" target="_blank"><img src="image/dong.png" alt=""></a>
	                <p class="name">차동현</p>
	                <p class="job">백엔드 개발자</p>
	                <p class="mark"><img src="image/ico-star.png" alt="">5.0(25)</p>
	            </span>
	        </div>
		</div>
		<!-- section04 개발자 소개 끝 -->
        

		<!-- section05 운동 클래스 시작 -->
		<%
		
		%>
        <div class="section05">
            <p class="title">BORAM3과 함께하는 슬기로운 운동생활 </p>
                  
			<!-- 서브3 슬라이드 -->   
			<div class="po-slider">     
				<div class="swiper mySwiper sub03">
					<div class="swiper-wrapper sub03">	                
		                <%
		                List<LessonDto> sub3list = ldao.getCategoryPersonData("운동", 12);
		                for(LessonDto dto:sub3list)
		                {
		                %>
		                	<div class="swiper-slide sub03">
			                	<div class="imgbox">
			                		<img src="savePhoto/<%=dto.getPhoto() %>" class="swiper-img" lnum="<%=dto.getLnum() %>">
			                	</div>
				                <p class="swipertitle"><%=dto.getTitle() %></p>
		                	</div>
		                <%
		                }
		                %>
					</div>
				</div>
				<div class="swiper-button-next sub03"></div>
				<div class="swiper-button-prev sub03"></div>    
			</div>
		</div>
		<!-- section05 운동 클래스 끝 -->


    </div><!-- 메인 끝 -->
</body>

</html>
