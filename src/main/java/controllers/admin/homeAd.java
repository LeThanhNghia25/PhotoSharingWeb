package controllers.admin;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.PhotoService;
import dao.UserService;
import models.Img;
import models.admin;
import models.catalog;
import models.comment;
import models.User;

@Controller
@RequestMapping("/admin")
public class homeAd {
	@Autowired
	private PhotoService photoService;
	@Autowired
	private UserService userService;

	@GetMapping("/post")
	public String adminpost( Model model,Principal principal) {
		String email = principal.getName();
		User userss = userService.getUsers(email);
		model.addAttribute("user", userss);
		List<Img> imgs = photoService.getAllImgAdmin();
		model.addAttribute("imgs", imgs);
		model.addAttribute("img", new Img());
		return "admin/index";
	}

	@GetMapping("/user")
	public String aduser(Model model, @ModelAttribute("user") User user, Principal principal) {
		String email = principal.getName();
		User userss = userService.getUsers(email);
		model.addAttribute("user", userss);
		List<User> users = photoService.getAllUsers();
		model.addAttribute("users", users);
		return "admin/user";

	}

	@GetMapping("/cate")
	public String adcate(Model model,Principal principal) {
		String email = principal.getName();
		User userss = userService.getUsers(email);
		model.addAttribute("user", userss);
		List<catalog> catalogs = photoService.getAllCate();
		model.addAttribute("catelog", new catalog());
		model.addAttribute("cates", catalogs);
		return "admin/catelog";

	}

	@GetMapping("/feedback")
	public String adfeedback(Model model,Principal principal) {
		String email = principal.getName();
		User user = userService.getUsers(email);
		model.addAttribute("user", user);
		List<comment> comments = photoService.showAllComments();
		model.addAttribute("comments", comments);
		return "admin/comment";

	}

	@PostMapping("/updateformimg")
	public String updateImg(@ModelAttribute("img") Img img, Model model) {
		List<Img> imgs = photoService.getAllImgAdmin();
		model.addAttribute("imgs", imgs);
		photoService.updateImg(img);
		return "redirect:/admin/post";

	}

	@GetMapping("/deleteimg")
	public String deleteImg(@ModelAttribute("img") Img img, Model model) {
		List<Img> imgs = photoService.getAllImgAdmin();
		model.addAttribute("imgs", imgs);
		photoService.delete(img.getId());
		return "redirect:/admin/post";

	}
}
