package controllers.user;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import dao.PhotoService;
import dao.UserService;
import models.Img;
import models.User;
import models.comment;

@Controller
public class details {

    @Autowired
    private PhotoService photoService;
    @Autowired
    private UserService userService;
    @GetMapping("/detail")
    public String replyTopic(@RequestParam(name = "fromitem") int fromitem, Model model) {
    	//Phương thức tìm ảnh id ảnh
        Img img = photoService.findImgById(fromitem);
        if (img == null) {    
            return "user/index";
        }
        // Phương thức hiển thị danh sách bình luận theo id ảnh
        List<comment> comments = photoService.showallcommentpost(fromitem);
        model.addAttribute("img", img);
        model.addAttribute("comments", comments);
        model.addAttribute("comment", new comment());
        return "user/details";
    }
	@PostMapping("/submitComment")
	public String submitComment(@ModelAttribute("comment") comment comment,@RequestParam(name = "fromitem") int fromitem, Model model,Principal principal ) {
		comment.setIdpost(comment.getIdpost());
		comment.setContent(comment.getContent());
		comment.setCreatedTime(new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date()));
		String email = principal.getName();
        User users = userService.getUsers(email);
		comment.setCreator(users);
		photoService.insertComment(comment);

		 return "redirect:/detail?fromitem=" + fromitem;
	}
	
    @GetMapping("/download")
    public void downloadImage(@RequestParam(name = "imagePath") String imagePath, HttpServletResponse response) {
        try {
            // Xử lý đường dẫn ảnh để đảm bảo không bị thừa dấu gạch chéo
            if (imagePath.startsWith("resources/img/")) {
                imagePath = imagePath.substring("resources/img/".length());
            }

            // Đường dẫn gốc tới thư mục chứa ảnh
            String uploadDir = "C:\\Users\\Quan Phan\\Desktop\\New folder (4)\\PhotoSharingWeb\\src\\main\\webapp\\resources\\img\\";
            Path file = Paths.get(uploadDir, imagePath);

            if (Files.exists(file)) {
                response.setContentType("application/octet-stream");
                response.addHeader("Content-Disposition", "attachment; filename=" + file.getFileName().toString());

                try (InputStream inputStream = Files.newInputStream(file)) {
                    int bytesRead;
                    byte[] buffer = new byte[1024];
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        response.getOutputStream().write(buffer, 0, bytesRead);
                    }
                }
                response.getOutputStream().flush();
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("File not found");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

}
