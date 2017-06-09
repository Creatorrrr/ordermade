package ordermade.service.facade;

import java.util.List;

import ordermade.domain.Category;
import ordermade.domain.Product;
import ordermade.domain.Review;

public interface ProductService {
	public boolean registerProduct(Product product);

	public boolean modifyProductById(Product product);

	public boolean removeProductById(String id);

	public Product findProductById(String id);

	public List<Product> findProductsByCategoryOrderByHitsForMain(String category, String page);

	public List<Product> findProductsByCategoryOrderByIdForMain(String category, String page);

	public List<Product> findProductsByImage(String image);

	public List<Product> findProductsByCategoryAndTitle(String category, String title, String page);

	public List<Product> findProductsByCategoryAndMakerName(String category, String makerName, String page);

	public List<Product> findProductsByMakerId(String makerId, String page);

	public List<Product> findProductsByMakerIdAndTitle(String makerId, String title, String page);

	public List<Product> findProductsByCategory(String category, String page);

	public List<Product> findProductsByTitle(String title, String page);

	public boolean registerReview(Review review);

	public boolean modifyReviewById(Review review);

	public boolean removeReviewById(String id);

	public List<Review> findReviewsByProductId(String productId, String page);

	public List<Review> findReviewsByTitleAndProductId(String title, String productId, String page);

	public List<Review> findReviewsByConsumerIdAndProductId(String consumerId, String productId, String page);

	public List<Category> findAllCategory();
}
