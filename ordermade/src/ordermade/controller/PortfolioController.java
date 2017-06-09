package ordermade.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ordermade.constants.Constants;
import ordermade.domain.Category;
import ordermade.domain.Member;
import ordermade.domain.Portfolio;
import ordermade.domain.Portfolios;
import ordermade.service.facade.MemberService;
import ordermade.service.facade.PortfolioService;
import ordermade.service.facade.ProductService;

@Controller
@RequestMapping("portfolio")
public class PortfolioController {

	@Autowired
	private PortfolioService pService;

	@Autowired
	private MemberService mService;
	// ---------action -> xml
	@Autowired
	private ProductService pdService;

	@RequestMapping(value = "xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerPortfolio(Portfolio portfolio, Model model, HttpServletRequest req) {
		
		String imagePath = Constants.IMAGE_PATH;
		boolean check=false;
		
		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		try {
			MultipartRequest mr = new MultipartRequest(req, imagePath, 5*1024*1024 , "UTF-8",
					new DefaultFileRenamePolicy());

			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String category = mr.getParameter("category");
			
//			File image = mr.getFile("image");
			
//			Member maker = new Member();
//			maker.setId((String) req.getSession().getAttribute("loginId"));
			Member maker = mService.findMemberById((String) req.getSession().getAttribute("loginId"));
		
			portfolio.setTitle(title);
			portfolio.setContent(content);
			portfolio.setCategory(category);
	//		portfolio.setImage(image.getCanonicalPath());
			portfolio.setMaker(maker);
			
//			String title = mr.getParameter("title"); + portfolio.setTitle(title);
//			= portfolio.setTitle(mr.getParameter("title"));
//			 portfolio.setCategory(mr.getParameter("category"));
//			 portfolio.setContent(mr.getParameter("content"));
			 
			 portfolio.setImage(mr.getFile("image").getName());
			
			System.out.println("+++++++++++++++++makerId:" + maker);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		check = pService.registerPortfolio(portfolio);
		
		System.out.println("ZZZZZZZZZZZZZZZZZZZz"+ check);
		return check+"";
		
//		if (pService.registerPortfolio(portfolio)) {
//		//	model.addAttribute("portfolio", portfolio);
//			return "portfolio/myPortfolioList";
//		}else {
//			return "portfolio/register";
//		}
	} 

	@RequestMapping(value = "xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyPortfolioById(Model model,Portfolio portfolio, String makerId, HttpServletRequest req) {

		boolean check = false;
		
		String imagePath = Constants.IMAGE_PATH;
		
		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		try {
			MultipartRequest mr = new MultipartRequest(req, imagePath, 5 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());

			String id = mr.getParameter("id");
			
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String category = mr.getParameter("category");
			//File image = mr.getFile("image");
			Member maker = mService.findMemberById((String) req.getSession().getAttribute("loginId"));
		
			portfolio.setId(id);
			
			portfolio.setTitle(title);
			portfolio.setContent(content);
			portfolio.setCategory(category);
			portfolio.setMaker(maker);
			//portfolio.setImage(image.getCanonicalPath());
			portfolio.setImage(mr.getFile("image").getName());

		} catch (IOException e) {
			e.printStackTrace();
		}
//		if (pService.modifyPortfolio(portfolio)) {
////			model.addAttribute("portfolio",portfolio);
////			model.addAttribute("makerId",makerId);
//			return "redirect:/portfolio/detail";
//		} else {
//			throw new RuntimeException("Modify portfolio failed");
//		}
		
		check = pService.modifyPortfolio(portfolio);
		return check +"";
	} 

	@RequestMapping(value = "xml/remove.do", method = RequestMethod.GET, produces = "text/plain")
	public String removePortfolioById(@RequestParam("portfolioId") String id, HttpServletRequest req, Model model) {

		if(!pService.removePortfolio(id)){
			throw new RuntimeException("Remove portfolio failed");
		}
		
		String makerId = (String)req.getSession().getAttribute("loginId");
		List<Portfolio> portfolios = pService.findPortfoliosByMakerId(makerId, "1");
		model.addAttribute("portfolios",portfolios);
		model.addAttribute("makerId",makerId);
		return "portfolio/myList";
		
		
//		if (pService.removePortfolio(id)) {
//			return "/portfolio/myPortfolioList";
//		} else {
//			throw new RuntimeException("Remove member failed");
//		}
	} // test http://localhost:8080/ordermade/portfolio/xml/remove.do?id=10

	// ----------web -> html

	@RequestMapping(value = "ui/register.do", method = RequestMethod.GET)
	public String showRegisterPortfolioUI(/*String makerId,*/ Model model) {

		List<Category> categorys = pdService.findAllCategory();
		model.addAttribute("categorys", categorys);

		// Portfolio portfolio = pService.findPortfolioById(portfolioId);
		// portfolio.setId(portfolioId);
		// model.addAttribute("portfolioId",portfolio.getId());
		// model.addAttribute("portfolioId",portfolioId);
		
//		System.out.println("@@@@@@@@@@@@@@@@@@makerId:" + makerId);
//		
//		model.addAttribute("makerId", makerId);
		return "portfolio/register";

	} // test http://localhost:8080/ordermade/portfolio/ui/register.do

	@RequestMapping(value = "ui/modify.do", method = RequestMethod.GET)
	public ModelAndView showEditPortfolioUI(String id, HttpSession session) {
		
//		return new ModelAndView("portfolio/modify")
//				.addObject("portfolio", pService.findPortfolioById(id));
		System.out.println("ui/modify.do->portfolio/modify@@@@@@@@@@@"+id);
	
//		id = (String)session.getAttribute("loginId");
		Portfolio portfolio = pService.findPortfolioById(id);
		ModelAndView modelAndView = new ModelAndView("portfolio/modify");
		modelAndView.addObject("portfolio", portfolio);
		return modelAndView;
	} // test http://localhost:8080/ordermade/portfolio/ui/modify.do?id=7

	@RequestMapping(value = "ui/detail.do", method = RequestMethod.GET)
	public ModelAndView showDetailPortfolioUI(String id) {
		
		Portfolio portfolio = pService.findPortfolioById(id);
		ModelAndView modelAndView = new ModelAndView("portfolio/detail");
		modelAndView.addObject("portfolio", portfolio);
		
		System.out.println("ui/detail.do->portfolio/detail#########################"+id);  //test
		return modelAndView;

	} // test http://localhost:8080/ordermade/portfolio/ui/detail.do?id=7

	@RequestMapping(value = "ui/search.do", method = RequestMethod.GET)
	public ModelAndView showSearchPortfolioUI(String category, String page) {
		
		if (category == null)
			category = Constants.CategoryType.values()[0] + "";
		if (page == null)
			page = "1";
		return new ModelAndView("portfolio/search")
				.addObject("categories", pService.findAllCategory())
				.addObject("category", category)
				.addObject("portfolio", pService.findPortfoliosByCategory(category, page));
		
//		if(category == null) 
//			category = Constants.CategoryType.values()[0] +"";
//		if(page == null) 
//			page = "1";
//		List<Portfolio> portfolios = pService.findPortfoliosByCategory(category, page);
//		
//		return new ModelAndView("portfolio/search")
//			.addObject("categories", pService.findAllCategory())
//			.addObject("category", category)
//			.addObject("portfolios", portfolios);
	} // test http://localhost:8080/ordermade/portfolio/ui/search.do?type=뷰티

	@RequestMapping(value = "ui/mylist.do", method = RequestMethod.GET)
	public ModelAndView showMyPortfolioListUI(String page, HttpServletRequest req) { 
		// -------session으로 로그인 정보 갖고 오기.
		String makerId = (String) req.getSession().getAttribute("loginId");
		List<Portfolio> portfolios = pService.findPortfoliosByMakerId(makerId, "1");
		
		ModelAndView modelAndView = new ModelAndView("portfolio/myList");
		
		modelAndView.addObject("portfolios", portfolios);
		modelAndView.addObject("makerId", makerId);
		
		System.out.println("ui/mylist.do ######### makerId - " + makerId );       //여기까진 makerId 도착
		return modelAndView;
	}

	// ----------mobile ->xml

	@RequestMapping(value = "xml/search.do", produces = "application/xml")
	public @ResponseBody Portfolios findMyPortfolios(String page, HttpSession session) {

		String makerId = (String) session.getAttribute("loginId");
		//String makerId = "user1";
//		if (page == null)
//			page = "1";
		
		List<Portfolio> pList = pService.findPortfoliosByMakerId(makerId, "1");System.out.println(pList.get(0).getImage());
		Portfolios portfolios = new Portfolios();
		portfolios.setPortfolios(pList);
		
		return portfolios;
	} // test http://localhost:8080/ordermade/portfolio/xml/search.do?page=2

	@RequestMapping(value = "xml/searchByTitle.do", produces = "application/xml")                                 
	public @ResponseBody Portfolios findMyPortfoliosByMakerIdAndTitle(String title, String page, String makerId,  HttpServletRequest req) {         //findPortfoliosByMakerIdAndTitle		

//-------------------------------------		
//		String makerId = (String) req.getSession().getAttribute("loginId");
//		if (page == null || page == "")
//			page = "1";
//
//		System.out.println(makerId);
//		System.out.println(title);
//		List<Portfolio> pList = pService.findPortfoliosByMakerIdAndTitle(title, makerId, "1");
//
//		Portfolios portfolios = new Portfolios();
//		portfolios.setPortfolios(pList);
//
//		return portfolios;
//---------------------------------------
		return new Portfolios(pService.findPortfoliosByMakerIdAndTitle(makerId, title, page));
	} 

	@RequestMapping(value = "xml/searchById.do", produces = "application/xml")
	public @ResponseBody Portfolio findPortfolioById(String id) {
//		if (id == null)
//			return null;
//		return pService.findPortfolioById(id);
		
		Portfolio portfolio = pService.findPortfolioById(id);
		return portfolio;
		
	} // test http://localhost:8080/ordermade/portfolio/xml/searchById.do?id=7
	
	
	//추가---------------------------
	@RequestMapping(value = "ajax/portfolios/CT.do", produces = "application/xml")
	public @ResponseBody Portfolios findPortfoliosByCategoryAndTitle(String page, String category, String title) {
		// Ajax 생산품 종류와 내용 검색으로 생산품들 출력
		return new Portfolios(pService.findPortfoliosByCategoryAndTitle(category, title, page)); 
	}
	
	@RequestMapping(value = "ajax/portfolios/CM.do", produces = "application/xml")
	public @ResponseBody Portfolios findPortfoliosByCategoryAndMakerName(String page, String category, String makerName) {
		// Ajax 생산자 이름 그리고 생산품 종류로 생산품들 출력
		return new Portfolios(pService.findPortfoliosByCategoryAndMakerName(category, makerName, page));
	}
	
	@RequestMapping(value = "ajax/portfolios/category.do", produces = "application/xml")
	public @ResponseBody Portfolios findPortfoliosByCategory(String page, String category) {
		// Ajax 한 종류 생산품검색으로 생산품들 출력
		return new Portfolios(pService.findPortfoliosByCategory(category, page));
	}
	//--------------------------
	
	@RequestMapping("/image.do")
	public void getProductImage(String img, HttpServletResponse resp) {
		File image = new File(Constants.IMAGE_PATH+img);
		//System.out.println(img+"img");
		try {//test
			System.out.println(image.getCanonicalPath());
		} catch (IOException e1) {
			e1.printStackTrace();
		}//--/test

		if(!image.exists()){
			throw new RuntimeException("No product image");
		}
		
		try (InputStream in = new BufferedInputStream(new FileInputStream(image));
				OutputStream out = resp.getOutputStream();){
			byte[] buf = new byte[8096];
			int readByte = 0;
			while((readByte = in.read(buf))>-1){
				out.write(buf,0,readByte);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
