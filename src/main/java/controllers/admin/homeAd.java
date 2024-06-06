package controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.PhotoService;
import models.Img;
import models.user;

@Controller
public class homeAd {
	@Autowired
	private PhotoService photoService;

	@RequestMapping(value = { "/admin", "/admin/post" }, method = RequestMethod.GET)
	public String admin(Model model) {
		List<Img> imgs = photoService.getAllImgAdmin();
		model.addAttribute("imgs", imgs);
		model.addAttribute("img", new Img());
		return "admin/index";
	}

	@GetMapping("/admin/user")
	public String aduser(Model model,@ModelAttribute("user") user user) {
		model.addAttribute("user", user);
		List<user> users = photoService.getAllUsers();
		model.addAttribute("users", users);
		return "admin/user";

	}

	@PostMapping("/admin/updateformimg")
	public String updateImg(@ModelAttribute("img") Img img, Model model) {
		List<Img> imgs = photoService.getAllImgAdmin();
		model.addAttribute("imgs", imgs);
		photoService.updateImg(img);
		return "redirect:/admin";

	}

	@GetMapping("/admin/deleteimg")
	public String deleteImg(@ModelAttribute("img") Img img, Model model) {
		List<Img> imgs = photoService.getAllImgAdmin();
		model.addAttribute("imgs", imgs);
		photoService.delete(img.getId());
		return "redirect:/admin";

	}
}
