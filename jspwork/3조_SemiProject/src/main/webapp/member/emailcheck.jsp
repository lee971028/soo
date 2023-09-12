<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 email 중복체크</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
*{
   font-family: 'Noto Sans KR', sans-serif !important;
   color:#363636;
   
}

.temail{
   width: 100%;
    text-align: center;    
    padding-top: 50px;
}
.inputbox{
   width: 200px;
    height: 40px;
    padding-left: 10px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid #e6e6e6;
    outline: none;
}

.inputbox:focus{
   border: 1px solid #1a93ff;
}
.overlapchkbtn{
   width: 80px;
    height: 40px;
    border-radius: 5px;
    outline: none;
    border: 0;
    color: #fff;
    font-size: 16px;
    background-color: #1a93ff;
    }
    
.useokemail{
   text-align: center;
   padding-top: 76px;
   padding-bottom: 30px;
   }

.useokbtn{
   margin-left: 150px;
   width: 80px;
    height: 40px;
    border-radius: 5px;
    outline: none;
    border: 0;
    color: #fff;
    font-size: 16px;
    background-color: #1a93ff;
}

.rechkemail{
    width: 80px;
    height: 40px;
    border-radius: 5px;
    outline: none;
    border: 0;
    color: #565656;
    font-size: 16px;
    background-color: #e6e6e6;
    margin-left: 10px;
}
</style>
</head>

<body>
<% 
request.setCharacterEncoding("utf-8");
String key=request.getParameter("key"); 

if(key==null){
   %>
   <form action="emailcheck.jsp" method="post" class="eform" >
      <input type="hidden" name="key" value="result">
         <table class="temail">
            <tr height="100">
               <td>
                  <br>
                  <b>이메일을 입력해주세요</b><br><br>
                  <input type="text" name="email" class="inputbox overlapchk" style="width: 200px;" required="required">
                  <button type="submit" class="overlapchkbtn">중복체크</button>
               </td>
            </tr>
         </table>
   </form>
<%}else{
   //email db체크
   String email=request.getParameter("email");
   MemberDao dao=new MemberDao();
   boolean b=dao.isemailCheck(email);
   
   if(b){%>
      <script type="text/javascript">
      alert("이미 등록된 이메일입니다");
      location.href='emailcheck.jsp';
      </script>
   <%}else{%>
      
      <h3 class="useokemail"><%= email %>는 사용가능한 이메일입니다</h3>
      <button type="button" class="useokbtn" id="btnuse"
       onclick="goBack('<%= email %>')">사용하기</button>
      <button type="button" class="rechkemail"
      onclick="location.href='emailcheck.jsp'">다시하기</button>
      <%}
}
%>
<script type="text/javascript">

function goBack(email)
   {
      opener.mfrm.email.value=email;
      window.close();
   }

</script>
</body>
</html>