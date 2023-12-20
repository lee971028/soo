package boot.data.controller;

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

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@RestController
@CrossOrigin
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@PostMapping("/insert")
	public void insert(@RequestBody MemberDto dto)
	{
		System.out.println("insert>>>"+dto.getEmail());
		memberService.insertMember(dto);
	}
	
	@GetMapping("/idsearch")
	public int idcheck(@RequestParam String id)
	{
		return memberService.getSerchId(id);
	}
	
	@PostMapping("/login")
	public int login(@RequestBody MemberDto dto)
	{
		System.out.println("Login>>"+dto.getId());
		return memberService.loginPassCheck(dto.getId(), dto.getPass());
	}
	
	@GetMapping("/getname")
	public String getName(@RequestParam String id)
	{
		return memberService.getName(id);
	}
	
	//리스트
	@GetMapping("/list")
	public List<MemberDto> getList()
	{
		return memberService.getAllMembers();
	}
	//삭제
	@DeleteMapping("/delete")
	public void deleteMember(@RequestParam int num)
	{
		memberService.deleteMember(num);
	}
	
	
	
	
	
}
