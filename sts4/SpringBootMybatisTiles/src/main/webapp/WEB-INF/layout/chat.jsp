<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body *{
		 font-family: 'Jua';
	}
	
	#chatArea {
 		width: 500px; height: 300px; 
 		overflow-y: auto; border: 1px solid black;
	}
</style>

<script type="text/javascript">
	 var wsocket;
	 
		 
	 function connect() {
	  /*  wsocket = new SockJS(
	    "http://192.168.0.27:9001/mini/chatting"); */
	    
	 // 웹소켓 연결
	      wsocket = new WebSocket('ws://localhost:9001/my-websocket-endpoint');
	  wsocket.onopen = onOpen;
	  wsocket.onmessage = onMessage;
	  wsocket.onclose = onClose;
	 }
	 
	
	 
	 function disconnect() {
	  wsocket.close();
	 }
	 function onOpen(evt) {
	  appendMessage("연결되었습니다.");
	 }
	 function onMessage(evt) {
	  var data = evt.data;
	  if (data.substring(0, 4) == "msg:") {
	   appendMessage(data.substring(4));
	  }
	 }
	 function onClose(evt) {
	  appendMessage("연결을 끊었습니다.");
	 }
	 
	 function send() {
	  var nickname = $("#nickname").val();
	  var msg = $("#message").val();
	  alert(msg);
	  wsocket.send("msg:"+nickname+":" + msg);
	  $("#message").val("");
	 }
	
	 function appendMessage(msg) {
	  $("#chatMessageArea").append(msg+"<br>");
	  var chatAreaHeight = $("#chatArea").height();
	  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	  $("#chatArea").scrollTop(maxScroll);
	 }
	
	 
	 $(function(){
		 
		 $('#message').keypress(function(event){
			   var keycode = (event.keyCode ? event.keyCode : event.which);
			   if(keycode == '13'){
			    send(); 
			   }
			   event.stopPropagation();
			  });
			  $('#sendBtn').click(function() { send(); });
			  $('#enterBtn').click(function() { connect(); });
			  $('#exitBtn').click(function() { disconnect(); });
	 });
</script>
</head>
<body>
	
		<div class="input-group"  style="width:250px;">
		 <input type="text" id="nickname" class="form-control" placeholder="닉네임">
		 <input type="button" id="enterBtn" class="btn btn-outline-info btn-sm" value="입장">
		 <input type="button" id="exitBtn" class="btn btn-outline-danger btn-sm" value="나가기">
	</div>
	<br>    
    <h1>대화 영역</h1>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    <div class="input-group"  style="width:500px;">
	    <input type="text" id="message" class="form-control">
	    <input type="button" id="sendBtn" value="전송" class="btn btn-outline-danger btn-sm">
	</div>
</body>
</html>