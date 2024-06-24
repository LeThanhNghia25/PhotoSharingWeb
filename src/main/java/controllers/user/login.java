package controllers.user;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.PhotoService;
import models.user;

@Controller
public class login {
	@Autowired
	private PhotoService photoService;

	@GetMapping("/login")
	public ModelAndView login(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			// Nếu đã đăng nhập, chuyển hướng lại trang chính
			return new ModelAndView("redirect:/");
		}
		model.addAttribute("user", new user());
		return new ModelAndView("user/login");
	}

	@GetMapping("/registor")
	public String showRegistrationForm(Model model) {
		model.addAttribute("user", new user()); // Ensure 'User' is your model class
		return "user/register"; // Make sure this matches your JSP path
	}

	@PostMapping("/loginForm")
	public @ResponseBody String loginForm(@Valid @ModelAttribute("user") user user, BindingResult result,
			HttpSession session) {
		user foundUser = photoService.checkUser(user.getEmail(), user.getPassword());
		if (foundUser != null) {
			session.setAttribute("user", foundUser);
			return "success"; // Return a success message
		} else {
			return "erroremailofpass"; // Trả về thông báo lỗi thông thường nếu thông tin đăng nhập không chính
												// xác
		}
	}

	@PostMapping("/registerForm")
	public @ResponseBody String register(@Valid @ModelAttribute("user") user user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			StringBuilder errors = new StringBuilder();
			result.getAllErrors().forEach(error -> errors.append(error.getDefaultMessage()).append("<br/>"));
			return errors.toString();
		}

		if (photoService.isEmailExist(user.getEmail())) {
			return "email_exist";
		}
		user.setAvatar("resources/avatar/av0.jpg");
		photoService.RegistorUser(user);
		return "success"; // Redirect to login page after successful registration
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// Xóa thông tin đăng nhập khỏi session
		session.removeAttribute("user");
		// Hoặc session.invalidate(); nếu bạn muốn xóa toàn bộ session
		return "redirect:/";
	}
}
