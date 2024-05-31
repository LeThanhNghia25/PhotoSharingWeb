package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Dao.PhotoService;
import models.Category;
import models.Img;
import models.User;

@Controller
public class AdminController {
	@Autowired
	private PhotoService photoService;

	@RequestMapping(value = { "/admin", "/admin/post" }, method = RequestMethod.GET)
	public String admin(Model model) {
		List<Img> imgs = photoService.getAllImgAdmin();
		model.addAttribute("imgs", imgs);
		return "admin/index";
	}

	@RequestMapping(value = { "/admin/user" }, method = RequestMethod.GET)
	public ModelAndView user() {
		ModelAndView mv = new ModelAndView("admin/user");
		return mv;
	}

	@RequestMapping(value = { "updateformimg" }, method = RequestMethod.POST)
	public String updateImg(@RequestParam("fromid") int imgId, @ModelAttribute("img") Img img,
			@RequestParam("title") String title, @RequestParam("content") String content,
			@RequestParam("urlimg") String urlimg, @RequestParam("category") String category,
			@RequestParam("author") String author, @RequestParam("status") String status,
			@RequestParam("createdTime") String createdTime) {
		img.setId(imgId);
		User user = new User();
		user.setUsername(author);
		img.setCreator(user);
		img.setTitle(title);
		img.setContent(content);
		Category ct = new Category();
		ct.setTitle(category);
		img.setCategory(ct);
		img.setImg(urlimg);
		img.setStatus(status);
		img.setCreatedTime(createdTime);
		photoService.updateImg(img);
		return "admin/index";

	}

	@RequestMapping(value = { "/admin/deleteimg" }, method = RequestMethod.GET)
	public ModelAndView deleteImg(@RequestParam("fromid") int imgId) {
		photoService.delete(imgId);
		ModelAndView mv = new ModelAndView("admin/index");
		return mv;
	}

}
