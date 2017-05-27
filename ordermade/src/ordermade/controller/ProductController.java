package ordermade.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ordermade.constants.Constants;
import ordermade.domain.Member;
import ordermade.domain.Product;
import ordermade.domain.Products;
import ordermade.domain.Review;
import ordermade.service.facade.MemberService;
import ordermade.service.facade.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService Pservice;
	@Autowired
	private MemberService Mservice;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerProduct(Product product, HttpServletRequest req) {
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

			String title = mr.getParameter("title");
			String category = mr.getParameter("category");
			String content = mr.getParameter("content");

			File image = mr.getFile("image");

			int price = Integer.parseInt(mr.getParameter("price"));
			int period = Integer.parseInt(mr.getParameter("period"));

			Member maker = Mservice.findMemberById((String) req.getSession().getAttribute("loginId"));

			product.setTitle(title);
			product.setCategory(category);
			product.setContent(content);

			product.setImage(image.getCanonicalPath());

			product.setPrice(price);
			product.setPeriod(period);

			product.setMaker(maker);

			product.setHit(0);
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (!Pservice.registerProduct(product)) {
			return "";
		} else {
			return "detailProduct";
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
			Member maker = Mservice.findMemberById((String) req.getSession().getAttribute("loginId"));

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

		if (!Pservice.registerProduct(product)) {
			return "";
		} else {
			return "detailProduct";
		}
	}

	@RequestMapping("/remove")
	public String removeProductById(@RequestParam("productId") String id, HttpServletRequest req) {
		// 상품페이지 삭제후 상품페이지 목록으로 이동
		if (!Pservice.removeProductById(id)) {
			return "";
		} else {
			return "";
		}
	}

	@RequestMapping(value = "/review/register", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerReview(Review review, HttpServletRequest req) {
		// Ajax 리뷰 등록후 화면유지
		Member consumer = Mservice.findMemberById((String) req.getSession().getAttribute("loginId"));
		review.setConsumer(consumer);
		review.setGrade(0);

		String productId = req.getParameter("productId");
		Product product = new Product();

		product.setId(productId);
		review.setProduct(product);

		if (!Pservice.registerProduct(product)) {
			return "true";
		} else {
			return "false";
		}
	}

	@RequestMapping(value = "/review/modify", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyReviewById(Review review, HttpServletRequest req) {
		// Ajax 리뷰 수정후 화면유지
		Member consumer = Mservice.findMemberById((String) req.getSession().getAttribute("loginId"));
		review.setConsumer(consumer);

		String productId = req.getParameter("productId");
		Product product = new Product();

		product.setId(productId);
		review.setProduct(product);

		if (!Pservice.registerProduct(product)) {
			return "true";
		} else {
			return "false";
		}

	}

	@RequestMapping(value = "/review/remove", produces = "text/plain")
	public @ResponseBody String removeReviewById(@RequestParam("productId") String id, HttpServletRequest req) {
		// Ajax 리뷰 삭제후 화면유지
		if (!Pservice.removeReviewById(id)) {
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
		List<Product> hitProducts = Pservice.findProductsByCategoryOrderByHitsForMain(category, page);

		Products products = new Products();
		products.setProducts(hitProducts);

		return products;

	}

	@RequestMapping(value = "/main/category/id", produces = "text/plain")
	public @ResponseBody Products findProductsByCategoryOrderByIdForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		List<Product> idProducts = Pservice.findProductsByCategoryOrderByIdForMain(category, page);

		Products products = new Products();
		products.setProducts(idProducts);

		return products;
	}

	// main end

	@RequestMapping(value = "/ajax/product/id", produces = "text/plain")
	public @ResponseBody Product findProductById(String productId) {
		// Ajax 생산품 id 검색으로 생산품 출력
		Product product = Pservice.findProductById(productId);

		return product;
	}

	@RequestMapping(value = "/ajax/products", produces = "text/plain")
	public @Re Products findMyProducts(String page, HttpServletRequest req) {
		// Ajax 나의 생산품들 전체 출력
		String makerId = (String) req.getSession().getAttribute("loginId");

		List<Product> myProducts = Pservice.findProductsByMakerId(makerId, page);

		Products products = new Products();
		products.setProducts(myProducts);

		return products;
	}
	//
	// public Products findProductsByCategory(String page, String category) {
	//
	// }
	//
	// // main start
	//
	// public Products findProductsByCategoryOrderByHitsForMain(String page,
	// String hits) {
	//
	// }
	//
	// public Products findProductsByCategoryOrderByIdForMain(String page,
	// String hits) {
	//
	// }
	//
	// // main end
	//
	// public Products findProductsByCategoryAndImage(String category, String
	// image, HttpServletRequest req) {
	//
	// }
	//
	// public Products findProductsByCategoryAndTitle(String page, String
	// category, String title) {
	//
	// }
	//
	// public Products findProductsByCategoryAndMakerName(String page, String
	// category, String makerName) {
	//
	// }
	//
	// public Products findProductsByMakerIdAndTitle(String page, String title,
	// String makerId) {
	//
	// }

	// Product end

	// Review start

	// public Reviews findReviewsByProductId(String page, String productId) {
	//
	// }
	//
	// public Reviews findReviewsByTitleAndProductId(String page, String
	// productId, String title) {
	//
	// }
	//
	// public Reviews findReviewsByConsumerIdAndProductId(String page, String
	// productId, String consumerId) {
	//
	// }

	// Review end
	// ************************
	// ui start
	// public String showRegisterUI() {
	//
	// }
	//
	// public ModelAndView showEditProductUI(String id) {
	//
	// }
	//
	// public ModelAndView showMyProductListUI(String page, HttpServletRequest
	// req) {
	//
	// }
	//
	// public ModelAndView showDetailProductUI(String id) {
	//
	// }
	//
	// public ModelAndView showSearchProductUI() {
	//
	// }
	// ui end
}
