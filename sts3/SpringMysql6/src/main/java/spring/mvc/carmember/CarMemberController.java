package spring.mvc.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CarMemberController {

	@Autowired
	CarMemberInter inter;
	
	@GetMapping("/member/list")
	public String memberStart(Model model)
	{
		//갯수가져오기
		int count=inter.getTotalCount();
		
		//전체목록 가져오기
		List<CarMemberDto> list=inter.getAllDatas();
		
		//request에 저장
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
	}
	
	//폼 띄우기
	@GetMapping("/member/addform")
	public String form()
	{
		return "carmember/addform";
	}
	
	//폼값 post로 넘기기
	@PostMapping("/member/add")
	public String insert(@ModelAttribute CarMemberDto dto)
	{
		inter.insertCarMember(dto);
		return "redirect:list";
	}
	
}
