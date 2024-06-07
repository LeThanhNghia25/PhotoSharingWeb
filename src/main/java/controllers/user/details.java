package controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.PhotoRepository;
import models.Img;

@Controller
public class details {
	@Autowired
	private PhotoRepository photoRepository;

	@GetMapping("/detail")
	public String replyTopic(@RequestParam(name = "fromitem") int fromitem, Model model) {
		Img img = photoRepository.findImgById(fromitem);
		model.addAttribute("img", img);
		return "user/details"; 
	}
}
