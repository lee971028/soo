package boot.controller;

import java.awt.Dialog.ModalExclusionType;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.dto.PersonDto;

@Controller
public class FormController {

	@GetMapping("/sist/form1")
	public String form1()
	{
		return "form/form1";
	}
	
	@GetMapping("/sist/form2")
	public String form2()
	{
		return "form/form2";
	}
	
	@GetMapping("/sist/form3")
	public String form3()
	{
		return "form/form3";
	}
	
	//값읽기
	@PostMapping("/sist/read1")
	public ModelAndView readform1(
			@RequestParam String irum,
			@RequestParam int java,
			@RequestParam int spring)
	{
		ModelAndView model=new ModelAndView();
		
		//저장
		model.addObject("irum", irum);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("tot", java+spring);
		model.addObject("avg", (java+spring)/2.0);
		
		
		//포워드경로
		model.setViewName("result/result1");
		
		return model;
	}
	
	//dto
	@PostMapping("/sist/write2")
	public String formread2(@ModelAttribute("dto") PersonDto dto)
	{
		return "result/result2";
	}
	
	//map
	//map으로 읽을경우 폼의 name이 key값으로 입력값은 value
	@PostMapping("/sist/myread")
	public ModelAndView formread3(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", map.get("name"));
		model.addObject("blood", map.get("blood"));
		model.addObject("age", map.get("age"));
		
		model.setViewName("result/result3");
		
		return model;
	}
	
}
