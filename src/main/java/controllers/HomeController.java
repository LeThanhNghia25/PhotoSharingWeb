package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Dao.PhotoService;
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

	@RequestMapping(value = { "/loginhome" }, method = RequestMethod.POST)
	public ModelAndView loginhome(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, Model model) {
		User user = photoService.checkUser(username, password);
		if (user != null) {
			session.setAttribute("user", user);
			return new ModelAndView("user/index");
		} else {
			model.addAttribute("error", "Sai tên tài khoản hoặc mật khẩu");
			return new ModelAndView("user/index");
		}
	}
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("user/login");
		return mv;
	}
	@RequestMapping(value = { "/profile" }, method = RequestMethod.GET)
	public ModelAndView profile() {
		ModelAndView mv = new ModelAndView("user/profile");
		return mv;
	}
}
