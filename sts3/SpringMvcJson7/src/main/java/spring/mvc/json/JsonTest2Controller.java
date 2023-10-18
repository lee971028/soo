package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController  /* jsonó�� ���� ��Ʈ�ѷ� */
public class JsonTest2Controller {

	@GetMapping("/list2")
	public Map<String, String> list2()
	{
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("sang", "�䰡��Ʈ");
		map.put("price", "23000");
		map.put("color", "ȭ��Ʈ");
		
		return map;
	}
	
	
	@GetMapping("/list4")
	public Map<String, Object> list4(@RequestParam String name)
	{
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("������ġ", "1.jpg"));
		list.add(new PhotoDto("��ġ����", "2.jpg"));
		list.add(new PhotoDto("�丶�䵤��", "7.jpg"));
		list.add(new PhotoDto("�������", "11.jpg"));
		list.add(new PhotoDto("��������", "12.jpg"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", "���¸޴�");
		map.put("photo", "5.jpg");
		
		for(PhotoDto dto:list)
		{
			if(name.equals(dto.getName()))
			{
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}
		
		return map;
		
	}
	
}
