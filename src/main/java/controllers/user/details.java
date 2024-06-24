package controllers.user;

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

import dao.PhotoService;
import models.Img;
import models.comment;
import models.user;

@Controller
public class details {
	@Autowired
	private PhotoService photoService;

	@GetMapping("/detai")
	public String replyTopic(@RequestParam(name = "fromitem") int fromitem, Model model) {
		Img img = photoService.findImgById(fromitem);
		List<comment> comments = photoService.showallcomment(fromitem);
		if (img == null) {
			// Handle the case where no image is found
			model.addAttribute("error", "Image not found");
			return "user/error"; // Ensure you have an error page to handle this
		}
		model.addAttribute("img", img);
		model.addAttribute("comments", comments);
		model.addAttribute("comment", new comment());
		return "user/details";
	}

	@PostMapping("/submitComment")
	public String submitComment(@ModelAttribute("comment") comment comment,@RequestParam(name = "fromitem") int fromitem, Model model, HttpSession session) {
		comment.setIdpost(comment.getIdpost());
		comment.setContent(comment.getContent());
		comment.setCreatedTime(new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date()));
		user user = (user) session.getAttribute("user");
		comment.setCreator(user);
		photoService.insertComment(comment);

		 return "redirect:/detai?fromitem=" + fromitem;
	}
}
