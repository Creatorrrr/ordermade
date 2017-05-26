package ordermade.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ordermade.domain.Member;
import ordermade.domain.Portfolio;
import ordermade.domain.Portfolios;
import ordermade.service.logic.PortfolioServiceLogic;

@Controller
@RequestMapping("portfolio")
public class PortfolioController {

	@Autowired
	private PortfolioServiceLogic service;
	
	
	//---------action -> xml
	
	@RequestMapping(value="xml/register.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String registerPortfolio(Portfolio portfolio, HttpSession session){
		System.out.println("----------------"+portfolio.toString());
//		System.out.println("----------------"+portfolio.getMaker().getId());
		if(portfolio.getTitle()==null) return "error";
		boolean check = service.registerPortfolio(portfolio);
		return check+"";
	}  //test http://localhost:8080/ordermade/portfolio/xml/register.do
	   //post {"title":"asdfadsf","maker.id":"user1\n","image":"asdf.jpg","content":"aaaaaaa","tags[0].id":"1","category":"aaa"}
	
	
	
	@RequestMapping(value="xml/modify.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String modifyPortfolioById(Portfolio portfolio, HttpSession session){
		if(portfolio.getId()==null) return "error";
		boolean check = service.modifyPortfolio(portfolio);
		return check+"";
	}  //test http://localhost:8080/ordermade/portfolio/xml/modify.do
	   //{"title":"asdfadsf","maker.id":"user1\n","image":"asdf.jpg","content":"aaaaaaa","tags[0].id":"1","category":"aaa","id":"10"}
		
	
	@RequestMapping(value="xml/remove.do", method=RequestMethod.GET, produces="text/plain")
	public @ResponseBody String removePortfolioById(String id, HttpSession session){
		if(id==null) return "error";
		boolean check = service.removePortfolio(id);
		return check+"";
	} //test http://localhost:8080/ordermade/portfolio/xml/remove.do?id=10
	
	
	
	
	//----------web  -> html
	
	@RequestMapping(value="ui/register.do",method=RequestMethod.GET)
	public String showRegisterPortfolioUI(){
		return "portfolio/register";
	} //test http://localhost:8080/ordermade/portfolio/ui/register.do
	
	@RequestMapping(value="ui/modify.do",method=RequestMethod.GET)
	public ModelAndView showEditPortfolioUI(String id){
		Portfolio portfolio = service.findPortfolioById(id);
		ModelAndView modelAndView = new ModelAndView("portfolio/modify");
		modelAndView.addObject("portfolio", portfolio);
		return modelAndView;
	} //test http://localhost:8080/ordermade/portfolio/ui/modify.do?id=7
	
	@RequestMapping(value="ui/detail.do",method=RequestMethod.GET)
	public ModelAndView showDetailPortfolioUI(String id){
		Portfolio portfolio = service.findPortfolioById(id);
		ModelAndView modelAndView = new ModelAndView("portfolio/detail");
		modelAndView.addObject("portfolio", portfolio);
		return modelAndView;
	} //test http://localhost:8080/ordermade/portfolio/ui/detail.do?id=7
	
	@RequestMapping(value="ui/search.do",method=RequestMethod.GET)
	public ModelAndView showSearchPortfolioUI(String type){
		if(type==null) type = "aa";//
		
		List<Portfolio> list = service.findPortfoliosByCategory(type, "1");
		ModelAndView modelAndView = new ModelAndView("portfolio/search");
		modelAndView.addObject("portfolios", list);
		return modelAndView;
	} //test http://localhost:8080/ordermade/portfolio/ui/search.do?type=aa
	
	@RequestMapping(value="ui/mylist.do",method=RequestMethod.GET)
	public ModelAndView showMyPortfolioListUI(HttpSession session){
		//-------session으로 로그인 정보 갖고 오기.
		String makerId = "user1";//
		
		List<Portfolio> list = service.findPortfoliosByMakerId(makerId, "1");
		ModelAndView modelAndView = new ModelAndView("portfolio/mylist");
		modelAndView.addObject("portfolios", list);
		return modelAndView;
	} //test http://localhost:8080/ordermade/portfolio/ui/mylist.do
	
	
	
	
	
	//----------mobile ->xml
	
	@RequestMapping(value="xml/search.do", produces="application/xml")
	public @ResponseBody Portfolios findMyPortfolios(String page, HttpSession session){
		//-------session으로 로그인 정보 갖고 오기.
		String makerId = "user1";
		
		if(page == null) page = "1";
		List<Portfolio> list = service.findPortfoliosByMakerId(makerId, page);
		Portfolios portfolios = new Portfolios();
		portfolios.setPortfolios(list);
		return portfolios;
	} //test http://localhost:8080/ordermade/portfolio/xml/search.do?page=2
	
	
	@RequestMapping(value="xml/searchByTitle.do", produces="application/xml")
	public @ResponseBody Portfolios findMyPortfoliosByTitle(String title, String page, HttpSession session){
		//-------session으로 로그인 정보 갖고 오기.
		String makerId = "user1";
		
		if(page == null) page = "1";
		List<Portfolio> list = service.findPortfoliosByMakerIdAndTitle(makerId, title, page);
		Portfolios portfolios = new Portfolios();
		portfolios.setPortfolios(list);
		return portfolios;
	} //test http://localhost:8080/ordermade/portfolio/xml/search2.do?title=a&page=2
	
	
	@RequestMapping(value="xml/searchById.do", produces="application/xml")
	public @ResponseBody Portfolio findPortfolioById(String id){
		if(id==null) return null;
		return service.findPortfolioById(id);
	} //test http://localhost:8080/ordermade/portfolio/xml/searchById.do?id=7
	

	
	
}
