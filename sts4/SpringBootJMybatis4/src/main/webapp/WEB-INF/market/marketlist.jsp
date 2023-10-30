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
<c:if test="${totalCount==0 }">
  <div class="alert alert-info" >
    <b>저장된 상품정보가 없습니다</b>
  </div>
</c:if>
<c:if test="${totalCount>0 }">
  <div class="alert alert-info">
    <b>총${totalCount }개의 상품정보가 있습니다</b>
    
  </div>
</c:if>
<div style="margin: 50px 100px;">
<button type="button" class="btn btn-info"
onclick="location.href='writeform'">글쓰기</button>

<br><br>
<c:forEach var="a" items="${list }">
  <table class="table table-bordered" style="width: 500px;">
    <tr>
      <td>
        <c:if test="${a.photoname!=null }">
           <img alt="" src="../save/${a.photoname }" style="max-width: 150px;" align="left"
           hspace="30">
        </c:if>
        <c:if test="${a.photoname==null }">
           <img alt="" src="../save/noimage.PNG" style="max-width: 150px;" align="left"
           hspace="30">
        </c:if>
        <h4>상품명: ${a.sang }</h4>
        <h4>단가: <fmt:formatNumber value="${a.price }" type="currency"/></h4>
        <h4>입고일:<fmt:formatDate value="${a.ipgoday }" pattern="yyyy-MM-dd HH:mm"/></h4>
        
        <h4><button type="button" class="btn btn-success btn-sm" style="width: 100px;"
        onclick="location.href='updateform?num=${a.num}'">상품수정</button>
        <button type="button" class="btn btn-success btn-sm" style="width: 100px;"
        onclick="location.href='delete?num=${a.num}'">상품삭제</button></h4>
      </td>
    </tr>
  </table>
</c:forEach>
    
</div>
</body>
</html>