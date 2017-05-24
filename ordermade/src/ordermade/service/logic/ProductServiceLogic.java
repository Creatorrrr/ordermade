package ordermade.service.logic;

import java.util.List;

import ordermade.domain.Product;
import ordermade.domain.Review;
import ordermade.service.facade.ProductService;

public class ProductServiceLogic implements ProductService{

	@Override
	public boolean registerProduct(Product product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyProductById(Product product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeProductById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Product findProductById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProductsByCategoryOrderByHitsForMain(String hits, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProductsByCategoryOrderByIdForMain(String id, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProductsByCategoryAndImage(String category, String image, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProductsByCategoryAndTitle(String category, String title, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProductsByCategoryAndMakerName(String category, String makerName, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProductsByMakerId(String makerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProductsByMakerIdAndTitle(String makerId, String title, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProductsByCategory(String category, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean registerReview(Review review) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyReviewById(Review review) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeReviewById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Review> findReviewsByProductId(String productId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findReviewsByTitleAndProductId(String title, String productId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findReviewsByConsumerIdAndProductId(String consumerId, String productId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findAllCategory() {
		// TODO Auto-generated method stub
		return null;
	}

}
