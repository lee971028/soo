package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/login/main")
	public String loginform()
	{
		return "/2/login/loginform";
	}
}
