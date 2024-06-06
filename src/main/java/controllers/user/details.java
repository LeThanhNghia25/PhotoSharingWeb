package controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class details {
	@GetMapping("/detail")
	public String detail() {
		return "user/details";
	}
}
