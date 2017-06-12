package ordermade.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

	@RequestMapping(value = "xml/remove.do", produces = "text/plain")
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

	@RequestMapping(value = "/review/remove.do", produces = "text/plain")
	public @ResponseBody String removeReviewById(String id, HttpSession session) {
		// Ajax 리뷰 삭제후 화면유지
		if(checkLogined(session)) return "member/login";	// check logined
		return pService.removeReviewById(id) + "";
	}

	// ***********************************************************************************
	// Product start

	// main start
	@RequestMapping(value = "xml/main/category/hit.do", produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryOrderByHitsForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		if (page == null || page.isEmpty()) page = "1";
		return new Products(pService.findProductsByCategoryOrderByHitsForMain(category, page));
	}

	@RequestMapping(value = "xml/main/category/brandNew.do", produces = "application/xml")
	public @ResponseBody Products findProductsByCategoryOrderByIdForMain(String category, String page) {
		// Ajax 메인화면에서 히트 상품 종류 나옴
		if (page == null || page.isEmpty()) page = "1";
		return new Products(pService.findProductsByCategoryOrderByIdForMain(category, page));
	}

	// main end

	@RequestMapping(value = "ajax/product/productId.do")
	public @ResponseBody Product findProductById(String productId) {
		// Ajax 생산품 id 검색으로 생산품 출력
		return pService.findProductById(productId);
	}

	@RequestMapping(value = "/ajax/products/makerid.do", produces = "application/xml")
	public @ResponseBody Products findMyProducts(String page, HttpSession session) {
		// Ajax 나의 생산품들 전체 출력
		if (page == null || page.isEmpty()) page = "1";
		return new Products(pService.findProductsByMakerId(
				(String)session.getAttribute("loginId"), 
				page));
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
	
	@RequestMapping(value = "/ajax/products/title.do", produces = "application/xml")
	public @ResponseBody Products findProductsByTitle(String page, String title) {
		// Ajax 생산자 아이디 그리고 내용으로 생산품들 출력
		return new Products(pService.findProductsByTitle(title, page));
	}
	
	@RequestMapping(value = "/ajax/products/makerName.do", produces = "application/xml")
	public @ResponseBody Products findProductsByMakerName(String page, String makerName) {
		// Ajax 생산자 아이디 그리고 내용으로 생산품들 출력
		return new Products(pService.findProductsByMakerName(makerName, page));
	}

	@RequestMapping(value = "/ajax/products/MT.do", produces = "application/xml")
	public @ResponseBody Products findProductsByMakerIdAndTitle(String page, String title, HttpSession session) {
		// Ajax 생산자 아이디 그리고 내용으로 생산품들 출력
		return new Products(pService.findProductsByMakerIdAndTitle(
				(String)session.getAttribute("loginId"), 
				title, 
				page));
	}

	// Product end

	// Review start

	@RequestMapping(value = "/ajax/reviews/productid.do", produces = "application/xml")
	public @ResponseBody Reviews findReviewsByProductId(String page, String productId) {
		// Ajax 생산품 아이디로 리뷰들 출력
		return new Reviews(pService.findReviewsByProductId(productId, page));
	}

	@RequestMapping(value = "/ajax/reviews/TP.do")
	public @ResponseBody Reviews findReviewsByTitleAndProductId(String page, String productId, String title) {
		// Ajax 생산품 아이디 그리고 내용으로 리뷰들 출력
		if(page == null || page.isEmpty()) page = "1";
		return new Reviews(pService.findReviewsByTitleAndProductId(title, productId, page));
	}

	@RequestMapping(value = "/ajax/reviews/CP.do")
	public @ResponseBody Reviews findReviewsByConsumerIdAndProductId(String page, String productId, String consumerId) {
		// Ajax 생산품 아이디 그리고 내용으로 리뷰들 출력
		if(page == null || page.isEmpty()) page = "1";
		return new Reviews(pService.findReviewsByConsumerIdAndProductId(consumerId, productId, page));
	}

	// Review end
	// ************************
	// ui start

	@RequestMapping("ui/register.do")
	public String showRegisterProductUI(HttpSession session) {
		// 상품 등록 페이지 productRegister.jsp로 이동
		if(checkLogined(session)) return "member/login";	// check logined
		return "product/register";
	}

	@RequestMapping("ui/modify.do")
	public ModelAndView showEditProductUI(String id, HttpSession session) {
		// 상품 수정 페이지로 이동
		if(checkLogined(session)) return new ModelAndView("member/login");	// check logined
		return new ModelAndView("product/modify")
				.addObject("product", pService.findProductById(id));
	}

	@RequestMapping("ui/myProducts.do")
	public ModelAndView showMyProductListUI(String page, HttpSession session) {
		// GET 나의 생산품들 출력
		if(checkLogined(session)) return new ModelAndView("member/login");	// check logined
		if(page == null || page.isEmpty()) page = "1";
		return new ModelAndView("product/myProductList")
				.addObject("products", pService.findProductsByMakerId(
						(String)session.getAttribute("loginId"), 
						page));
	}

	@RequestMapping("ui/detail.do")
	public ModelAndView showDetailProductUI(String id) {
		// GET 상품 상세정보 출력후 상품 상세 페이지로 이동
		return new ModelAndView("product/detail")
				.addObject("product", pService.findProductById(id));
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
		if (category == null || category.isEmpty()) category = Constants.CategoryType.values()[0] + "";
		if (page == null || page.isEmpty()) page = "1";
		return new ModelAndView("product/search")
				.addObject("categories", pService.findAllCategory())
				.addObject("category", category)
				.addObject("products", pService.findProductsByCategory(category, page));
	}
	
	@RequestMapping("ui/searchMain.do")
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
