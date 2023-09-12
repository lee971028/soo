<%@page import="dto.LessonDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.LessonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	//클래스제목 클릭시 디테일페이지로
	$(".lesson-t").click(function(){
		var lnum=$(this).attr("lnum");
		location.href='index.jsp?boramMain=detail/detailpage.jsp?lnum='+lnum;
	});
	//클래스이미지 클릭시 디테일페이지로
	$(".searchclass-img").click(function(){
		var lnum=$(this).attr("lnum");
		location.href='index.jsp?boramMain=detail/detailpage.jsp?lnum='+lnum;
	});
});

</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String searchtext=request.getParameter("searchtext");

LessonDao ldao=new LessonDao();
List<LessonDto> list=ldao.getSearch(searchtext);
%>

	<div class="searchresult">
		<span class="sresult">검색결과</span>
		  <div class="searchclass">

			<!-- 찾는 클래스가 있을 때 -->
			<!-- 클래스 목록 -->
			<div class="searchclasslist">
				<table class="searchclass-lesson">
					<tr>
					<%
					int i=0;
					if(list.size() != 0){
					for(LessonDto dto:list)
					{
					%>
						<td>
							<div class="searchclass-lesson">
								<img src="savePhoto/<%=dto.getPhoto() %>" alt=""
									class="searchclass-img" lnum=<%=dto.getLnum() %>>
								<div class="classbottom">
									<p class="lesson-t" lnum=<%=dto.getLnum() %>><%=dto.getTitle() %></p>
									<p class="lesson-p"><%=dto.getPrice() %>원</p>
								</div>
							</div>
						</td>
						<%
							if((i+1)%4==0){%>	
							</tr>
							<tr>
						<%}
							i++;	
						}%>
					</tr>
					<%}
					else{%>
						<span class="search_nofind">해당 클래스가 없습니다!</span>
					<%}%>
				</table>
			</div>
		</div>
	</div>



</body>
</html>