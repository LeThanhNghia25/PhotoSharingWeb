package controllers.admin;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import dao.PhotoService;
import models.admin;

@Controller
public class loginAd {
	@Autowired
	private PhotoService photoService;

	@RequestMapping("/admin")
	public String loginAdmin(Model model, HttpSession session) {
		admin loggedAdmin = (admin) session.getAttribute("admin");
		if (loggedAdmin != null) {
			return "redirect:/admin/post";
		}
		model.addAttribute("admin", new admin());
		return "admin/login";
	}

	@PostMapping("/loginAdForm")
	public @ResponseBody String loginForm(@ModelAttribute("admin") admin admin, HttpSession session) {
		admin foundAdmin = photoService.checkAdmin(admin.getUsername(), admin.getPassword());
		if (foundAdmin != null) {
			session.setAttribute("admin", foundAdmin);
			return "success"; // Return a success message
		} else {
			return "erroremailofpass"; // Return an error message if login info is incorrect
		}
	}

	@GetMapping("/logoutad")
	public String logout(HttpSession session) {

		session.removeAttribute("admin");
		// Or session.invalidate(); if you want to clear the entire session
		return "redirect:/admin";
	}
}
