package controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import models.User;
import dao.PhotoService;

@Controller
public class userAd {
	@Autowired
	private PhotoService photoService;

	@PostMapping("/admin/updateuser")
	public String updateImg(@ModelAttribute("user") User user, Model model) {
		photoService.updateUserAd(user);
		List<User> users = photoService.getAllUsers();
		model.addAttribute("users", users);

		return "redirect:/admin/user";

	}

	@GetMapping("/admin/deleteuser")
	public String deleteUser(@ModelAttribute("user") User user, Model model) {
		photoService.deleteUser(user.getId());
		List<User> users = photoService.getAllUsers();
		model.addAttribute("users", users);
		return "redirect:/admin/user";

	}
}
