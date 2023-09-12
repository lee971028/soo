<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.LessonDao"%>
<%@page import="dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReviewDao"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function deleteReview() {
    return confirm("해당 리뷰를 정말 삭제하시겠습니까?"); 
    
}

</script>

</head>
<%
	String loginok = (String)session.getAttribute("loginok");
	String email = (String)session.getAttribute("emailok");
	
	//로그인 중인 회원 이름 + mnum 받아오기
	MemberDao mdao = new MemberDao();
	String name = mdao.getName(email);
	String mnum = mdao.getMnum(email);

	//로그인중인 사용자의 리뷰 리스트 불러오기
	ReviewDao rdao=new ReviewDao();
	List<ReviewDto> list=rdao.getMyReview(mnum);
	
	//클래스의 이름을 얻기위한 dao 선언
	LessonDao ldao=new LessonDao();
	
	//날짜 출력 양식
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>

<div class="main-myprofile">
 
  <div class="toptoolbar">
     <!-- 상단 사용자이름 출력 -->
     <span class="welcomename"><%=name %>님 안녕하세요</span>
       <br><br><br>
       
    <!-- 나의프로필,나의클래스,나의리뷰 선택버튼 -->
    <a href="index.jsp?boramMain=mypage/myprofile.jsp" class="myprofile">나의 프로필</a>
	<a href="index.jsp?boramMain=mypage/myclass.jsp" class="myclass">나의 클래스</a>
	<a href="index.jsp?boramMain=mypage/myreview.jsp" class="myreview mypageActive">나의 리뷰</a>
    <br><br>
         
  </div>

<!-- 나의리뷰 목록 -->
 <div class="myreviewlist">
 	
 	<table>
 		<tbody>
	 		<%
	      	for(ReviewDto dto:list){
	      		String title=ldao.getLessonTitle(dto.getLnum());
	      	%>
	 			
	            <tr>
	                <th><a href="index.jsp?boramMain=detail/detailpage.jsp?lnum=<%=dto.getLnum() %>" class="reviewDetail"><%=title %></a> 
	                	 <div class="star-review">
	                	 	<%
	                	 	int star=dto.getRstar();
	                	 	for(int i=1;i<=star;i++){
	                	 		%>
	                	 		<img src="image/ico-star.png">
	                	 	<%}
	                	 	for(int i=0;i<5-star;i++){
	                	 		%>
	                	 		<img src="image/ico-starout.png">
	                	 	<%}%>
	                        <span>(<%=star %>)</span>
	                        <a href="index.jsp?boramMain=review/u_writeReview.jsp?lnum=<%=dto.getLnum() %>&rnum=<%=dto.getRnum() %>">수정</a> | <a href="review/reviewDelAction.jsp?rnum=<%=dto.getRnum() %>" onclick="return deleteReview()">삭제</a>
	                    </div>		
	                </th>                             
	            </tr>
	            <tr>
	          	   <td><%=dto.getRcontents() %>
	          	   <span class="time"><%=sdf.format(dto.getRday()) %></span></td> 
	            </tr>
	         
           <%} %>
       
         </tbody>
 	</table>
 	
</div>

</div>
</body>
</html>