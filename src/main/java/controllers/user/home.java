package controllers.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.PhotoService;
import models.Img;

@Controller
public class home {
	@Autowired
	private PhotoService photoService;
	
	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public ModelAndView index(HttpSession session, Model model) {

		List<Img> imgs = photoService.getAllImg();
		model.addAttribute("imgs", imgs);
		return new ModelAndView("user/index");
	}
	
}
