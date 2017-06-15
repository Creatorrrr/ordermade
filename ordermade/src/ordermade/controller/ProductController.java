package ordermade.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ordermade.constants.Constants;
import ordermade.domain.Member;
import ordermade.domain.Product;
import ordermade.domain.Products;
import ordermade.domain.Review;
import ordermade.domain.Reviews;
import ordermade.service.facade.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService pService;

	@RequestMapping(value = "xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerProduct(Product product, HttpSession session) {
		// 상품 등록후 상세 상품페이지로 이동
		if(checkLogined(session)) return "error";	// check logined
		product.setMaker(new Member());
		product.getMaker().setId((String)session.getAttribute("loginId"));
		return pService.registerProduct(product) + "";
	}

	@RequestMapping(value = "xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyProductById(Product product, HttpSession session) {
		// 상품 수정 후 상세 상품페이지로 이동
		if(checkLogined(session)) return "error";	// check logined
		product.setMaker(new Member());
		product.getMaker().setId((String)session.getAttribute("loginId"));
		return pService.modifyProductById(product) + "";
	}

	@RequestMapping(value = "xml/remove.do", method=RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeProductById(String id, HttpSession session) {
		// 상품페이지 삭제후 상품페이지 목록으로 이동
		if(checkLogined(session)) return "error";	// check logined
		return pService.removeProductById(id) + "";
	}

	@RequestMapping(value = "/review/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerReview(Review review, HttpSession session) {
		// Ajax 리뷰 등록후 화면유지
		if(checkLogined(session)) return "member/login";	// check logined
		review.setConsumer(new Member());
		review.getConsumer().setId((String)session.getAttribute("loginId"));
		return pService.registerReview(review) + "";
	}

	@RequestMapping(value = "/review/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyReviewById(Review review, HttpSession session) {
		// Ajax 리뷰 수정후 화면유지
		if(checkLogined(session)) return "member/login";	// check logined
		review.setConsumer(new Member());
		review.getConsumer().setId((String)session.getAttribute("loginId"));
		return pService.modifyReviewById(review) + "";
	}

	@RequestMapping(value = "/review/remove.do", method=RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeReviewById(String id, HttpSession session) {
		// Ajax 리뷰 삭제후 화면유지
		if(checkLogined(session)) return "member/login";	// check logined
		return pService.removeReviewById(id) + "";
	}

	// ***********************************************************************************
	// Product start

	// main start
	@RequestMapping(value = "xml/main/category/hit.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryOrderByHitsForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		if (page == null || page.isEmpty()) page = "1";
		return new Products(pService.findProductsByCategoryOrderByHitsForMain(category, page));
	}

	@RequestMapping(value = "xml/main/category/brandNew.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryOrderByIdForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		if (page == null || page.isEmpty()) page = "1";
		return new Products(pService.findProductsByCategoryOrderByIdForMain(category, page));
	}

	// main end

	@RequestMapping(value = "ajax/product/productId.do", method=RequestMethod.GET)
	public @ResponseBody Product findProductById(String productId) {
		// Ajax 생산품 id 검색으로 생산품 출력
		return pService.findProductById(productId);
	}

	@RequestMapping(value = "/ajax/products/makerid.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findMyProducts(String page, String makerId, HttpSession session) {
		// Ajax 나의 생산품들 전체 출력
		if (page == null || page.isEmpty()) page = "1";
		if (makerId == null || makerId.isEmpty()) {
			makerId = (String)session.getAttribute("loginId");
		}
		return new Products(pService.findProductsByMakerId(makerId, page));
	}
	
	@RequestMapping(value = "/pages/makerid.do", method=RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String findPages(String makerId, HttpSession session) {
		// Ajax 나의 생산품들 전체 출력
		if (makerId == null || makerId.isEmpty()) {
			makerId = (String)session.getAttribute("loginId");
		}
		return pService.findRowsByMakerId(makerId) / Constants.PRODUCT_ROW_SIZE + 1 + "";
	}

	// test : http://localhost:8080/ordermade/ajax/products/category.do
	@RequestMapping(value = "ajax/products/category.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByCategory(String page, String category) {
		// Ajax 한 종류 생산품검색으로 생산품들 출력
		return new Products(pService.findProductsByCategory(category, page));
	}

	@RequestMapping(value = "ajax/products/image.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByImage(String image) {
		// Ajax 생산품 그리고 이미지로 생산품들 출력
		return new Products(pService.findProductsByImage(image));
	}

	@RequestMapping(value = "ajax/products/CT.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryAndTitle(String page, String category, String title) {
		// Ajax 생산품 종류와 내용 검색으로 생산품들 출력
		return new Products(pService.findProductsByCategoryAndTitle(category, title, page));
	}

	@RequestMapping(value = "ajax/products/CM.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryAndMakerName(String page, String category, String makerName) {
		// Ajax 생산자 이름 그리고 생산품 종류로 생산품들 출력
		return new Products(pService.findProductsByCategoryAndMakerName(category, makerName, page));
	}
	
	@RequestMapping(value = "/ajax/products/title.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByTitle(String page, String title) {
		// Ajax 생산자 아이디 그리고 내용으로 생산품들 출력
		return new Products(pService.findProductsByTitle(title, page));
	}
	
	@RequestMapping(value = "/ajax/products/makerName.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByMakerName(String page, String makerName) {
		// Ajax 생산자 아이디 그리고 내용으로 생산품들 출력
		return new Products(pService.findProductsByMakerName(makerName, page));
	}

	@RequestMapping(value = "/ajax/products/MT.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Products findProductsByMakerIdAndTitle(String page, String title, HttpSession session) {
		// Ajax 생산자 아이디 그리고 내용으로 생산품들 출력
		return new Products(pService.findProductsByMakerIdAndTitle(
				(String)session.getAttribute("loginId"), 
				title, 
				page));
	}

	// Product end

	// Review start

	@RequestMapping(value = "/ajax/reviews/productid.do", method=RequestMethod.GET, produces = "application/xml")
	public @ResponseBody Reviews findReviewsByProductId(String page, String productId) {
		// Ajax 생산품 아이디로 리뷰들 출력
		return new Reviews(pService.findReviewsByProductId(productId, page));
	}

	@RequestMapping(value = "/ajax/reviews/TP.do", method=RequestMethod.GET)
	public @ResponseBody Reviews findReviewsByTitleAndProductId(String page, String productId, String title) {
		// Ajax 생산품 아이디 그리고 내용으로 리뷰들 출력
		if(page == null || page.isEmpty()) page = "1";
		return new Reviews(pService.findReviewsByTitleAndProductId(title, productId, page));
	}

	@RequestMapping(value = "/ajax/reviews/CP.do", method=RequestMethod.GET)
	public @ResponseBody Reviews findReviewsByConsumerIdAndProductId(String page, String productId, String consumerId) {
		// Ajax 생산품 아이디 그리고 내용으로 리뷰들 출력
		if(page == null || page.isEmpty()) page = "1";
		return new Reviews(pService.findReviewsByConsumerIdAndProductId(consumerId, productId, page));
	}

	// Review end
	// ************************
	// ui start

	@RequestMapping(value="ui/register.do", method=RequestMethod.GET)
	public String showRegisterProductUI(HttpSession session) {
		// 상품 등록 페이지 productRegister.jsp로 이동
		if(checkLogined(session)) return "member/login";	// check logined
		return "product/register";
	}

	@RequestMapping(value="ui/modify.do", method=RequestMethod.GET)
	public ModelAndView showEditProductUI(String id, HttpSession session) {
		// 상품 수정 페이지로 이동
		if(checkLogined(session)) return new ModelAndView("member/login");	// check logined
		return new ModelAndView("product/modify")
				.addObject("product", pService.findProductById(id));
	}

	@RequestMapping(value="ui/myProducts.do", method=RequestMethod.GET)
	public ModelAndView showMyProductListUI(String page, HttpSession session) {
		// GET 나의 생산품들 출력
		if(checkLogined(session)) return new ModelAndView("member/login");	// check logined
		if(page == null || page.isEmpty()) page = "1";
		return new ModelAndView("product/myProductList")
				.addObject("products", pService.findProductsByMakerId(
						(String)session.getAttribute("loginId"), 
						page));
	}

	@RequestMapping(value="ui/detail.do", method=RequestMethod.GET)
	public ModelAndView showDetailProductUI(String id) {
		// GET 상품 상세정보 출력후 상품 상세 페이지로 이동
		return new ModelAndView("product/detail")
				.addObject("product", pService.findProductById(id));
	}

	@RequestMapping(value="ui/search.do", method=RequestMethod.GET)
	public ModelAndView showSearchProductsUI(String category, String page) {
		if (category == null || category.isEmpty()) category = Constants.CategoryType.values()[0] + "";
		if (page == null || page.isEmpty()) page = "1";
		return new ModelAndView("product/search")
				.addObject("categories", pService.findAllCategory())
				.addObject("category", category)
				.addObject("products", pService.findProductsByCategory(category, page));
	}
	
	@RequestMapping(value="ui/searchMain.do", method=RequestMethod.GET)
	public ModelAndView showSearchProductsUIForMain(String page, String keyword) {
		if (page == null || page.isEmpty()) page = "1";
		return new ModelAndView("product/search")
				.addObject("categories", pService.findAllCategory())
				.addObject("category", "ALL")
				.addObject("products", pService.findProductsByTitle(keyword, page));
	}
	
	// Complete
	private boolean checkLogined(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		return loginId == null || loginId.isEmpty();
	}
}
