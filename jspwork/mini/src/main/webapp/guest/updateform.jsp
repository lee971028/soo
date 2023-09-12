<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
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
<script type="text/javascript">
  $(function(){
	  
	  $("i.camera").click(function(){
		  
		  $("#photo").trigger("click"); //이벤트 강제호출
	  });
  });
  
  
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader(); 
          reader.onload = function (e) {
         
              $('#showimg').attr('src', e.target.result);
          }
         
          reader.readAsDataURL(input.files[0]);
      }
  }
</script>
<title>Insert title here</title>
</head>
<%
  String num=request.getParameter("num");
  String currentPage=request.getParameter("currentPage");
  
  GuestDao dao=new GuestDao();
  GuestDto dto=dao.getData(num);
%>
<body>

<!--이미지 미리보기  -->
<img alt="" src="<%=dto.getPhotoname()==null?"":"save/"+dto.getPhotoname() %>" id="showimg" style="position: absolute; left: 800px; top: 100px;
max-width: 200px;">

<form action="guest/updateproc.jsp" method="post" enctype="multipart/form-data">
<!--  수정폼은 반드시 hidden으로 num넘긴다-->
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="currentPage" value="<%=currentPage%>">

   <table class="table table-bordered" style="width: 600px;">
     <caption align="top"><b>방명록 수정</b>
     	<i class="bi bi-camera fs-3 camera"></i>
     	<input type="file" name="photo" id="photo" style="visibility: hidden;"
     	onchange="readURL(this)">
     </caption>
     
     <tr height="100">
       <td width="520">
           <textarea style="width: 500px; height: 100px;"
           name="content" required="required" class="form-control"><%=dto.getContent() %></textarea>
       </td>
       <td>
         <button type="submit" class="btn btn-outline-info"
         style="width: 100px; height: 100px;">수정</button>
       </td>
     </tr>
   </table>
</form>
</body>
</html>