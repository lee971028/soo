<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String loginok = (String)session.getAttribute("loginok");
	String email = (String)session.getAttribute("emailok");
	
	MemberDao dao = new MemberDao();
	String name = dao.getName(email);

	if(loginok==null || loginok.equals("")){%>
		<jsp:include page="loginform.jsp"/>
	<%}else{%>
		<script type="text/javascript">
			alert("<%=name%>님 BORAM3에 오신걸 환영합니다");
			location.href="http://localhost:8081/SemiProject/index.jsp";
		</script>
	<%}

%>
</body>
</html>