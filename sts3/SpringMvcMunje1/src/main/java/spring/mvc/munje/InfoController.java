package spring.mvc.munje;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.InfoDto;

@Controller
public class InfoController {

	/*@GetMapping("/info/form")
	public String start() {
		
		return "info/infoForm";
	}*/
	
	@GetMapping("/info/form")
	public ModelAndView start() {
		
		ModelAndView model=new ModelAndView();
		
		model.setViewName("info/infoForm");
		return model;
	
	}
	
	@PostMapping("/info/result")
	public String result(@ModelAttribute("dto") InfoDto dto) {
		
		return "info/infoWrite";
		
	}
}
