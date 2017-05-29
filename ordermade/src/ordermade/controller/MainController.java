package ordermade.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ordermade.domain.Categories;
import ordermade.service.facade.ProductService;

@Controller
@RequestMapping("main")
public class MainController {
	
	@Autowired
	private ProductService pService;

	@RequestMapping("/main.do")
	public String showMainUI(){
		return "redirect:/views/index.jsp";
	}
	
	@RequestMapping(value="xml/categoryList.do", produces="application/xml")
	public @ResponseBody Categories findAllCategories(){
		return new Categories(pService.findAllCategory());
	}
}
