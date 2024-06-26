package controllers.user;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.PhotoService;
import dao.UserService;
import models.User;

@Controller
public class repassword {
	@Autowired
	private PhotoService photoService;
	@Autowired
	private UserService userService;

	@GetMapping("/repass")
	public String repas(Model model) {
		model.addAttribute("user", new User());

		return "user/chagepassword";
	}

	@PostMapping("/repassword")
	public @ResponseBody String repasswrod(@ModelAttribute("user") User user, @RequestParam String passwordnew,
			@RequestParam String repasswordnew, Model model, Principal principal) {
		String email = principal.getName();
		User users = userService.getUsers(email);

		user.setId(users.getId()); // Ensure the ID is set
		boolean check = photoService.checkPassword(user);

		if (check) {
			if (!passwordnew.equals(repasswordnew)) {
				return "errorpass";
			}

			user.setPassword(passwordnew);
			photoService.updatePassword(user);
			return "success";
		} else {

			return "error-message";
		}
	}
}
