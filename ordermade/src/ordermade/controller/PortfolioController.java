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
	public @ResponseBody String registerPortfolio(Portfolio portfolio, HttpServletRequest req) {

		String imagePath = Constants.IMAGE_PATH;

		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		try {
			MultipartRequest mr = new MultipartRequest(req, imagePath, 5 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());

			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String category = mr.getParameter("category");
			// File image = mr.getFile("portfolioImage");
			String makerId = mr.getParameter("makerId");

			Member maker = mService.findMemberById((String) req.getSession().getAttribute("loginId"));
			maker.setId(makerId);

			portfolio.setTitle(title);
			portfolio.setContent(content);
			portfolio.setCategory(category);
			// portfolio.setImage(image.getCanonicalPath());
			portfolio.setMaker(maker);

			// portfolio.setTitle(mr.getParameter("title"));
			portfolio.setImage(mr.getFile("image").getName());

		} catch (IOException e) {
			e.printStackTrace();
		}

		if (!pService.registerPortfolio(portfolio)) {
			return "/portfolio/register";
		} else {
			return "/portfolio/detail";
		}
	} // test http://localhost:8080/ordermade/portfolio/xml/register.do
		// post
		// {"title":"asdfadsf","maker.id":"user1\n","image":"asdf.jpg","content":"aaaaaaa","tags[0].id":"1","category":"aaa"}

	@RequestMapping("/image.do")
	public void getPortfolioImage(String img, HttpServletResponse resp) {
		File image = new File(Constants.IMAGE_PATH + img);

		if (!image.exists()) {
			throw new RuntimeException("No portfolio image");
		}

		try (InputStream in = new BufferedInputStream(new FileInputStream(image));
				OutputStream out = resp.getOutputStream();) {
			byte[] buf = new byte[8096];
			int readByte = 0;
			while ((readByte = in.read(buf)) > -1) {
				out.write(buf, 0, readByte);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyPortfolioById(Portfolio portfolio, HttpServletRequest req) {

		String imagePath = Constants.IMAGE_PATH;
		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		try {
			MultipartRequest mr = new MultipartRequest(req, imagePath, 5 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());

			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String category = mr.getParameter("category");
			File image = mr.getFile("image");
			Member maker = mService.findMemberById((String) req.getSession().getAttribute("loginId"));

			portfolio.setTitle(title);
			portfolio.setContent(content);
			portfolio.setCategory(category);
			portfolio.setImage(image.getCanonicalPath());
			portfolio.setMaker(maker);

		} catch (IOException e) {
			e.printStackTrace();
		}
		if (pService.modifyPortfolio(portfolio)) {
			return "redierct:/portfolio/detail";
		} else {
			throw new RuntimeException("Modify portfolio failed");
		}
	} // test http://localhost:8080/ordermade/portfolio/xml/modify.do
		// {"title":"asdfadsf","maker.id":"user1\n","image":"asdf.jpg","content":"aaaaaaa","tags[0].id":"1","category":"aaa","id":"10"}

	@RequestMapping(value = "xml/remove.do", method = RequestMethod.GET, produces = "text/plain")
	public String removePortfolioById(@RequestParam("portfolioId") String id, HttpServletRequest req) {

		if (!pService.removePortfolio(id)) {
			return "/portfolio/detail";
		} else {
			return "/portfolio/myPortfolioList";
		}
	} // test http://localhost:8080/ordermade/portfolio/xml/remove.do?id=10

	// ----------web -> html

	@RequestMapping(value = "ui/register.do", method = RequestMethod.GET)
	public String showRegisterPortfolioUI(String makerId, Model model) {

		List<Category> categorys = pdService.findAllCategory();
		model.addAttribute("categorys", categorys);

		// Portfolio portfolio = pService.findPortfolioById(portfolioId);
		// portfolio.setId(portfolioId);
		// model.addAttribute("portfolioId",portfolio.getId());
		// model.addAttribute("portfolioId",portfolioId);

		model.addAttribute("makerId", makerId);
		return "portfolio/register";

	} // test http://localhost:8080/ordermade/portfolio/ui/register.do

	@RequestMapping(value = "ui/modify.do", method = RequestMethod.GET)
	public ModelAndView showEditPortfolioUI(String id) {
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
		return modelAndView;

	} // test http://localhost:8080/ordermade/portfolio/ui/detail.do?id=7

	@RequestMapping(value = "ui/search.do", method = RequestMethod.GET)
	public ModelAndView showSearchPortfolioUI(String type) {
		// if(type==null) type = "aa";//
		List<Portfolio> portfolios = pService.findPortfoliosByCategory(type, "1");

		ModelAndView modelAndView = new ModelAndView("portfolio/search");
		modelAndView.addObject("portfolios", portfolios);
		return modelAndView;
	} // test http://localhost:8080/ordermade/portfolio/ui/search.do?type=aa

	@RequestMapping(value = "ui/mylist.do", method = RequestMethod.GET)
	public ModelAndView showMyPortfolioListUI(HttpSession session) { // String
																		// page
		// -------session으로 로그인 정보 갖고 오기.
		String makerId = (String) session.getAttribute("loginId");

		List<Portfolio> portfolios = pService.findPortfoliosByMakerId(makerId, "1");
		ModelAndView modelAndView = new ModelAndView("/portfolio/myPortfolioList");
		modelAndView.addObject("portfolios", portfolios);
		return modelAndView;
	}

	// ----------mobile ->xml

	@RequestMapping(value = "xml/search.do", produces = "application/xml")
	public @ResponseBody Portfolios findMyPortfolios(String page, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");

		String makerId = "user1";

		if (page == null)
			page = "1";
		List<Portfolio> list = pService.findPortfoliosByMakerId(makerId, page);
		Portfolios portfolios = new Portfolios();
		portfolios.setPortfolios(list);
		return portfolios;
	} // test http://localhost:8080/ordermade/portfolio/xml/search.do?page=2

	@RequestMapping(value = "xml/searchByTitle.do", produces = "application/xml")
	public @ResponseBody Portfolios findMyPortfoliosByTitle(String title, String page, HttpSession session) {
		// -------session으로 로그인 정보 갖고 오기.
		String loginId = (String) session.getAttribute("loginId");

		String makerId = "user1";

		if (page == null)
			page = "1";
		List<Portfolio> list = pService.findPortfoliosByMakerIdAndTitle(makerId, title, page);
		Portfolios portfolios = new Portfolios();
		portfolios.setPortfolios(list);
		return portfolios;
	} // test
		// http://localhost:8080/ordermade/portfolio/xml/search2.do?title=a&page=2

	@RequestMapping(value = "xml/searchById.do", produces = "application/xml")
	public @ResponseBody Portfolio findPortfolioById(String id) {
		if (id == null)
			return null;
		return pService.findPortfolioById(id);
	} // test http://localhost:8080/ordermade/portfolio/xml/searchById.do?id=7

}
