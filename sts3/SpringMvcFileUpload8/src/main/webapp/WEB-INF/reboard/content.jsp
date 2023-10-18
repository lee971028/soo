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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div style="margin: 100px 100px;">
   <table class="table table-bordered" style="width: 600px;">
      <caption align="top"><b>내용보기</b></caption>
      <tr>
        <td>
          <h2><b>${dto.subject }</b></h2>
          <span style="float: right; margin-right: 20px;">
            조회:${dto.readcount }&nbsp;&nbsp;&nbsp;
            <fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
          </span>
          <br>
          <h6><b>작성자: ${dto.writer }</b></h6>
        </td>
      </tr>
      
      <tr>
        <td>
          <pre>${dto.content }</pre>
          <br><br>
          <!-- 이미지가 있을때만 출력 -->
          <c:if test="${dto.photo!='no' }">
              <c:forTokens var="pho" items="${dto.photo }" delims=",">
                <a href="../upload/${pho}">
                <img alt="" src="../upload/${pho}" style="width: 100px; height: 100px;
                border: 2px solid green; border-radius: 20px;"></a>
              </c:forTokens>
          </c:if>
        </td>
      </tr>
      <!-- 댓글 -->
      <tr>
        <td>
           <div id="answer">
              <b>댓글 ${acount }</b><br><br>
              <c:forEach var="a" items="${alist }">
                ${a.nickname }:  ${a.content }&nbsp;&nbsp;
                <span style="color: gray; font-size: 0.9em;">
                   <fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>
                </span>
                &nbsp;&nbsp;
                <i class="adel bi bi-trash" style="cursor: pointer;" idx="${a.idx}"></i><br>
              </c:forEach>
           </div>
           <br>
           <form action="ainsert" method="post" style="width: 600px;">
           		<!--hidden  -->
             <input type="hidden" name="num" value="${dto.num }">
             <input type="hidden" name="currentPage" value="${currentPage }">
             
             <div class="d-inline-flex">
             <b>닉네임: </b> 
             <input type="text" name="nickname" class="form-control"
             style="width: 100px;" required="required">
             <b>비밀번호: </b> 
             <input type="password" name="pass" class="form-control"
             style="width: 100px;" required="required"></div>
             <br>
             <div class="d-inline-flex">
             <input type="text" name="content" class="form-control"
             style="width: 500px;" placeholder="댓글내용을 입력해주세요">
             <button type="submit" class="btn btn-outline-info">확인</button></div>
           </form>
        </td>
      </tr>
      
      
      <tr>
        <td align="right">
          <button class="btn btn-outline-success" onclick="location.href='writeform'">글쓰기</button>
          <button class="btn btn-outline-success" onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
          <button class="btn btn-outline-success" onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
          <button class="btn btn-outline-success" onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
          <button class="btn btn-outline-success" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
        </td>
      </tr>
   </table>
</div>

<script type="text/javascript">
  //댓글삭제
  $("i.adel").click(function(){
	  
	  var idx=$(this).attr("idx");
	  //alert(idx);
	  
	  var pass=prompt("비밀번호를 입력해주세요");
	  //alert(pass);
	  
	  if(pass==null)
		  return;
	  
	  $.ajax({
		  
		  type:"get",
		  dataType:"json",
		  url:"adelete",
		  data:{"idx":idx,"pass":pass},
		  success:function(res){
			  
			  if(res.check==0){
				  alert("비밀번호가 맞지않아요");
			  }else{
				  alert("댓글을 삭제합니다");
				  location.reload();
			  }
		  }
	  });
  });
</script>
</body>
</html>