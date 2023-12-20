package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.ShopDto;
import boot.data.service.ShopService;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@CrossOrigin
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	String photoName; //리액트에서 업로드한 이미지명(혹은 변경한 이미지명..)
	
	@PostMapping("/upload")
	public String fileUpload(@RequestParam MultipartFile uploadFile,
			HttpServletRequest request)
	{
		//업로드할 폴더 위치
		String path=request.getServletContext().getRealPath("/save");
		
		//파일명
		String fileName=uploadFile.getOriginalFilename();
		
		//파일명변경
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		photoName=sdf.format(new Date())+fileName;
		
		System.out.println("fileName: "+fileName+"==>"+photoName);
		
		//save폴더에 업로드
		try {
			uploadFile.transferTo(new File(path+"/"+photoName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return photoName;
	}
	
	@PostMapping("/insert")
	public void insertShop(@RequestBody ShopDto dto) //@RequestBody는 json으로 보낸걸 자바클래스로 변환해야 하므로
	{
		//업로드한 사진
		dto.setPhoto(photoName);
		//insert
		shopService.insertShop(dto);
	}
	
	@GetMapping("/list")
	public List<ShopDto> list()
	{
		return shopService.getShopDatas();
	}
	
	@GetMapping("/detail")
	public ShopDto detail(@RequestParam int num)
	{
		return shopService.getData(num);
	}
	
	@DeleteMapping("/delete")
	public void delete(@RequestParam int num,HttpServletRequest request)
	{
		//save경로구하기
		String path=request.getServletContext().getRealPath("/save");
		
		//num에 해당하는 photo
		String photo=shopService.getData(num).getPhoto();
		
		//해당파일이 존재할경우 삭제
		File file=new File(path+"/"+photo);
		if(file.exists())
			file.delete();
		
		//db delete
		shopService.deleteShop(num);
	
		
	}
}
