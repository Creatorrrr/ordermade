package ordermade.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import ordermade.domain.Product;
import ordermade.domain.Products;
import ordermade.domain.Review;
import ordermade.domain.Reviews;
import ordermade.service.facade.MemberService;
import ordermade.service.facade.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService pService;
	@Autowired
	private MemberService mService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerProduct(Model model, Product product, HttpServletRequest req) {
		// 상품 등록후 상세 상품페이지로 이동

		String imagePath = Constants.IMAGE_PATH;

		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		MultipartRequest mr;
		try {
			mr = new MultipartRequest(req, imagePath, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			String title = mr.getParameter("productTitle");
			String category = mr.getParameter("category");
			String content = mr.getParameter("productContent");

			File image = mr.getFile("image");

			int price = Integer.parseInt(mr.getParameter("price"));
			int period = Integer.parseInt(mr.getParameter("period"));
			int hit = 0;

			Member maker = mService.findMemberById((String) req.getSession().getAttribute("loginId"));

			product.setTitle(title);
			product.setCategory(category);
			product.setContent(content);
			product.setImage(image.getCanonicalPath());
			product.setPrice(price);
			product.setPeriod(period);
			product.setMaker(maker);
			product.setHit(hit);

			// List<Product> productList =
			// pService.findProductsByCategory(category, "1");
			// ModelAndView mv = new ModelAndView("");
			// mv.addObject("produts", productList);
			// Model model = model.addAttribute("produts",productList);

		} catch (IOException e) {
			e.printStackTrace();
		}
		if (!pService.registerProduct(product)) {
			return "product/productRegister";
		} else {
			model.addAttribute("product", product);
			return "product/productDetailTest";
		}

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyProductById(Product product, HttpServletRequest req) {
		// 상품 수정 후 상세 상품페이지로 이동

		String imagePath = Constants.IMAGE_PATH;

		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		MultipartRequest mr;
		try {
			mr = new MultipartRequest(req, imagePath, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

			String title = mr.getParameter("title");
			String category = mr.getParameter("category");
			String content = mr.getParameter("content");

			File image = mr.getFile("image");

			int price = Integer.parseInt(mr.getParameter("price"));
			int period = Integer.parseInt(mr.getParameter("period"));
			int hit = Integer.parseInt(mr.getParameter("hit"));
			Member maker = mService.findMemberById((String) req.getSession().getAttribute("loginId"));

			product.setTitle(title);
			product.setCategory(category);
			product.setContent(content);

			product.setImage(image.getCanonicalPath());

			product.setPrice(price);
			product.setPeriod(period);

			product.setMaker(maker);

			product.setHit(hit);
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (!pService.registerProduct(product)) {
			return "";
		} else {
			return "detailProduct";
		}
	}

	@RequestMapping("/remove")
	public String removeProductById(@RequestParam("productId") String id, HttpServletRequest req) {
		// 상품페이지 삭제후 상품페이지 목록으로 이동
		if (!pService.removeProductById(id)) {
			return "";
		} else {
			return "/product/productList";
		}
	}

	@RequestMapping(value = "/review/register.do")

	public @ResponseBody String registerReview(Review review, HttpServletRequest req) {
		// Ajax 리뷰 등록후 화면유지
		Member consumer = mService.findMemberById((String) req.getSession().getAttribute("loginId"));
		review.setConsumer(consumer);
		boolean check = pService.registerReview(review);
		return check + "";
	}

	@RequestMapping(value = "/review/modify", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyReviewById(Review review, HttpServletRequest req) {
		// Ajax 리뷰 수정후 화면유지
		Member consumer = mService.findMemberById((String) req.getSession().getAttribute("loginId"));
		review.setConsumer(consumer);

		String productId = req.getParameter("productId");
		Product product = new Product();

		product.setId(productId);
		review.setProduct(product);

		if (!pService.registerProduct(product)) {
			return "true";
		} else {
			return "false";
		}

	}

	@RequestMapping(value = "/review/remove", produces = "text/plain")
	public @ResponseBody String removeReviewById(@RequestParam("productId") String id, HttpServletRequest req) {
		// Ajax 리뷰 삭제후 화면유지
		if (!pService.removeReviewById(id)) {
			return "true";
		} else {
			return "false";
		}
	}

	// ***********************************************************************************
	// Product start

	// main start
	@RequestMapping(value = "/main/category/hit", produces = "text/plain")
	public @ResponseBody Products findProductsByCategoryOrderByHitsForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		List<Product> hitProducts = pService.findProductsByCategoryOrderByHitsForMain(category, page);

		Products products = new Products();
		products.setProducts(hitProducts);

		return products;

	}

	@RequestMapping(value = "/main/category/id", produces = "text/plain")
	public @ResponseBody Products findProductsByCategoryOrderByIdForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		List<Product> idProducts = pService.findProductsByCategoryOrderByIdForMain(category, page);

		Products products = new Products();
		products.setProducts(idProducts);

		return products;
	}

	// main end

	@RequestMapping(value = "/ajax/product/productid", produces = "text/plain")
	public @ResponseBody Product findProductById(String productId) {
		// Ajax 생산품 id 검색으로 생산품 출력
		Product product = pService.findProductById(productId);

		return product;
	}

	@RequestMapping(value = "/ajax/products/makerid", produces = "text/plain")
	public @ResponseBody Products findMyProducts(String page, HttpServletRequest req) {
		// Ajax 나의 생산품들 전체 출력
		String makerId = (String) req.getSession().getAttribute("loginId");

		List<Product> myProducts = pService.findProductsByMakerId(makerId, page);

		Products products = new Products();
		products.setProducts(myProducts);

		return products;
	}
	// test : http://localhost:8080/ordermade/ajax/products/category.do
	@RequestMapping(value = "/ajax/products/category", produces = "text/plain")
	public @ResponseBody Products findProductsByCategory(String page, String category) {
		// Ajax 한 종류 생산품검색으로 생산품들 출력
		List<Product> categoryProducts = pService.findProductsByCategory(category, page);

		Products products = new Products();
		products.setProducts(categoryProducts);

		return products;
	}

	@RequestMapping(value = "/ajax/products/image", produces = "text/plain")
	public @ResponseBody Products findProductsByImage(String image) {
		// Ajax 생산품 그리고 이미지로 생산품들 출력
		List<Product> imageProducts = pService.findProductsByImage(image);

		Products products = new Products();
		products.setProducts(imageProducts);

		return products;
	}

	@RequestMapping(value = "/ajax/products/CT", produces = "text/plain")
	public @ResponseBody Products findProductsByCategoryAndTitle(String page, String category, String title) {
		// Ajax 생산품 종류와 내용 검색으로 생산품들 출력
		List<Product> TCProducts = pService.findProductsByCategoryAndTitle(category, title, page);

		Products products = new Products();
		products.setProducts(TCProducts);

		return products;
	}

	@RequestMapping(value = "/ajax/products/CM", produces = "text/plain")
	public @ResponseBody Products findProductsByCategoryAndMakerName(String page, String category, String makerName) {
		// Ajax 생산자 이름 그리고 생산품 종류로 생산품들 출력
		List<Product> MCProducts = pService.findProductsByCategoryAndMakerName(category, makerName, page);

		Products products = new Products();
		products.setProducts(MCProducts);

		return products;
	}

	@RequestMapping(value = "/ajax/products/MT", produces = "text/plain")
	public @ResponseBody Products findProductsByMakerIdAndTitle(String page, String title, String makerId) {
		// Ajax 생산자 아이디 그리고 내용으로 생산품들 출력
		List<Product> MTProducts = pService.findProductsByMakerIdAndTitle(makerId, title, page);

		Products products = new Products();
		products.setProducts(MTProducts);

		return products;
	}

	// Product end

	// Review start

	@RequestMapping(value = "/ajax/reviews/productid", produces = "text/plain")
	public @ResponseBody Reviews findReviewsByProductId(String page, String productId) {
		// Ajax 생산품 아이디로 리뷰들 출력
		List<Review> review = pService.findReviewsByProductId(productId, page);

		Reviews reviews = new Reviews();
		reviews.setReviews(review);

		return reviews;
	}

	@RequestMapping(value = "/ajax/reviews/TP", produces = "text/plain")
	public @ResponseBody Reviews findReviewsByTitleAndProductId(String page, String productId, String title) {
		// Ajax 생산품 아이디 그리고 내용으로 리뷰들 출력
		List<Review> TPreview = pService.findReviewsByTitleAndProductId(title, productId, page);

		Reviews reviews = new Reviews();
		reviews.setReviews(TPreview);

		return reviews;
	}

	@RequestMapping(value = "/ajax/reviews/CP", produces = "text/plain")
	public Reviews findReviewsByConsumerIdAndProductId(String page, String productId, String consumerId) {
		// Ajax 생산품 아이디 그리고 내용으로 리뷰들 출력
		List<Review> CPreview = pService.findReviewsByConsumerIdAndProductId(consumerId, productId, page);

		Reviews reviews = new Reviews();
		reviews.setReviews(CPreview);

		return reviews;
	}

	// Review end
	// ************************
	// ui start

	@RequestMapping("/register.do")
	public String showRegisterProductUI(Model model) {
		// 상품 등록 페이지 productRegister.jsp로 이동
		List<Category> categorys = pService.findAllCategory();
		model.addAttribute("categorys", categorys);

		return "product/productRegister";
	}

	@RequestMapping("/modify.do")
	public ModelAndView showEditProductUI(String id) {
		// 상품 수정 페이지로 이동

		Product product = pService.findProductById(id);
		ModelAndView mv = new ModelAndView("");
		mv.addObject("product", product);

		return mv;
	}

	@RequestMapping("/myProducts.do")
	public ModelAndView showMyProductListUI(String page, HttpServletRequest req) {
		// GET 나의 생산품들 출력

		String makerId = (String) req.getSession().getAttribute("loginId");

		List<Product> products = pService.findProductsByMakerId(makerId, page);

		ModelAndView mv = new ModelAndView("product/myProductList");
		mv.addObject("products", products);

		return mv;
	}

	@RequestMapping("/detailProduct.do")
	public ModelAndView showDetailProductUI(String id) {
		// GET 상품 상세정보 출력후 상품 상세 페이지로 이동

		Product product = pService.findProductById(id);

		ModelAndView mv = new ModelAndView("");
		mv.addObject("product", product);

		return mv;
	}

	// @RequestMapping("/searchProduct")
	// public ModelAndView showSearchProductsUI() {
	// // GET
	// List<Category> categorys = pService.findAllCategory();
	// }
	// ui end
}
