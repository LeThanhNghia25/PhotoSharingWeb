package controllers.user;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.PhotoService;
import dao.UserService;
import models.User;

@Controller
public class repassword {

    @Autowired
    private PhotoService photoService;

    @Autowired
    private UserService userService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @GetMapping("/repass")
    public String repass(Model model) {
        model.addAttribute("user", new User());
        return "user/chagepassword";
    }

    @PostMapping("/repassword")
    public @ResponseBody String repasswrod(@ModelAttribute("user") User user,
            @RequestParam String password, @RequestParam String passwordnew,
            @RequestParam String repasswordnew, Model model, Principal principal) {
        String email = principal.getName();
        User users = userService.getUsers(email);

        // Kiểm tra mật khẩu cũ
        if (!passwordEncoder.matches(password, users.getPassword())) {
            return "error-message";
        }

        if (!passwordnew.equals(repasswordnew)) {
            return "errorpass";
        }

        // Mã hóa mật khẩu mới trước khi lưu vào cơ sở dữ liệu
        String encodedPassword = passwordEncoder.encode(passwordnew);
        user.setId(users.getId()); 
        user.setPassword(encodedPassword);
        photoService.updatePassword(user);
        return "success";
    }
}
