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
<style type="text/css">
	#selphoto{
		
		position: absolute;
		left: 500px;
		top: 100px;
		width: 150px;
		border-radius: 20px;
	}

</style>

<script type="text/javascript">
  $(function(){
	  
	  //select된 선택값 얻기
	  var srcImg=$("#photo").val();
	  //selphoto에 넣기
	  $("#selphoto").attr("src","../쇼핑몰사진/"+srcImg+".jpg");
	  
	  
	  $("#photo").change(function(){
		  
		  var s="../쇼핑몰사진/"+$(this).val()+".jpg";
		  $("#selphoto").attr("src",s);
	  });
  })
</script>
</head>
<body>
	<div style="margin: 30px 30px;">
		<form action="addAction.jsp" method="post">
			<table class="table table-bordered" style="width: 400px;">
				<caption align="top"><h4><b>상품등록</b></h4></caption>
					<tr align="center">
						<th width="100" style="background-color: #48d1cc">상품명</th>
						<td>
							<input type="text" name="sangpum" required="required" class="form-control">
						</td>
					</tr>
					<tr>
						<th width="100" style="background-color: #48d1cc">상품사진</th>
						<td>
						
							<select name="photo" id="photo" class="form-select" style="width: 150px;">
								<option value="11">단화</option>
								<option value="10">스카프</option>
								<option value="29">모자</option>
								<option value="31">화이트자켓</option>
								<option value="33">원피스</option>
								<option value="26">머리끈</option>
								<option value="30">머리띠</option>								
							</select>
								
						</td>
					</tr>
					<tr align="center">
						<th width="100" style="background-color: #48d1cc">가격</th>
						<td>
							<input type="text" name="price" required="required" class="form-control">
							
						</td>
					</tr>
					<tr align="center">
						<th width="100" style="background-color: #48d1cc">입고일</th>
						<td>
							<input type="date" name="ipgoday" value="2023-07-30" class="form-control">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-success">상품저장</button>
							<button type="button" class="btn btn-success" onclick="location.href='list.jsp'">상품목록</button>						
						</td>
					</tr>
			</table>
					
		</form>
	</div>
	
	
	<img alt="" src=""  id="selphoto">
	
</body>
</html>