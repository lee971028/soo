<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Gasoek+One&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
img.photo{
  width: 200px;
  height: 230px;
  border: 1px solid gray;
  border-radius: 20px;
  margin-bottom: 10px;
}

tr{
  padding: 10px;
}

</style>
<script type="text/javascript">
  $(function(){
	  
	  
	  //이미지 누르면 shopnum 경고창으로 띠우기
	  $("a.godetail").click(function(){
		  
		  var shopnum=$(this).attr("shopnum");
		  
		  //alert(shopnum);
		  //디테일 페이지로 가기
		  location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
	  });
  })
  
</script>
<title>Insert title here</title>
</head>
<%
ShopDao dao=new ShopDao();
List<ShopDto> list=dao.getAllSangpums();
%>
<body>
<div class="container mt-3">
  <h2>Toggleable Tabs</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-1">전체</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-2">아우터</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-3">상의</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-4">하의</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-5">악세서리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-6">세트</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="tabs-1" class="container tab-pane active"><br>
       <p>
         <table class="table table-bordered" style="width: 700px;">
           <caption align="top"><b>전체상품목록</b></caption>
           <tr>
             <%
             	NumberFormat nf=NumberFormat.getCurrencyInstance();
                int i=0;
                for(ShopDto dto:list)
                {
                	String photo=dto.getPhoto();
                	
                	
                	%>
                	<td>
                	
                	  <a shopnum=<%=dto.getShopnum() %>  style="cursor: pointer;"
                	  class="godetail"><img alt="" src="shopsave/<%=photo%>" class="photo"></a>
                	  <br>
                	  <%=dto.getSangpum() %><br>
                	  
                	  <span style="float: right;">
                	    
                	    <div style="color: black; font-size: 16px;">
                	       <%=nf.format(dto.getPrice()) %>
                	    </div>
                	  </span>
                	</td>
                	<%
                	if((i+1)%4==0)
                	{%>
                		</tr>
                		<tr>
                	<%}
                	i++;
                	%>
                	
                <%}
             %>
           </tr>
         </table>
       </p>
    </div>
    
</div>
</div>
</body>
</html>