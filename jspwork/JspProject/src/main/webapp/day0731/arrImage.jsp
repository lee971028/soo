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
	String [] str={"15.jpg","16.jpg","2.jpg","22.jpg","24.jpg","26.jpg",
			"27.jpg","28.jpg","30.jpg"};
    int n=0;
%>

<table class="table table-bordered" style="width: 460px;">
	<%
	for(int i=0;i<3;i++) //행
	{%>
		<tr>
		<%
		  for(int j=0;j<3;j++)//열
		  {%>
			  <td>
			   <img alt="" src="../image/<%=str[n]%>" width="150" height="150">
			  </td>
		  <%
		    n++;
		  }
		%>
		</tr>
	<%}
	%>

</table>
</body>
</html>