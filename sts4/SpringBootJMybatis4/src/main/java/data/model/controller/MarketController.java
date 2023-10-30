package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;
import data.model.service.MarketService;

@Controller
public class MarketController {

	/*
	 * @Autowired MarketMapperInter mapper;
	 */
	
	@Autowired
	MarketService service;
	
	@GetMapping("/")
	public String start()
	{
		return "redirect:market/list";
	}
	
	@GetMapping("/market/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		//db로 부터 총개수 얻기
		int totalCount=service.getTotalCount();
		List<MarketDto> list=service.getAllSangpums();
		
		//저장
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		//포워드
		model.setViewName("market/marketlist");
		return model;
	}
	
	@GetMapping("/market/writeform")
	public String form()
	{
		return "market/addform";
	}
	
	@PostMapping("/market/add")
	public String insert(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile photo,
			HttpServletRequest request)
	{
		//업로드 경로 구하기
		String path=request.getServletContext().getRealPath("/save");
		System.out.println(path);
		
				
		if(photo.getOriginalFilename().equals(""))
			dto.setPhotoname("no");
		else {
			//사진명구해서 넣기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname=sdf.format(new Date())+photo.getOriginalFilename();
			dto.setPhotoname(photoname);
			
			//실제업로드
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//db 에 저장
		service.insertMarket(dto);
		return "redirect:list";
	}
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num,HttpServletRequest request)
	{
		
		String photo=service.getData(num).getPhotoname();
		
		if(!photo.equals("no"))
		{
			String path=request.getServletContext().getRealPath("/save");
			
			File file=new File(path+"\\"+photo);
			file.delete();
		}
		
		
		service.deleteMarket(num);
		return "redirect:list";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
