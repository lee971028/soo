<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="model.mymall.MallDao"%>
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
<%
  String no=request.getParameter("no");
  MallDao dao=new MallDao();
  MallDto dto=dao.getSangpum(no);
  
  NumberFormat nf=NumberFormat.getCurrencyInstance();
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH시");
%>
<body>

  <div style="margin: 100px 100px;">
     <table class="table" style="width: 700px;">
       <caption align="top"><b>상품 상세 보기</b></caption>
       <tr>
         <td rowspan="4">
            <img alt="" src="../쇼핑몰사진/<%=dto.getPhoto()%>.jpg">
         </td>
       </tr>
       <tr>
         <th>상품명</th>
           <td><%=dto.getSangpum() %></td>
       </tr>
       <tr>
         <th>가격</th>
           <td><%=nf.format(dto.getPrice()) %></td>
       </tr>
             
       <tr>
         <th>등록일</th>
           <td><%=sdf.format(dto.getWriteday()) %></td>
       </tr>
       
       <tr>
          <td colspan="3" align="center">
            <button type="button" class="btn btn-outline-info btn-lg"
            onclick="history.back()">이전으로 가기</button>
          </td>
       </tr>
     </table>
  </div>




</body>
</html>