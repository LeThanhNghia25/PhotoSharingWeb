package controllers.user;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.PhotoService;
import models.user;

@Controller
public class updateprofile {
	@Autowired
	private PhotoService photoService;

	@GetMapping("/editprofile")
	public String viewedit(HttpSession session) {
		user loggedInUser = (user) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/login";
		}
		return "user/editprofile";
	}

	@PostMapping("/updatepro")
	public @ResponseBody String updateProfile(@RequestParam("id") String id, @RequestParam("username") String username,
			@RequestParam("describe") String describe, @RequestParam("birthday") String birthday, HttpSession session)
			throws ParseException {
		int userId = Integer.parseInt(id);
		user user = photoService.findUserById(userId);

		if (user == null) {
			return "error"; // Thêm xử lý lỗi nếu người dùng không tồn tại
		}

		user.setUsername(username);
		user.setDescribe(describe);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date birthdays = dateFormat.parse(birthday);
		user.setBirthday(birthdays);
		photoService.updateProfile(user);
		user updatedUser = photoService.findUserById(userId);
		session.setAttribute("user", updatedUser);
		return "success";
	}

	@PostMapping("/updateavatar")
	public @ResponseBody String uploadavatar(@RequestParam("id") String id, @RequestParam("avatar") MultipartFile file,
			HttpSession session) throws IllegalStateException, IOException {
		String uploadDir = "C:\\Users\\Quan Phan\\Desktop\\CDWeb\\PhotoSharingWeb\\src\\main\\webapp\\resources\\avatar\\";
		user user = new user();
		int ids = Integer.parseInt(id);
		File dest = new File(uploadDir + file.getOriginalFilename());
		file.transferTo(dest);
		user.setId(ids);
		user.setAvatar("resources/avatar/" + file.getOriginalFilename());
		photoService.updateavatar(user);
		session.setAttribute("user", user);
		user updatedUser = photoService.findUserById(ids);
		session.setAttribute("user", updatedUser);
		return "success";

	}
}
