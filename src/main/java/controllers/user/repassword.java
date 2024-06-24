package controllers.user;

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
import models.user;

@Controller
public class repassword {
	@Autowired
	private PhotoService photoService;

	@GetMapping("/repass")
	public String repas(Model model,HttpSession session) {
		model.addAttribute("user", new user());
		user loggedInUser = (user) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/login";
		}
		return "user/chagepassword";
	}

	@PostMapping("/repassword")
	public @ResponseBody String repasswrod(@ModelAttribute("user") user user, @RequestParam String passwordnew,
			@RequestParam String repasswordnew, Model model, HttpSession session) {

		user loggedInUser = (user) session.getAttribute("user");
	
		user.setId(loggedInUser.getId()); // Ensure the ID is set
		boolean check = photoService.checkPassword(user);

		if (check) {
			if (!passwordnew.equals(repasswordnew)) {
				return "errorpass";
			}	

			loggedInUser.setPassword(passwordnew);
			photoService.updatePassword(loggedInUser);
			return "success";
		} else {

			return "error-message";
		}
	}
}
