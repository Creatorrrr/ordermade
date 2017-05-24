package ordermade.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ordermade.domain.Product;
import ordermade.service.facade.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	@RequestMapping(value="/product/register.do", method=RequestMethod.GET)
	public String registerProductPage(Product productPage, HttpSession session) {
		return "";
	}
}
