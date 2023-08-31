<%@page import="db.simpleboard.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Gasoek+One&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	//num,pass
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	
	SimpleBoardDao dao=new SimpleBoardDao();
	
	//passCheck호출
	boolean delcheck=dao.getCheckPass(num, pass);
	
	if(delcheck){
		dao.deleteBoard(num);
		%>
		<script type="text/javascript">
		alert("삭제되었습니다\n목록으로 이동할게요~~~");
		location.href='boardlist.jsp';
		</script>
	<%}else{%>
		
		<script type="text/javascript">
		  alert("비밀번호가 맞지않아요~~");
		  history.back();
		</script>
	<%}
	
	
%>
</body>
</html>