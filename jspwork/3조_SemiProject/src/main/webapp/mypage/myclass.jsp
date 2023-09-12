<%@page import="dto.LessonDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.SignupDao"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script type="text/javascript">
	$(function() {
		$(".selectclass-img").click(function() {
			var url=$(this).parent().attr("link");
			window.open(url,"_blank");
		})
		$(".lesson-name").click(function() {
			var url=$(this).parent().parent().attr("link");
			window.open(url,"_blank");
		})
	})
</script>
</head>
<%
	String email=(String)session.getAttribute("emailok");
	
	//로그인 중인 회원 이름 + mnum 받아오기
	MemberDao mdao=new MemberDao();
	String name=mdao.getName(email);
	String mnum=mdao.getMnum(email);

	//결제된 클래스 리스트 불러오기
	SignupDao sdao=new SignupDao();
	List<LessonDto> list=sdao.getSignupLesson(mnum);
	int i=0;
%>
<body>

<div class="main-myclass">
 
  <div class="toolbar">
     <!-- 상단 사용자이름 출력 -->
     <span class="welcomename"><%=name %>님 안녕하세요</span>
       <br><br><br>
       
     <!-- 나의프로필,나의클래스,나의리뷰 선택버튼 -->
    <a href="index.jsp?boramMain=mypage/myprofile.jsp" class="myprofile">나의 프로필</a>
	<a href="index.jsp?boramMain=mypage/myclass.jsp" class="myclass mypageActive">나의 클래스</a>
	<a href="index.jsp?boramMain=mypage/myreview.jsp" class="myreview">나의 리뷰</a>
    <br><br>
    
         
  </div>

<!-- 수강클래스 목록 -->
<div class="selectclasslist">
      <table class="selectclass-lesson">
         <tr>      
	      <%
	      for(LessonDto dto:list){%>

            <td>
               <div class="selectclass-lesson" lnum="<%=dto.getLnum() %>" link="<%=dto.getLink()%>">
                    <img src="savePhoto/<%=dto.getPhoto() %>" class="selectclass-img">  
                    <div class="bottomclass">                                         
                     <p class="lesson-name"><%=dto.getTitle() %></p>
                     <a href="index.jsp?boramMain=review/writeReview.jsp?lnum=<%=dto.getLnum() %>" class="writereview">리뷰쓰기</a>
                     </div>
                 </div>
            </td>
				<%//4개씩 끊어서 줄바꾸기
					if((i+1)%4==0){%>	
						</tr>
						<tr>
					<%}
				i++;	
			}
			%>
			</tr>
      </table>
    </div>

</div>
</body>
</html>