package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.ShopDto;
import boot.data.service.ShopService;
import jakarta.servlet.http.HttpSession;

@RestController
@CrossOrigin
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	String photoName;
	
	@PostMapping("/upload")
	public String fileUpload(@RequestParam MultipartFile uploadFile,
			HttpSession session)
	{
		
		String fileName=uploadFile.getOriginalFilename();
		
		String path=session.getServletContext().getRealPath("/save");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		photoName=sdf.format(new Date())+fileName;
		
		System.out.println("fileName: "+fileName+"===>"+photoName);
		
		
		try {
			uploadFile.transferTo(new File(path+"/"+photoName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return photoName;
	}
	
	@PostMapping("/insert")
	public void insertShop(@RequestBody ShopDto dto)
	{
		dto.setPhoto(photoName);
		shopService.insertShop(dto);
	}
}
