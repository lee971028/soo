<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //엔코딩
  request.setCharacterEncoding("utf-8");
  //data읽어서 dto담기
  AnswerDto dto=new AnswerDto();
  
  dto.setNum(request.getParameter("num"));
  dto.setMyid(request.getParameter("myid"));
  dto.setContent(request.getParameter("content"));
  
  //페이지번호읽기
  String currentPage=request.getParameter("currentPage");
  
  //db에 저장
  AnswerDao dao=new AnswerDao();
  dao.insertAnswer(dto);
  
  //다시 보던목록으로 이동
  response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
%>