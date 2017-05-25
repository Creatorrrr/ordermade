package ordermade.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ordermade.domain.Portfolio;
import ordermade.domain.Portfolios;
import ordermade.service.logic.PortfolioServiceLogic;

@Controller
public class PortfolioController {

	@Autowired
	private PortfolioServiceLogic service;
	
	
	//---------action -> xml
	
	public String registerPortfolio(@ModelAttribute Portfolio portfolio, HttpSession session){
		return null;
	}
	
//	@RequestMapping(value="/portfolio/modify.do",method=RequestMethod.POST)
//	public String modifyPortfolioById(Portfolio portfolio, HttpSession session){
//		return null;
//	}
	
	public String removePortfolioById(String id, HttpSession session){
		return null;
	}
	
	//----------web  -> html
	
	public String showRegisterPortfolioUI(){
		return "";
	}
	
	@RequestMapping(value="/portfolio/modify.do",method=RequestMethod.GET)
	public ModelAndView showEditPortfolioUI(@RequestParam("id") String id){
		System.out.println("-------------------");
		Portfolio portfolio = service.findPortfolioById(id);
		System.out.println("-------------------");
		ModelAndView modelAndView = new ModelAndView("modify");
		modelAndView.addObject("portfolio", portfolio);
		return modelAndView;
	}
	
	public ModelAndView showDetailPortfolioUI(){
		return null;
	}
	
	public ModelAndView showSearchPortfolioUI(){
		return null;
	}
	
	public ModelAndView showMyPortfolioListUI(){
		return null;
	}
	
	
	//----------mobile ->xml
	
	
	public Portfolios findMyPortfolios(String page, HttpSession session){
		return null;
	}
	
	public Portfolios findMyPortfoliosByTitle(String title, String page, HttpSession session){
		return null;
	}
	
	
	public Portfolio findPortfolioById(String id){
		return null;
	}
	

	
	
}
