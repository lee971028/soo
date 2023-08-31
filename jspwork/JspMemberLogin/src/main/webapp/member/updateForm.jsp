<%@page import="member.model.MemberDto"%>
<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Gasoek+One&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>

</head>
<%
  String num=request.getParameter("num");
  MemberDao dao=new MemberDao();
  MemberDto dto=dao.getDta(num);
%>
<body>
  <div style="margin: 50px; 100px;">
    <form action="updateProc.jsp" method="post" enctype="multipart/form-data" class="form-inline" id="mfrm">
       <!-- hidden num -->
       <input type="text" name="num" value="<%=num%>">
       <table class="table table-bordered" style="width: 400px;">
          <caption align="top"><b>회원수정</b></caption>
          <tr>
            <td style="background-color: #66cdaa" width="120" >아이디</td>
            <td>
              <b><%=dto.getId() %></b>
            </td>
          </tr>
          <tr>
            <td style="background-color: #66cdaa" width="120">비밀번호</td>
            <td>
              <input type="password" class="form-control" value="<%=dto.getPass()%>">
            </td>
          </tr>
          
          <tr>
            <td style="background-color: #66cdaa" width="120">이름</td>
            <td>
              <input type="text" class="form-control" style="width: 120px;"
              name="name" required="required" value="<%=dto.getName()%>">
            </td>
          </tr>
          
          <tr>
            <td style="background-color: #66cdaa" width="120">사진</td>
            <td>
              <input type="file" class="form-control" style="width: 250px;"
              name="uploadImage" >
              <img alt="" src="<%=dto.getImage()%>" width="60" border="1">
            </td>
          </tr>
          
          <tr>
            <td style="background-color: #66cdaa" width="120">핸드폰</td>
            <td>
              <input type="text" class="form-control" style="width: 200px;"
              name="hp" required="required" value="<%=dto.getHp()%>">
            </td>
          </tr>
          
          <tr>
            <td colspan="2" align="center">
              <button type="submit" class="btn btn-success"
              id="btnGaip">회원정보수정</button>
              <button type="button" class="btn btn-warning" onclick="location.href='memberList.jsp'">회원목록</button>
            </td>
          </tr>
       </table>
    </form>
  </div>
  
  <script type="text/javascript">
     function openId() {
		window.open("idcheck.jsp","e","left=400px; top=100px,width=400px,height=250px");
	}
  </script>
</body>
</html>