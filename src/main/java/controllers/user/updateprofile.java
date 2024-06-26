package controllers.user;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.PhotoService;
import dao.UserService;
import models.User;

@Controller
public class updateprofile {
	@Autowired
	private PhotoService photoService;

	@Autowired
	private UserService userService;

	@GetMapping("/editprofile")
	public String showEditProfile(Principal principal, Model model) {
		String email = principal.getName();
		User user = userService.getUsers(email);
		model.addAttribute("user", user);
		return "user/editprofile";
	}

	@PostMapping("/updatepro")
	public @ResponseBody String updateProfile(@Valid @RequestParam("username") String username,
	                                          @RequestParam("description") String description,
	                                          Principal principal) throws ParseException {
	    // Fetch email from the Principal
	    String email = principal.getName();
	    
	    // Retrieve the user by email
	    User user = userService.getUsers(email);
	    
	    // Update user details
	    user.setUsername(username);
	    user.setDescription(description);
	    
	    // Update profile in the database
	    photoService.updateProfile(user);
	    
	    // Return a view name or redirect
	    return "success";
	}


	@PostMapping("/updateavatar")
	public @ResponseBody String uploadavatar(@RequestParam("id") String id, @RequestParam("avatar") MultipartFile file)
			throws IllegalStateException, IOException {
		String uploadDir = "C:\\Users\\Quan Phan\\Desktop\\New folder (4)\\PhotoSharingWeb\\src\\main\\webapp\\resources\\avatar\\";
		int userId = Integer.parseInt(id);

		// Lấy thông tin người dùng
		User user = photoService.findUserById(userId);
		if (user == null) {
			return "error"; // Xử lý khi người dùng không tồn tại
		}

		// Đảm bảo thư mục tồn tại, nếu không có thì tạo mới
		File directory = new File(uploadDir);
		if (!directory.exists()) {
			directory.mkdirs(); // Tạo thư mục và tất cả các thư mục cha cần thiết
		}

		// Lưu tập tin vào đường dẫn được chỉ định
		String originalFileName = file.getOriginalFilename();
		String filePath = uploadDir + originalFileName;
		File dest = new File(filePath);
		file.transferTo(dest);

		// Cập nhật thông tin avatar của người dùng
		user.setAvatar("resources/avatar/" + originalFileName);
		photoService.updateavatar(user);

		return "success";
	}

}
