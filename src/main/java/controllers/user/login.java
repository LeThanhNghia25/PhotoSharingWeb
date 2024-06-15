package controllers.user;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.PhotoService;
import models.User;

@Controller
public class login {
	@Autowired
	private PhotoService photoService;
	
    @RequestMapping("/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error, Model model, HttpSession session) {
        if (session.getAttribute("user") != null) {
            return new ModelAndView("redirect:/");
        }
        model.addAttribute("user", new User());
        return new ModelAndView("user/login");
    }

    @RequestMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User()); // Ensure 'User' is your model class
        return "user/register"; // Make sure this matches your JSP path
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }
}
