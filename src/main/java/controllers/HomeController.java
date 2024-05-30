package controllers;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Dao.PhotoService;
import models.Comment;
import models.Img;
import models.User;

@Controller
public class HomeController {
	@Autowired
	private PhotoService photoService;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView index(Model model) {
		List<Img> imgs = photoService.getAllImg();
		model.addAttribute("imgs", imgs);
		return new ModelAndView("user/index");
	}

	@RequestMapping(value = { "chitietanh" }, method = RequestMethod.GET)
	public ModelAndView chitiet() {
		ModelAndView mv = new ModelAndView("user/details");
		return mv;
	}

	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public ModelAndView indexam() {
		ModelAndView mv = new ModelAndView("admin/index");
		return mv;
	}

	@RequestMapping(value = { "/admin/user" }, method = RequestMethod.GET)
	public ModelAndView adminus() {
		ModelAndView mv = new ModelAndView("admin/user");
		return mv;
	}

	@RequestMapping(value = { "/admin/post" }, method = RequestMethod.GET)
	public ModelAndView admin() {
		ModelAndView mv = new ModelAndView("admin/post");
		return mv;
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("user/login");
		return mv;
	}

	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String showRegistrationForm(Model model) {
		return "user/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@RequestParam("username") String username, @RequestParam("birthday") String birthday,
			@RequestParam("email") String email, @RequestParam("password") String password) {
		// Create a new User object and set its properties
		User newUser = new User();
		newUser.setUsername(username);
		newUser.setBirthday(Date.valueOf(birthday));
		newUser.setEmail(email);
		newUser.setPassword(password);
		photoService.saveUser(newUser);

		return "user/login";
	}

	@RequestMapping(value = { "/profile" }, method = RequestMethod.GET)
	public ModelAndView profile() {
		ModelAndView mv = new ModelAndView("user/profile");
		return mv;
	}

	@PostMapping("/ajaxLogin")
	@ResponseBody
	public Map<String, String> ajaxLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session) {
		Map<String, String> response = new HashMap<>();
		User user = photoService.checkUser(email, password);
		if (user != null) {
			session.setAttribute("user", user);
			response.put("status", "success");
		} else {
			response.put("status", "error");
			response.put("message", "Invalid email or password.");
		}
		return response;
	}
	
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
    	session.invalidate();
        return "user/login";
    }
	
    @RequestMapping(value = "/imageDetails", method = RequestMethod.GET)
    public String getImageDetails(@RequestParam("id") int id, Model model) {
        Img img = photoService.getImgById(id);
        model.addAttribute("img", img);
        return "user/details";
    }

}
