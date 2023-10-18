package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {

	@GetMapping("/list1")
	@ResponseBody  /*json 처리후 브라우져로 출력(일반 컨트롤러일경우)  */
	public Map<String, String> list1()
	{
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "장순영");
		map.put("hp", "010-222-3333");
		map.put("addr", "수원시 장안구");
		
		return map;
	}
	
	@GetMapping("/list3")
	public @ResponseBody List<PhotoDto> list3()
	{
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("샌드위치", "1.jpg"));
		list.add(new PhotoDto("꼬치구이", "2.jpg"));
		list.add(new PhotoDto("토마토덮밥", "7.jpg"));
		list.add(new PhotoDto("망고샤벳", "11.jpg"));
		list.add(new PhotoDto("에그인헬", "12.jpg"));
		
		return list;
	}
}
