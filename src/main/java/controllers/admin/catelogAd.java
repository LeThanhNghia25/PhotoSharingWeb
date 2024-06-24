package controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.PhotoService;
import models.catalog;

@Controller
public class catelogAd {
	@Autowired
	private PhotoService photoService;
	@PostMapping("/admin/addcatelog")
	public @ResponseBody String adminaddcate(@ModelAttribute("catalog") catalog catalog, Model model) {
	    if (catalog.getCatalogname() == null || catalog.getCatalogname().isEmpty()) {
	        return "catenotnull";
	    }
	    photoService.saveCate(catalog);
	    return "success";
	}

	@PostMapping("/admin/deletecatelog")
	public @ResponseBody String admindeletecate(@ModelAttribute("catalog") catalog catalog, Model model) {
	    photoService.deleteCate(catalog.getId());
	    List<catalog> catalogs = photoService.getAllCate();
	    model.addAttribute("cates", catalogs);
	    return "success";
	}

	@GetMapping("/admin/getAllCatelogs")
	public @ResponseBody List<catalog> getAllCatelogs() {
	    return photoService.getAllCate();
	}

}
