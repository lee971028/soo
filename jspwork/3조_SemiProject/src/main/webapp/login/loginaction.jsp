<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	MemberDao dao = new MemberDao();
	boolean b = dao.isEmailPass(email, password);
	
	if(b){
		//로그인중인지 알수잇는 세션저장
		session.setAttribute("loginok", "yes");
		session.setAttribute("emailok", email);
		
		session.setMaxInactiveInterval(60*60*24); //24시간동안 로그인유지

		response.sendRedirect("../index.jsp?boramMain=login/loginmain.jsp");
		
	}else{%>
		<script>
			alert("없는 계정 입니다");
			history.back();
		</script>
	<%}
%>