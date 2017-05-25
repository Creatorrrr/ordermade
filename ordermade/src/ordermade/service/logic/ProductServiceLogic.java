package ordermade.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.constants.Constants;
import ordermade.domain.Category;
import ordermade.domain.Product;
import ordermade.domain.Review;
import ordermade.service.facade.ProductService;
import ordermade.store.facade.CategoryStore;
import ordermade.store.facade.ProductStore;
import ordermade.store.facade.ReviewStore;

@Service
public class ProductServiceLogic implements ProductService{
	
	@Autowired
	private ProductStore pStore;
	@Autowired
	private ReviewStore rStore;
	@Autowired
	private CategoryStore cStore;

	@Override
	public boolean registerProduct(Product product) {
		return pStore.insertProduct(product);
	}

	@Override
	public boolean modifyProductById(Product product) {
		return pStore.updateProductById(product);
	}

	@Override
	public boolean removeProductById(String id) {
		return pStore.deleteProductById(id);
	}

	@Override
	public Product findProductById(String id) {
		return pStore.selectProductById(id);
	}

	@Override
	public List<Product> findProductsByCategoryOrderByHitsForMain(String category, String page) {
		return pStore.selectProductsByCategoryOrderByHitsForMain(category, page);
	}

	@Override
	public List<Product> findProductsByCategoryOrderByIdForMain(String category, String page) {
		return pStore.selectProductsByCategoryOrderByIdForMain(category, page);
	}

	@Override
	public List<Product> findProductsByCategoryAndImage(String category, String image, String page) {
		
		
		return null;
	}

	@Override
	public List<Product> findProductsByCategoryAndTitle(String category, String title, String page) {
		return pStore.selectProductsByCategoryAndTitle(category, title, getProductBegin(page), getProductEnd(page));
	}

	@Override
	public List<Product> findProductsByCategoryAndMakerName(String category, String makerName, String page) {
		return pStore.selectProductsByCategoryAndMakerName(category, makerName, getProductBegin(page), getProductEnd(page));
	}

	@Override
	public List<Product> findProductsByMakerId(String makerId, String page) {
		return pStore.selectProductsByMakerId(makerId, getProductBegin(page), getProductEnd(page));
	}

	@Override
	public List<Product> findProductsByMakerIdAndTitle(String makerId, String title, String page) {
		return pStore.selectProductsByMakerIdAndTitle(makerId, title, getProductBegin(page), getProductEnd(page));
	}

	@Override
	public List<Product> findProductsByCategory(String category, String page) {
		return pStore.selectProductsByCategory(category, getProductBegin(page), getProductEnd(page));
	}

	@Override
	public boolean registerReview(Review review) {
		return rStore.insertReview(review);
	}

	@Override
	public boolean modifyReviewById(Review review) {
		return rStore.updateReviewById(review);
	}

	@Override
	public boolean removeReviewById(String id) {
		return rStore.deleteReviewById(id);
	}

	@Override
	public List<Review> findReviewsByProductId(String productId, String page) {
		return rStore.selectReviewsByProductId(productId, getReviewBegin(page), getReviewEnd(page));
	}

	@Override
	public List<Review> findReviewsByTitleAndProductId(String title, String productId, String page) {
		return rStore.selectReviewsByTitleAndProductId(title, productId, getReviewBegin(page), getReviewEnd(page));
	}

	@Override
	public List<Review> findReviewsByConsumerIdAndProductId(String consumerId, String productId, String page) {
		return rStore.selectReviewsByConsumerIdAndProductId(consumerId, productId, getReviewBegin(page), getReviewEnd(page));
	}

	@Override
	public List<Category> findAllCategory() {
		return cStore.selectAllCategory();
	}
	
	private String getProductBegin(String page) {
		return (Integer.parseInt(page) - 1) * Constants.PRODUCT_ROW_SIZE + 1 + "";
	}
	
	private String getProductEnd(String page) {
		return Integer.parseInt(page) * Constants.PRODUCT_ROW_SIZE + "";
	}

	private String getReviewBegin(String page) {
		return (Integer.parseInt(page) - 1) * Constants.REVIEW_ROW_SIZE + 1 + "";
	}
	
	private String getReviewEnd(String page) {
		return Integer.parseInt(page) * Constants.REVIEW_ROW_SIZE + "";
	}
}
