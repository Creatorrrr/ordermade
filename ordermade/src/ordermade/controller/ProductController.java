package ordermade.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ordermade.domain.Product;
import ordermade.service.logic.ProductServiceLogic;

@Controller
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	private ProductServiceLogic pService;
	
	@RequestMapping(value="xml/register.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String registerProduct(Product product, HttpSession session){
		
		return "";
	}
	
	@RequestMapping(value="xml/modify.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String modifyProductById(Product product, HttpSession session){
		if(product.getId()==null) return "error";
		boolean check = pService.modifyProductById(product);
		return check+"";
	} 
	
	@RequestMapping(value="xml/remove.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String removeProductById(String id, HttpSession session){
		if(id==null) return "error";
		boolean check = pService.removeProductById(id);
		return check+"";
	} 
	
	
	@RequestMapping(value="ui/register.do",method=RequestMethod.GET)
	public String showRegisterProductUI(){
		return "product/register";
	}
	
	@RequestMapping(value="ui/modify.do",method=RequestMethod.GET)
	public ModelAndView showEditProductUI(String id){
		Product product = pService.findProductById(id);
		ModelAndView modelAndView = new ModelAndView("product/modify");
		modelAndView.addObject("product", product);
		return modelAndView;
	} 
	
	@RequestMapping(value="ui/detail.do",method=RequestMethod.GET)
	public ModelAndView showDetailProductUI(String id){
		Product product = pService.findProductById(id);
		ModelAndView modelAndView = new ModelAndView("product/detail");
		modelAndView.addObject("product", product);
		return modelAndView;
	} 
	
	@RequestMapping(value="ui/search.do",method=RequestMethod.GET)
	public ModelAndView showSearchProductUI(String type){
		if(type==null) type = "aa";//
		
		List<Product> list = pService.findProductsByCategory(type, "1");
		ModelAndView modelAndView = new ModelAndView("product/search");
		modelAndView.addObject("products", list);
		return modelAndView;
	} 
	
	@RequestMapping(value="ui/mylist.do",method=RequestMethod.GET)
	public ModelAndView showMyProductListUI(HttpSession session){
		//-------session으로 로그인 정보 갖고 오기.
		String makerId = "user1";//
		
		List<Product> list = pService.findProductsByMakerId(makerId, "1");
		ModelAndView modelAndView = new ModelAndView("products/mylist");
		modelAndView.addObject("products", list);
		return modelAndView;
	}
}
