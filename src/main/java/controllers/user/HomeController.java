package controllers.user;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.PhotoService;
import models.Img;

@Controller
public class HomeController {
    @Autowired
    private PhotoService photoService;

    @RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
    public ModelAndView index(HttpSession session, Model model) {
        List<Img> imgs = photoService.getAllImg();
        model.addAttribute("imgs", imgs);
        return new ModelAndView("user/index");
    }
    
    @GetMapping("/liveSearch")
    @ResponseBody
    public String liveSearch(@RequestParam("query") String query) {
        List<Img> imgs = photoService.searchImgs(query);
        StringBuilder output = new StringBuilder();
        
        if (imgs.isEmpty()) {
            output.append("<li class='list-group-item'>Không tìm thấy hình ảnh</li>");
        } else {
            for (Img img : imgs) {
                output.append("<li class='list-group-item d-flex align-items-center'>");
                output.append("<a href='").append("/PhotoSharingWeb/detail?fromitem=").append(img.getId()).append("'>");
                output.append("<img src='").append(img.getImg()).append("' alt='").append(img.getTitle()).append("' height='50' class='me-2'>");
                output.append("<span>").append(img.getTitle()).append("</span>");
                output.append("</a></li>");
            }
        }
        return output.toString();
    }

    // Mapping for search results page
    @RequestMapping(value = "/searchResults", method = RequestMethod.GET)
    public String searchResults(@RequestParam("query") String query, Model model) {
        List<Img> searchResults = photoService.searchImgs(query);
        model.addAttribute("search_name", query); // Use query as search_name
        model.addAttribute("imgs", searchResults);
        return "user/searchResults"; // Return the view name
    }

}
