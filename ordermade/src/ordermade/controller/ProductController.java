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
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService pService;
	@Autowired
	private MemberService mService;

	@RequestMapping(value = "xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerProduct(Model model, Product product, HttpServletRequest req) {
		// 상품 등록후 상세 상품페이지로 이동
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
			product.setImage(image.getName());
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

		check = pService.registerProduct(product);
		return check + "";
		/*
		 * if (!pService.registerProduct(product)) { System.out.println("거짓");
		 * return "product/productRegister"; } else { System.out.println("참");
		 * model.addAttribute("product", product); return
		 * "product/productDetail"; }
		 */

	}

	@RequestMapping(value = "xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyProductById(Product product, HttpServletRequest req) {
		// 상품 수정 후 상세 상품페이지로 이동
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
			String title = mr.getParameter("productTitle");
			String category = mr.getParameter("category");
			String content = mr.getParameter("productContent");

			File image = mr.getFile("image");

			int price = Integer.parseInt(mr.getParameter("price"));
			int period = Integer.parseInt(mr.getParameter("period"));
			int hit = Integer.parseInt(mr.getParameter("hit"));
			Member maker = mService.findMemberById((String) req.getSession().getAttribute("loginId"));

			product.setId(id);
			product.setTitle(title);
			product.setCategory(category);
			product.setContent(content);

			product.setImage(image.getName());

			product.setPrice(price);
			product.setPeriod(period);

			product.setMaker(maker);

			product.setHit(hit);
		} catch (IOException e) {
			e.printStackTrace();
		}

		boolean check = pService.modifyProductById(product);
		return check + "";
		/*
		 * if (!pService.registerProduct(product)) { return ""; } else { return
		 * "detailProduct"; }
		 */
	}

	@RequestMapping(value = "xml/remove.do", produces = "text/plain")
	public @ResponseBody String removeProductById(String id, HttpServletRequest req) {
		// 상품페이지 삭제후 상품페이지 목록으로 이동

		boolean check = pService.removeProductById(id);
		return check + "";
		/*
		 * if (!pService.removeProductById(id)) { return "/product/detail"; }
		 * else { return "/product/productList"; }
		 */
	}

	@RequestMapping(value = "/review/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerReview(Review review, HttpServletRequest req) {
		// Ajax 리뷰 등록후 화면유지
		System.out.println(review.getTitle() + "*************");
		System.out.println(review.getGrade() + "*************");
		System.out.println(review.getContent() + "*************");
		System.out.println(review.getProduct().getId());

		Member consumer = mService.findMemberById((String) req.getSession().getAttribute("loginId"));
		review.setConsumer(consumer);
		if (!pService.registerReview(review)) {
			return "false";
		} else {
			return "true";
		}
	}

	@RequestMapping(value = "/review/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyReviewById(Review review, HttpServletRequest req) {
		// Ajax 리뷰 수정후 화면유지
		System.out.println(review.getId() + "*************");
		System.out.println(review.getTitle() + "*************");
		System.out.println(review.getGrade() + "*************");
		System.out.println(review.getContent() + "*************");
		System.out.println(review.getProduct().getId());

			Member consumer = mService.findMemberById((String) req.getSession().getAttribute("loginId"));
			review.setConsumer(consumer);
			if (!pService.modifyReviewById(review)) {
				return "false";
			} else {
				return "true";
			}

	}

	@RequestMapping(value = "/review/remove.do", produces = "text/plain")
	public @ResponseBody String removeReviewById(String id, HttpServletRequest req) {
		// Ajax 리뷰 삭제후 화면유지
		if (!pService.removeReviewById(id)) {
			return "false";
		} else {
			return "true";
		}
	}

	// ***********************************************************************************
	// Product start

	// main start
	@RequestMapping(value = "xml/main/category/hit.do", produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryOrderByHitsForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		List<Product> hitProducts = pService.findProductsByCategoryOrderByHitsForMain(category, page);
		Products products = new Products();
		products.setProducts(hitProducts);

		return products;

	}

	@RequestMapping(value = "xml/main/category/brandNew.do", produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryOrderByIdForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		if (page == null || page == "")
			page = "1";
		List<Product> idProducts = pService.findProductsByCategoryOrderByIdForMain(category, page);

		Products products = new Products();
		products.setProducts(idProducts);

		return products;
	}

	// main end

	@RequestMapping(value = "ajax/product/productId.do")
	public @ResponseBody Product findProductById(String productId) {
		// Ajax 생산품 id 검색으로 생산품 출력
		Product product = pService.findProductById("1");
		return product;
	}

	@RequestMapping(value = "/ajax/products/makerid.do")
	public @ResponseBody Products findMyProducts(String page, HttpServletRequest req) {
		// Ajax 나의 생산품들 전체 출력

		String makerId = (String) req.getSession().getAttribute("loginId");
		if (page == null || page == "")
			page = "1";

		List<Product> myProducts = pService.findProductsByMakerId(makerId, "1");

		Products products = new Products();
		products.setProducts(myProducts);

		return products;
	}

	// test : http://localhost:8080/ordermade/ajax/products/category.do
	@RequestMapping(value = "ajax/products/category.do", produces = "application/xml")
	public @ResponseBody Products findProductsByCategory(String page, String category) {
		// Ajax 한 종류 생산품검색으로 생산품들 출력
		return new Products(pService.findProductsByCategory(category, page));
	}

	@RequestMapping(value = "ajax/products/image.do", produces = "application/xml")
	public @ResponseBody Products findProductsByImage(String image) {
		// Ajax 생산품 그리고 이미지로 생산품들 출력
		return new Products(pService.findProductsByImage(image));
	}

	@RequestMapping(value = "ajax/products/CT.do", produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryAndTitle(String page, String category, String title) {
		// Ajax 생산품 종류와 내용 검색으로 생산품들 출력
		return new Products(pService.findProductsByCategoryAndTitle(category, title, page));
	}

	@RequestMapping(value = "ajax/products/CM.do", produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryAndMakerName(String page, String category, String makerName) {
		// Ajax 생산자 이름 그리고 생산품 종류로 생산품들 출력
		return new Products(pService.findProductsByCategoryAndMakerName(category, makerName, page));
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

	@RequestMapping(value = "/ajax/reviews/TP.do")
	public @ResponseBody Reviews findReviewsByTitleAndProductId(String page, String productId, String title) {
		// Ajax 생산품 아이디 그리고 내용으로 리뷰들 출력
		System.out.println(productId);
		System.out.println(title);
		List<Review> TPreview = pService.findReviewsByTitleAndProductId(title, productId, "1");

		Reviews reviews = new Reviews();
		reviews.setReviews(TPreview);

		return reviews;
	}

	@RequestMapping(value = "/ajax/reviews/CP.do")
	public @ResponseBody Reviews findReviewsByConsumerIdAndProductId(String page, String productId, String consumerId,
			HttpServletRequest req) {
		// Ajax 생산품 아이디 그리고 내용으로 리뷰들 출력

		if (consumerId == null) {
			String id = (String) req.getSession().getAttribute("loginId");
			List<Review> CPreview = pService.findReviewsByConsumerIdAndProductId(id, productId, "1");

			Reviews reviews = new Reviews();
			reviews.setReviews(CPreview);

			return reviews;
		} else {
			List<Review> CPreview = pService.findReviewsByConsumerIdAndProductId(consumerId, productId, "1");

			Reviews reviews = new Reviews();
			reviews.setReviews(CPreview);

			return reviews;
		}
	}

	// Review end
	// ************************
	// ui start

	@RequestMapping("ui/register.do")
	public String showRegisterProductUI(Model model) {
		// 상품 등록 페이지 productRegister.jsp로 이동
		List<Category> categorys = pService.findAllCategory();
		model.addAttribute("categorys", categorys);

		return "product/register";
	}

	@RequestMapping("ui/modify.do")
	public ModelAndView showEditProductUI(String id) {
		// 상품 수정 페이지로 이동

		Product product = pService.findProductById(id);
		ModelAndView mv = new ModelAndView("product/modify");
		mv.addObject("product", product);

		return mv;
	}

	@RequestMapping("ui/myProducts.do")
	public ModelAndView showMyProductListUI(String page, HttpServletRequest req) {
		// GET 나의 생산품들 출력
		String makerId = (String) req.getSession().getAttribute("loginId");
		List<Product> products = pService.findProductsByMakerId(makerId, "1");

		ModelAndView mv = new ModelAndView("product/myProductList");
		mv.addObject("products", products);

		return mv;
	}

	@RequestMapping("ui/detail.do")
	public ModelAndView showDetailProductUI(String id) {
		// GET 상품 상세정보 출력후 상품 상세 페이지로 이동
		Product product = pService.findProductById(id);
		ModelAndView mv = new ModelAndView("product/detail");
		mv.addObject("product", product);

		return mv;
	}

	@RequestMapping("image.do")
	public void getProductImage(String img, HttpServletResponse resp) {
		File image = new File(Constants.IMAGE_PATH + img);
		if (!image.exists()) {
			throw new RuntimeException("No product image");
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

	@RequestMapping(value = "imageUpload.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String uploadProductImage(HttpServletRequest req) {
		String imagePath = Constants.IMAGE_PATH;

		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		try {
			return new MultipartRequest(req, imagePath, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy())
					.getFile("image").getName();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "fail";
	}

	@RequestMapping("ui/search.do")
	public ModelAndView showSearchProductsUI(String category, String page) {
		if (category == null)
			category = Constants.CategoryType.values()[0] + "";
		if (page == null)
			page = "1";
		return new ModelAndView("product/search").addObject("categories", pService.findAllCategory())
				.addObject("category", category).addObject("products", pService.findProductsByCategory(category, page));
	}
}
