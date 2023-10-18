package spring.mvc.mycar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/kakao/list")
	public String list(Model model)
	{
		//dao로부터 총개수가져오기
		int totalCount=dao.getTotalCount();
		
		//목록 가져오기
		List<MyCarDto> list=dao.getAllCars();
		
		//request에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "car/carlist";
	}
	
	@GetMapping("/kakao/writeform")
	public String carform()
	{
		return "car/writeform";
	}
	
	//insert
	@PostMapping("/kakao/write")
	public String insert(@ModelAttribute("dto") MyCarDto dto)
	{
		
		dao.insertCar(dto);
		return "redirect:list";
	}
	
	@GetMapping("/kakao/delete")
	public String delete(@RequestParam int num)
	{
		dao.deleteCar(num);
		return "redirect:list";
	}
	
	@GetMapping("/kakao/updateform")
	public String uform(@RequestParam String num,Model model)
	{
		MyCarDto dto=dao.getData(num);
		model.addAttribute("dto", dto);
		return "car/updateform";
	}
	
	@PostMapping("/kakao/update")
	public String update(@ModelAttribute MyCarDto dto)
	{
		dao.updateCar(dto);
		return "redirect:list";
	}
	
}
