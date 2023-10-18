package answer.data;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AnswerRestController {

	@Autowired
	AnswerDao adao;
	
	@GetMapping("/board/adelete")
	public HashMap<String, Integer> answerDelete(
			@RequestParam int idx,
			@RequestParam String pass)
	{
		int check=adao.getCheckPass(idx, pass);
		if(check==1)  //비번이 맞으면 삭제
		{
			adao.deleteAnswer(idx);
		}
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("check", check); //{"check":1}
		
		return map;
	}
}
