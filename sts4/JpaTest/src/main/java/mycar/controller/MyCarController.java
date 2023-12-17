package mycar.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import mycar.data.MyCarCommentDao;
import mycar.data.MyCarCommentDto;
import mycar.data.MyCarCommentRepository;
import mycar.data.MyCarDao;
import mycar.data.MyCarDto;
import mycar.data.MyCarRepository;
import naver.storage.NcpObjectStorageService;

@Controller
public class MyCarController {

	@Autowired
	private NcpObjectStorageService storageService;
	
	@Autowired
	MyCarDao dao;
	
	@Autowired
	MyCarCommentDao commentDao;
	
	@Autowired
	MyCarRepository myCarRepo;
	
	@Autowired
	MyCarCommentRepository commentRepository;
	
	private String bucketName="bitcamp-lmh";
	private String folderName="mycar";

	@GetMapping("/")
	public String home(Model model)
	{
		Long totalCount=dao.getTotalCount();
		//List<MyCarDto> list=dao.getAllCars();
		List<MyCarDto> list=myCarRepo.getAllCars();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "carlist";
	}

	@GetMapping("/form")
	public String form()
	{		
		return "carform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MyCarDto dto,@RequestParam("carupload") MultipartFile carupload)
	{
		System.out.println(dto);
		String photoName=storageService.uploadFile(bucketName, folderName, carupload);
		dto.setCarphoto(photoName);

		//db insert
		dao.insertCar(dto);

		//목록으로 이동
		return "redirect:./";
	}

	@GetMapping("/detail")
	public String detail(@RequestParam("num") Long num,Model model)
	{
		//MyCarDto dto=dao.getData(num);
		MyCarDto dto=myCarRepo.getData(num);
		model.addAttribute("dto", dto);
		return "cardetail";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("num") Long num)
	{
		System.out.println(num);
		//이미지 수정전에 기존사진 지우기
		String oldFileName=dao.getData(num).getCarphoto();

		//기존 사진 삭제
		storageService.deleteFile(bucketName, folderName, oldFileName);

		//db 데이타도 삭제
		dao.deleteCar(num);

		//목록으로 이동
		return "redirect:./";
	}	
	
	//comment
	@GetMapping("/addcomment")
	@ResponseBody public void addComment(@RequestParam("num") Long num,@RequestParam("comment") String comment)
	{
		System.out.println(num);
		System.out.println(comment);
		//방법 1
//		MyCarDto myCardto=new MyCarDto();
//		myCardto.setNum(num);
//		
//		MyCarCommentDto dto=new MyCarCommentDto();
//		
//		dto.setMycar(myCardto);
//		dto.setComment(comment);	
		
		//방법2
		MyCarDto myCarDto=MyCarDto.builder().num(num).build();
		
		MyCarCommentDto dto=MyCarCommentDto.builder()
							.comment(comment)
							.mycar(myCarDto)
							.build();
							
		commentDao.insertComment(dto);//댓글 저장
	}
	
	@GetMapping("/commentlist")
	@ResponseBody List<Map<String, String>> getComments(@RequestParam("num") Long num)
	{
		System.out.println("getComments num="+num);
		return commentRepository.getMyCarComment(num);
	}
}







