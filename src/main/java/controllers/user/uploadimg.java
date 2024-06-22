package controllers.user;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import dao.PhotoService;
import models.Img;
import models.Catalog;
import models.User;

@Controller
public class uploadimg {
	@Autowired
	private PhotoService photoService;

	@GetMapping("/uploadImage")
	public String updateImg(Model model) {
		model.addAttribute("img", new Img());
		return "user/uploadImage";
	}

	@PostMapping("/uploadImg")
	public String uploadImage(@ModelAttribute("img") Img img, Model model, @RequestParam("url") MultipartFile file,
			HttpSession session) {
		if (file.isEmpty()) {
			model.addAttribute("message", "No file selected");
			return "user/uploadImage";
		}
		try {
			// Save file to the specified directory
			String uploadDir = "C:\\Users\\Quan Phan\\Desktop\\CDWeb\\PhotoSharingWeb\\src\\main\\webapp\\resources\\img\\";
			File dest = new File(uploadDir + file.getOriginalFilename());
			file.transferTo(dest);
			img.setImg("resources/img/" + file.getOriginalFilename());
			img.setCreatedTime(new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date()));
			img.setEnabled(true);
			User user = (User) session.getAttribute("user");
			img.setCreator(user);
			Catalog ct = new Catalog();
			ct.setCatalogname("ok");
			img.setCata(ct);

			int result = photoService.saveImg(img);
			if (result > 0) {
				model.addAttribute("message", "Tải ảnh lên thành công!");
			} else {
				model.addAttribute("message", "Tải ảnh lên thất bại!");
			}
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("message", "File upload failed");
			return "user/uploadImage";
		}

		List<Img> imgs = photoService.getAllImg();
		model.addAttribute("imgs", imgs);
		return "redirect:/home";
	}
}
