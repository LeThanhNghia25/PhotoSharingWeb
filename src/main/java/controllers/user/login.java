package controllers.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserService;
import models.User;

@Controller
public class login {
	@Autowired
	private UserService userDetailsService; 
	
    @GetMapping("/login")
    public String login() {     
        return "user/login";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "user/register"; 
    }
    
    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value="user") User user) {
    	String errMsg = "";
    	if(user.getEmail().length() > 1) {
    		if(this.userDetailsService.addUser(user)==true)
    			return "redirect:/login";
    		else errMsg = "Da co loi xay ra !";
    	}else errMsg = "Da co account dang ky voi email nay";
        model.addAttribute("errMsg", errMsg);
        return "user/register";  
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }
    
    @GetMapping("/accessDenied")
    public String accessDenied() {
        return "user/accessDenied";
    }
}
