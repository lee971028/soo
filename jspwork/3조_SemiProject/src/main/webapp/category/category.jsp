<%@page import="java.text.Format"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="dao.LessonDao"%>
<%@page import="dto.LessonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BORAM3 CLASS</title>

<script type="text/javascript">
//url 파라미터 값 가져오기
function getParam(params, paramName) { 
    var returnVal;
    var url = params == '' ? location.href : params;

    //get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

    //나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
    for (var i = 0; i < parameters.length; i++) {
        var varName = parameters[i].split('=')[0];
        if (varName.toUpperCase() == paramName.toUpperCase()) {
        	returnVal = parameters[i].split('=')[1];
            return decodeURIComponent(returnVal);
        }
    }
};	

$(function() {
	$("select.sortSelect").focus(function() {
		$(this).parent().css("background","url('image/arrow-up.png') no-repeat 93% 50%/15px auto");
	});
	$("select.sortSelect").change(function(){ 
		$(this).parent().css("background","url('image/arrow-down.png') no-repeat 93% 50%/15px auto");
	});
	$("select.sortSelect").focusout(function(){ 
		$(this).parent().css("background","url('image/arrow-down.png') no-repeat 93% 50%/15px auto");
	});
	
	//클래스이미지 클릭시 디테일페이지로
	$(".category-img").click(function(){
		var lnum=$(this).attr("lnum");
		location.href='index.jsp?boramMain=detail/detailpage.jsp?lnum='+lnum;
	});	
	//클래스제목 클릭시 디테일페이지로
	$(".lesson-title").click(function(){
		var lnum=$(this).attr("lnum");
		location.href='index.jsp?boramMain=detail/detailpage.jsp?lnum='+lnum;
	});
	
	$("select.sortSelect").change(function(){
		var opt = $(this).val();
		// ?을 기점으로 배열 슬라이스 => ex)http://localhost:8081/SemiProject/src/index.jsp
		var url = location.href.split("?")[0];
		// location.href.split("?")[2]; 와 같음 => ex)category=a&opt=highprice 
		var params = location.href.substring(location.href.indexOf('boramMain='));
		// category의 값을 cate에 넘김
		var cate = getParam(params, 'category');
				
		location.href = url + '?boramMain=category/category.jsp?category=' + cate + '&opt=' + opt;
	});
	
	initSort();
});

function initSort() {
	//opt값을 받아서 select에서 opt값과 일치하는 옵션 selected
	var opt = getParam('', 'opt');
	
	$("#selectopt option").removeAttr('selected');
	
	if (opt == "toppopular") {
		$("#selectopt > option[value='toppopular']").attr("selected","selected");
	} else if (opt == "highprice") {
		$("#selectopt > option[value='highprice']").attr("selected","selected");
	} else if (opt == "lowprice") {
		$("#selectopt > option[value='lowprice']").attr("selected","selected");
	}
}
</script>

</head>
<%
int i=0;

LessonDao ldao = new LessonDao();
LessonDto ldto = new LessonDto();

String category = request.getParameter("category");

request.setAttribute("category", category);

if(request.getAttribute("category").equals("a"))
	category="운동";
else if(request.getAttribute("category").equals("b"))
	category="요리";
else if(request.getAttribute("category").equals("c"))
	category="미술";
else if(request.getAttribute("category").equals("d"))
	category="사진";
else if(request.getAttribute("category").equals("e"))
	category="개발";
else if(request.getAttribute("category").equals("f"))
	category="음악";
else if(request.getAttribute("category").equals("g"))
	category="외국어";
else if(request.getAttribute("category").equals("h"))
	category="기타";
else
	category="기타";

String opt=request.getParameter("opt");
//가격 콤마
NumberFormat nf=NumberFormat.getInstance();
%>
<body>
<%
//클래스 개수
int totalCount=ldao.getTotalCount(category);

String bannerimage=null;

if(request.getAttribute("category").equals("a"))
	bannerimage="image/banner-01.png";
else if(request.getAttribute("category").equals("b"))
	bannerimage="image/banner-02.png";
else if(request.getAttribute("category").equals("c"))
	bannerimage="image/banner-03.png";
else if(request.getAttribute("category").equals("d"))
	bannerimage="image/banner-04.png";
else if(request.getAttribute("category").equals("e"))
	bannerimage="image/banner-05.png";
else if(request.getAttribute("category").equals("f"))
	bannerimage="image/banner-06.png";
else if(request.getAttribute("category").equals("g"))
	bannerimage="image/banner-07.png";
else if(request.getAttribute("category").equals("h"))
	bannerimage="";
%>
<!-- 본문 시작 -->
<div class="category-main">

    <!-- 베너 -->
    <div class="category_banner">
      <img alt="" src="<%=bannerimage%>">
    </div>
    
    <!-- 카테고리아이콘 -->
	<div class="category-icon">
         <a href="index.jsp?boramMain=category/category.jsp?category=a">
             <span class="c01">
             	 <img src="image/ico-c-1.png" alt="">   
             </span>
             <br>
             운동
         </a>
         <a href="index.jsp?boramMain=category/category.jsp?category=b">
             <span class="c02">
             	 <img src="image/ico-c-2.png" alt="">   
             </span>
             <br>
             요리
         </a>
         <a href="index.jsp?boramMain=category/category.jsp?category=c">
             <span class="c03">
             	 <img src="image/ico-c-3.png" alt="">   
             </span>
             <br>
             미술
         </a>
         <a href="index.jsp?boramMain=category/category.jsp?category=d">
             <span class="c04">
             	 <img src="image/ico-c-4.png" alt="">   
             </span>
              <br>
             사진/영상
         </a>
         <a href="index.jsp?boramMain=category/category.jsp?category=e">
     		<span class="c05">
             	 <img src="image/ico-c-5.png" alt="">   
             </span>
              <br>
             개발
         </a>
         <a href="index.jsp?boramMain=category/category.jsp?category=f">
             <span class="c06">
             	 <img src="image/ico-c-6.png" alt="">   
             </span>
              <br>
             음악
         </a>
         <a href="index.jsp?boramMain=category/category.jsp?category=g">
            <span class="c07">
             	 <img src="image/ico-c-7.png" alt="">   
             </span>
              <br>
             외국어
         </a>
         <a href="index.jsp?boramMain=category/category.jsp?category=h">
             <span class="c08">
             	 <img src="image/ico-c-8.png" alt="">   
             </span>
              <br>
             기타
         </a>
	</div>


    <!-- 클래스리스트 -->
    <div>
		<table class="category-lesson">
			<tr>
				<td colspan="4" align="right">
				    <div class="categoryBar">
						<span class="lessonCnt">
							클래스<span><%=totalCount%></span>개
						</span>
						<span class="sortSelect">
							<select class="sortSelect" name="selectopt" id="selectopt">
								<option value="toppopular" selected="selected">인기도순</option>
								<option value="highprice" >높은가격순</option>
								<option value="lowprice" >낮은가격순</option>
							</select>
						</span>
				    </div>
				</td>
				<td>
				
				</td>
			</tr>

				<tr>
			<%
			if(opt==null)
			{
			List<LessonDto> list = ldao.getCategoryData(category);
			for(LessonDto dto:list)
			{
			%>
					<td>
						<div class="category-lesson">
						<div class="imgbox">
							<img src="savePhoto/<%=dto.getPhoto() %>" alt=""
								class="category-img" lnum="<%=dto.getLnum()%>">
						</div>
							<p class="lesson-title" lnum="<%=dto.getLnum()%>"><%=dto.getTitle() %></p>
							<p class="lesson-price"><%=nf.format(dto.getPrice()) %>원
							<br><br><br>
							</p>
						</div>
					</td>
					<%
				if((i+1)%4==0){%>
				</tr>
				<tr>
					<%}
				i++;	
			}%>
			<%} 
			
			
			
			else if(opt.equals("toppopular")) 
			{	
			List<LessonDto> personlist = ldao.personSort(category);
			for(LessonDto dto:personlist)
			{
			%>
					<td>
						<div class="category-lesson">
						<div class="imgbox">
							<img src="savePhoto/<%=dto.getPhoto() %>" alt=""
								class="category-img" lnum="<%=dto.getLnum()%>">
						</div>
							<p class="lesson-title" lnum="<%=dto.getLnum()%>"><%=dto.getTitle() %></p>
							<p class="lesson-price"><%=nf.format(dto.getPrice()) %>원
							<br><br><br>
							</p>
						</div>
					</td>
					<%
				if((i+1)%4==0){%>
				</tr>
				<tr>
					<%}
				i++;	
			}%>
			<%} 
			
			
			
			else if(opt.equals("highprice")) 
			{
			List<LessonDto> highpricelist = ldao.highpriceSort(category);
			for(LessonDto dto:highpricelist)
			{
			%>
					<td>
						<div class="category-lesson">
						<div class="imgbox">
							<img src="savePhoto/<%=dto.getPhoto() %>" alt=""
								class="category-img" lnum="<%=dto.getLnum()%>">
						</div>
							<p class="lesson-title" lnum="<%=dto.getLnum()%>"><%=dto.getTitle() %></p>
							<p class="lesson-price"><%=nf.format(dto.getPrice()) %>원
							<br><br><br>
							</p>
						</div>
					</td>
					<%
				if((i+1)%4==0){%>
				</tr>
				<tr>
					<%}
				i++;	
			}%>
			<%} 
			
			
			
			else if(opt.equals("lowprice"))
			{
			List<LessonDto> lowpricelist = ldao.lowpriceSort(category);
			for(LessonDto dto:lowpricelist)
			{
			%>
					<td>
						<div class="category-lesson">
						<div class="imgbox">
							<img src="savePhoto/<%=dto.getPhoto() %>" alt=""
								class="category-img" lnum="<%=dto.getLnum()%>">
						</div>
							<p class="lesson-title" lnum="<%=dto.getLnum()%>"><%=dto.getTitle() %></p>
							<p class="lesson-price"><%=nf.format(dto.getPrice()) %>원
							<br><br><br>
							</p>
						</div>
					</td>
					<%
				if((i+1)%4==0){%>
				</tr>
				<tr>
					<%}
				i++;	
			} 
			}%>
			
			
			
				</tr>
			</table>
    </div>
</div>
<!-- 본문 끝 -->

</body>
</html>