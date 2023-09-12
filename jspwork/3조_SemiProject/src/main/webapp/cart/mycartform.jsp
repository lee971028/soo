<%@page import="dao.SignupDao"%>
<%@page import="dto.LessonDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="dao.LessonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
SignupDao sdao=new SignupDao();
%>
<script type="text/javascript">
$(function(){
	
	//전체 체크박스 선택/해제
	$("#allcheck").click(function() {
		if($("#allcheck").is(":checked")) $("input[name=cnum]").prop("checked", true);
		else $("input[name=cnum]").prop("checked", false);
	});
	
	$("input[name=cnum]").click(function() {
		var total = $("input[name=cnum]").length;
		var checked = $("input[name=cnum]:checked").length;
		
		if(total != checked) $("#allcheck").prop("checked", false);
		else $("#allcheck").prop("checked", true); 
	});
	

	//[이다솔] 총금액 구하기
	
	$("input:checkbox").click(function() {
		var allpri=0;
		$("input[name=cnum]").each(function (i,ele) {
			if($(ele).is(":checked")){
				allpri+=parseInt($(ele).parent().attr("cbprice"));
			}
			
		})
		
		$(".allPrice").find("span").text(allpri);
	})
	
	
	
	//결제하기 버튼 클릭시
	$("#paycart").click(function(){
		
		//클릭한 클래스 개수 확인(null값 유무)
		var scnt=$(".cnum:checked").length;
		
		if(scnt==0){
			alert("먼저 결제할 클래스를 선택하세요.");
			return;
		}
		$(".cnum:checked").each(function(i,element) {
			
			var cnum = $(this).attr("cnum");
			
			//선택한 클래스 모두 담기
			$.ajax({
				type: "get",
				url: "cart/paycart.jsp",
				dataType: "html",
				data: {"cnum":cnum},
				success: function(){
					
					//나의클래스로 이동
			    	location.href='index.jsp?boramMain=mypage/myclass.jsp?';
					
				}
			});
			
		});
		
	});
	
		
	//클래스 클릭시 상세페이지로 이동
	$("div.cartlesson").click(function() {
		//태그에 넣어둔 lnum
		var lnum=$(this).attr("lnum");
		location.href='index.jsp?boramMain=detail/detailpage.jsp?lnum='+lnum;
	});
	
	
	
	//체크한 후 삭제버튼으로 삭제하는 이벤트
	$("#btncartdel").click(function(){
		
		var scnt=$(".cnum:checked").length;
		
		if(scnt==0){
			alert("먼저 삭제할 클래스를 선택하세요.");
			return; 
		}
		
		$(".cnum:checked").each(function(i,element) {
			
			var cnum = $(this).attr("cnum");
			//선택한 장바구니 모두 삭제
			$.ajax({
				type: "get",
				url: "cart/cartdelete.jsp",
				dataType: "html",
				data: {"cnum":cnum},
				success: function(){
					//새로고침
			    	location.reload(); 
				}
			});
			
		});		
	});
});
//결제하기 눌렀을때 나타나는 alert창
function clickpay ()
{
	var scnt=$(".cnum:checked").length;
	
	if(scnt!==0){
		alert("클래스가 결제되었습니다.");
		
	}
}

</script>
</head>
<% 
//로그인한 email얻기
String email=(String)session.getAttribute("emailok");

//dao
LessonDao dao=new LessonDao();

//장바구니 목록
List<HashMap<String,String>> list=dao.getCartList(email);
%>
<body>

<div class="myCart">
		<table class="myCart">
			<caption>장바구니</caption>
			<tr>
				<th style="width: 80px;">
					<input type="checkbox" id="allcheck" checked="checked">
				</th>
				<th class="className">
					<span>클래스 제목</span>
				</th>
				<th class="cartPrice"  style="width: 100px;">
					<span >금액</span>
				</th>
			</tr>
			<tbody>
			<% 
			NumberFormat nf = NumberFormat.getInstance();
			int allmoney=0;
			for(int i=0;i<list.size();i++)
			{
				HashMap<String,String> map=list.get(i);
				int price = Integer.parseInt(map.get("price"));
				
				%>
				
				<tr>
					<td class="mycartCb" cbprice=<%=price %>>
						<input type="checkbox" name="cnum" cnum="<%= map.get("cnum") %>" class="cnum" checked="checked">
					</td>
					<td>
						<div class="cartlesson" lnum="<%= map.get("lnum") %>">
							<img alt="사진" src="savePhoto/<%= map.get("photo") %>">
							<span class="cartTitle"><%= map.get("title") %></span>
						</div>
					</td>
					<td class="cartPrice">
						<span><span><%= nf.format(price) %>원</span></span>
					</td>
					<% allmoney+=price; %>
				</tr>
				
				  <%}
				  %>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<div class="allPrice">총 결제금액 : <span><%= nf.format(allmoney) %></span>원</div>
					</td>
					
				</tr>			
				<tr>
					<td colspan="2" class="btnDel">
						<button type="button" class="btnDel" id="btncartdel" ><span>선택상품삭제</span></button>
					</td>
					<td>
						<button type="button" class="btnPay" id="paycart" onclick="clickpay()">결제하기</button>
					</td>
				</tr>
			</tfoot>
		</table>
	


</div>

</body>
</html>