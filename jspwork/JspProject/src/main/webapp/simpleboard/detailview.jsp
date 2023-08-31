<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.SimpleBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Gasoek+One&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
  span.day{color: #ccc; font-size: 0.8em;}
  
  body *{
    font-family: 'Gaegu';
    font-size: 25px;
  }
</style>
</head>
<body>
<jsp:useBean id="dao" class="db.simpleboard.SimpleBoardDao"/>
<%
	//num을 읽는다
	String num=request.getParameter("num");

  //dao선언
  //조회수 1증가
  dao.updateReadCount(num);
  //dto
  SimpleBoardDto dto=dao.getBoard(num);
  
  //날짜형식
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<div style="margin: 30px 30px; width: 500px;">
<h3><b><%=dto.getSubject() %></b></h3>
  <table class="table table-bordered">
     <tr>
      <td>
        <b>작성자: <%=dto.getWriter() %></b><br>
        <span class="day"><%=sdf.format(dto.getWriteday()) %>
          &nbsp;&nbsp;&nbsp;조회: <%=dto.getReadcount() %>
        </span>
      </td>
    </tr>
    
    <tr height="150">
      <td>
      <!--pre태그안에 쓰거나 replace()이용한다:db저장시 br태그가 \n으로 저장된다..그러므로
      출력시 다시 br로변환  -->
        <%=dto.getStory().replace("\n", "<br>") %>
      </td>
    </tr>
    
    <tr>
      <td align="right">
        <button type="button" class="btn btn-outline-success btn-sm"
        onclick="location.href='addform.jsp'"><i class="bi bi-pencil-fill"></i>글쓰기</button>
        <button type="button" class="btn btn-outline-success btn-sm"
        onclick="location.href='boardlist.jsp'"><i class="bi bi-card-list"></i>목록</button>
        <button type="button" class="btn btn-outline-success btn-sm"
        onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-pencil-square"></i>수정</button>
        <button type="button" class="btn btn-outline-success btn-sm"
        onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-trash"></i>삭제</button>
      </td>
    </tr>
  </table>
</div>
</body>
</html>