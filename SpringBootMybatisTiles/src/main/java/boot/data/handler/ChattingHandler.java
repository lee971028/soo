package boot.data.handler;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChattingHandler extends TextWebSocketHandler{

	//private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		private Map<String, WebSocketSession> users=new ConcurrentHashMap<String, WebSocketSession>();
		
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			
			System.out.println("#ChattingHandler, afterConnectionEstablished");
			users.put(session.getId(),session);
			
			//System.out.println(session.getPrincipal().getName() + "님이 입장하셨습니다.");
			System.out.println(session.getId()+ "님이 입장하셨습니다.");
			TextMessage tm=new TextMessage("msg:"+session.getId() + "님이 입장하셨습니다.");
			session.sendMessage(tm);
		}
		
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
			System.out.println("#ChattingHandler, handleMessage");
			System.out.println(session.getId() + ": " + message.getPayload());		
			
			for(WebSocketSession s : users.values()) {
				//s.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload()));
				s.sendMessage(message);
				System.out.println(s.getId()+"에 "+message.getPayload());
			}
		}
		
		
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			
			System.out.println("#ChattingHandler, afterConnectionClosed");		
			System.out.println(session.getId() + "님이 퇴장하셨습니다.");		
			users.remove(session);
		}
}
