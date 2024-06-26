package controllers.user;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.PhotoService;
import models.Img;
import models.catalog;
import models.User;
import dao.UserService; // Assuming you have a UserService to fetch User by username

@Controller
public class uploadimg {
    @Autowired
    private PhotoService photoService;

    @Autowired
    private UserService userService; // Assuming you have this service

    @GetMapping("/uploadImage")
    public String updateImg(Model model) {
        model.addAttribute("img", new Img());
        return "user/uploadImage";
    }

    @PostMapping("/uploadImg")
    public @ResponseBody String uploadImage(@Valid @ModelAttribute("img") Img img, BindingResult bindingResult,
            Model model, @RequestParam("url") MultipartFile file, @RequestParam("Firearm") String Firearm,@RequestParam("Gore") String Gore,
            @RequestParam("Nudity") String Nudity,
            Principal principal) throws IllegalStateException, IOException {

        if (bindingResult.hasErrors()) {
            StringBuilder errors = new StringBuilder();
            bindingResult.getAllErrors().forEach(error -> errors.append(error.getDefaultMessage()).append("<br/>"));
            return errors.toString();
        }
        if (file.isEmpty()) {
            return "fileempty";
        }

        String uploadDir = "C:\\Users\\Quan Phan\\Desktop\\New folder (4)\\PhotoSharingWeb\\src\\main\\webapp\\resources\\img\\";
        File dest = new File(uploadDir + file.getOriginalFilename());
        file.transferTo(dest);
        img.setImg("resources/img/" + file.getOriginalFilename());
        img.setCreatedTime(new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date()));

        String email = principal.getName();
        User user = userService.getUsers(email);
   
        if (user == null) {
            return "User not found"; // Xử lý trường hợp user null
        }
        img.setCreator(user);

        catalog ct = new catalog();
        if (file.getOriginalFilename().endsWith(".gif")) {
            ct.setId(2);
        } else {
            ct.setId(1);
        }
        int Firearms = Integer.parseInt(Firearm);
        int Gores = Integer.parseInt(Gore);
        int Nuditys = Integer.parseInt(Nudity);
        img.setCata(ct);
        if (Firearms > 65 || Gores > 65 || Nuditys>65) {
            img.setStatus("off");
        } else {
            img.setStatus("ok");
        }

        photoService.saveImg(img);

        List<Img> imgs = photoService.getAllImg();
        model.addAttribute("imgs", imgs);
        return "success";
    }
}
