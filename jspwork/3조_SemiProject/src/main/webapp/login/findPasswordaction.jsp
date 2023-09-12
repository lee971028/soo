<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String email = request.getParameter("email");	
	
	MemberDao dao = new MemberDao();	
	boolean b = dao.ismemNameEmail(name, email);
	String password = dao.getPass(email);
	
	
	if(b!=true){%>
이름과 이메일이 일치하지 않습니다
	<%}
%>
<%=password %>