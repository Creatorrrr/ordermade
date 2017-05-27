package ordermade.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.experimental.categories.Categories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ordermade.domain.Category;
import ordermade.domain.Product;
import ordermade.domain.Products;
import ordermade.domain.PurchaseHistories;
import ordermade.domain.PurchaseHistory;
import ordermade.service.facade.ProductService;

@Controller
@RequestMapping("main")
public class MainController {
	
	@Autowired
	private ProductService pService;

	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public ModelAndView showMainUI(String id){
		
		List<Product> hitList = pService.findProductsByCategoryOrderByHitsForMain(id, "1");
		List<Product> OrderList = pService.findProductsByCategoryOrderByIdForMain(id, "1");
		
		ModelAndView model = new ModelAndView("index");
		model.addObject("products", hitList);
		model.addObject("products", OrderList);

		List<Category> category = new ArrayList<>();
		model.addObject("genreList", category);
		
		return model;
	}
	
	@RequestMapping(value="xml/categoryList.do", produces="application/xml")
	public Categories findAllCategories(){
		List<Category> categories = pService.findAllCategory();
	
		return categories;
	}
}
