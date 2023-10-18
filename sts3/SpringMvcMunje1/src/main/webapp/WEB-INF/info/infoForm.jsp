<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<form action="result" method="post">
<table class="table table-bordered" style="width:300px;">
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name" class="form-control">
		</td>
	</tr>
	<tr>
		<th>좋아하는 색</th>
		<td>
			<input type="color" name="color" class="form-control">
		</td>
	</tr>
	<tr>
		<th>취미</th>
		<td>
			<input type="checkbox" name="hobby" value="헬스">헬스
			<input type="checkbox" name="hobby" value="음악감상">음악감상
			<input type="checkbox" name="hobby" value="영화시청">영화시청
			<input type="checkbox" name="hobby" value="등산">등산
			<input type="checkbox" name="hobby" value="맛집탐방">맛집탐방
		</td>
	</tr>
		<tr>
		<th>가장좋아하는 언어</th>
		<td>
			<select name="lang">
				<option value="java">java
				<option value="html">html
				<option value="oracle">oracle
				<option value="jsp">jsp
				<option value="spring">spring
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="데이터 전송" class="btn btn-warning">
		</td>
	</tr>
</table>
</form>
</body>
</html>