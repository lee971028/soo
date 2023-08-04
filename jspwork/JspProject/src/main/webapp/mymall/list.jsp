<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="java.util.List"%>
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
  MallDao dao=new MallDao();
  List<MallDto> list=dao.getAllSangpums();
%>
<body>

  <div style="margin: 100px 30px;">
     <h3 class="alert alert-info" style="width: 800px;">MyMall 목록</h3>
     <br>
     <button type="button" class="btn btn-outline-info" onclick="location.href='addForm.jsp'">상품추가</button>
     <br><br>
     <table class="table table-bordered" style="width: 800px;">
        <tr class="table-info" align="center">
          <th width="60">번호</th>
          <th width="300">상품명</th>
          <th width="160">가격</th>
          <th width="160">입고일</th>
          <th width="200">등록일</th>
          <th width="160">편집</th>
        </tr>
        <%
        if(list.size()==0){
        	%>
        	<tr>
        	  <td colspan="6" align="center">
        	    <h5>등록된 상품이 없습니다</h5>
        	  </td>
        	</tr>
        <%}else{
        	
        	NumberFormat nf=NumberFormat.getCurrencyInstance();
        	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH시");
        	
        	for(int i=0;i<list.size();i++)
        	{
        		MallDto dto=list.get(i);
        		%>
        		
        		<tr>
        		   <td align="center" valign="middle"><%=i+1 %></td>
        		   <td>
        		   
        		      <img alt="" src="../쇼핑몰사진/<%=dto.getPhoto()%>.jpg" width="60" height="60"
        		      class="img-thumbnail" onclick="location.href='detailPage.jsp?no=<%=dto.getNo()%>'">
        		      <b><%=dto.getSangpum() %></b>
        		      
        		   </td>
        		   <td align="center" valign="middle"><%=nf.format(dto.getPrice()) %></td>
        		   <td align="center" valign="middle"><%=dto.getIpgoday() %></td>
        		   <td valign="middle"><%=sdf.format(dto.getWriteday()) %></td>
        		   <td valign="middle">
        		      <button type="button" class="btn btn-success btn-sm"
        		      onclick="location.href='updateForm.jsp?no=<%=dto.getNo()%>'">수정</button>
        		      <button type="button" class="btn btn-success btn-sm"
        		      onclick="location.href='deleteMall.jsp?no=<%=dto.getNo()%>'">삭제</button>
        		   </td>
        		</tr>
        		
        	<%}
        }
        %>
     </table>
  </div>
</body>
</html>