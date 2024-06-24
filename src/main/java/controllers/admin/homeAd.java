package controllers.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import dao.PhotoService;
import models.Img;
import models.admin;
import models.catalog;
import models.user;

@Controller
public class homeAd {
	@Autowired
	private PhotoService photoService;

	@GetMapping("/admin/post")
	public String adminpost(Model model, HttpSession session) {
		admin loggedAdmin = (admin) session.getAttribute("admin");
		if (loggedAdmin == null) {
			return "redirect:/admin";
		}
		List<Img> imgs = photoService.getAllImgAdmin();
		model.addAttribute("imgs", imgs);
		model.addAttribute("img", new Img());
		return "admin/index";
	}

	@GetMapping("/admin/user")
	public String aduser(Model model, @ModelAttribute("user") user user, HttpSession session) {
		admin loggedAdmin = (admin) session.getAttribute("admin");
		if (loggedAdmin == null) {
			return "redirect:/admin";
		}
		model.addAttribute("user", user);
		List<user> users = photoService.getAllUsers();
		model.addAttribute("users", users);
		return "admin/user";

	}

	@GetMapping("/admin/cate")
	public String adcate(Model model, HttpSession session) {
		admin loggedAdmin = (admin) session.getAttribute("admin");
		if (loggedAdmin == null) {
			return "redirect:/admin";
		}
		List<catalog> catalogs = photoService.getAllCate();
		model.addAttribute("catelog", new catalog());
		model.addAttribute("cates", catalogs);
		return "admin/catelog";

	}

	@GetMapping("/admin/feedback")
	public String adfeedback(Model model, HttpSession session) {
		admin loggedAdmin = (admin) session.getAttribute("admin");
		if (loggedAdmin == null) {
			return "redirect:/admin";
		}
		return "admin/comment";

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
