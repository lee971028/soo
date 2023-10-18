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
		//������������
		int count=inter.getTotalCount();
		
		//��ü��� ��������
		List<CarMemberDto> list=inter.getAllDatas();
		
		//request�� ����
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
	}
	
	//�� ����
	@GetMapping("/member/addform")
	public String form()
	{
		return "carmember/addform";
	}
	
	//���� post�� �ѱ��
	@PostMapping("/member/add")
	public String insert(@ModelAttribute CarMemberDto dto)
	{
		inter.insertCarMember(dto);
		return "redirect:list";
	}
	
}
