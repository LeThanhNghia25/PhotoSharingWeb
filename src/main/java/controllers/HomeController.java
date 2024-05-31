package controllers;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import Dao.PhotoService;
import models.Category;
import models.Img;
import models.User;

@Controller
public class HomeController {
	@Autowired
	private PhotoService photoService;

	@RequestMapping(value = { "/uploadimage" }, method = RequestMethod.POST)
	public String uploadImage(@ModelAttribute("img") Img img, @RequestParam("title") String title,
			@RequestParam("content") String content, Model model, @RequestParam("url") MultipartFile file,
			HttpSession session) throws IllegalStateException, IOException {

		if (file.isEmpty()) {

		}
		try {
			// Lưu file vào đường dẫn /resources/uploads/
			String uploadDir = "C:\\Users\\Quan Phan\\Desktop\\CDWeb\\PhotoSharingWeb\\src\\main\\webapp\\resources\\img\\";
			File dest = new File(uploadDir + file.getOriginalFilename());
			file.transferTo(dest);

		} catch (IOException e) {
			e.printStackTrace();

		}
		img.setCreatedTime(new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date()));
		img.setStatus("ok");
		User user = (User) session.getAttribute("user");
		img.setCreator(user);
		img.setTitle(title);
		img.setContent(content);

		Category ct = new Category();
		ct.setTitle("acscas");
		img.setCategory(ct);
		img.setImg("resources/img/" + file.getOriginalFilename());
		int result = photoService.saveImg(img);
		if (result > 0) {
			model.addAttribute("message", "Tải ảnh lên thành công!");
		} else {
			model.addAttribute("message", "Tải ảnh lên thất bại!");
		}
		return "user/index"; // Trả về trang kết quả, có thể là trang danh sách ảnh hoặc chi tiết ảnh
	}

	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public ModelAndView index(HttpSession session, Model model) {

		List<Img> imgs = photoService.getAllImg();
		model.addAttribute("imgs", imgs);
		return new ModelAndView("user/index");
	}

	@RequestMapping(value = { "chitietanh" }, method = RequestMethod.GET)
	public ModelAndView chitiet() {
		ModelAndView mv = new ModelAndView("user/details");
		return mv;
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("user/login");
		return mv;
	}
	@PostMapping("/ajaxLogin")
	@ResponseBody
	public Map<String, String> ajaxLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session) {
		Map<String, String> response = new HashMap();
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
	  @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logout(HttpSession session) {
	    	session.invalidate();
	        return "user/login";
	    }
	@RequestMapping(value = { "/profile" }, method = RequestMethod.GET)
	public ModelAndView profile() {
		ModelAndView mv = new ModelAndView("user/profile");
		return mv;
	}
	 @PostMapping("/login")
	    public String login(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
	        User user = photoService.checkUser(email, password);
	        if (user != null) {
	            session.setAttribute("user", user);
	            return "user/index"; // Redirect to home or another page after successful login
	        } else {
	            model.addAttribute("errorMessage", "Invalid email or password.");
	            return "user/login"; // Return to login page with error message
	        }
	    }
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String error404() {
		return "404"; // Trả về tên của trang 404.jsp
	}

	@RequestMapping(value = "/{path:[^\\.]*}")
	public String redirect() {
		return "redirect:/404";
	}

	@ExceptionHandler(NoHandlerFoundException.class)
	public String handle404() {
		return "redirect:/404"; // Redirect đến trang /404 khi có lỗi 404 xuất hiện
	}
}
