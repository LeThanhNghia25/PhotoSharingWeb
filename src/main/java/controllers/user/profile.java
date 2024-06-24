package controllers.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.PhotoRepository;
import dao.PhotoService;
import models.Img;
import models.user;

@Controller
public class profile {
	@Autowired
	private PhotoService photoService;

	@GetMapping("/profile")
	public String profiles(@RequestParam("id") int userId, Model model) {
		user user = photoService.findUserById(userId);
		model.addAttribute("user", user);
		List<Img> imgs = photoService.findAllImgByUserId(userId);
		model.addAttribute("imgs", imgs);
		return "user/profile";
	}
}
