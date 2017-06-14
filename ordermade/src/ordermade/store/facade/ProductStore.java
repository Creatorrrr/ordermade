package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Category;
import ordermade.domain.Portfolio;
import ordermade.domain.Product;
import ordermade.domain.Tag;

public interface ProductStore {
	public boolean insertProduct(Product product);
	public boolean updateProductById(Product product);
	public boolean deleteProductById(String id);
	public Product selectProductById(String id);
	public List<Product> selectProductsByCategoryOrderByHitsForMain(String category, String page);
	public List<Product> selectProductsByCategoryOrderByIdForMain(String category, String page);
	public List<Product> selectProductsByCategory(String category, String begin, String end);
	public List<Product> selectProductsByCategoryAndTitle(String category, String title, String begin, String end);
	public List<Product> selectProductsByCategoryAndMakerName(String category, String makerName, String begin, String end);
	public List<Product> selectProductsByCategoryAndMakerId(String category, String makerId, String begin, String end);
	public List<Product> selectProductsByCategoryAndMakerIdForImage(List<Portfolio> portfolios);
	public List<Product> selectProductsByMakerId(String makerId, String begin, String end);
	public List<Product> selectProductsByMakerIdAndTitle(String makerId, String title, String begin, String end);
	public List<Product> selectProductsByTitle(String title, String begin, String end);
	public List<Product> selectProductsByMakerName(String makerName, String begin, String end);
	public List<Product> selectProductsByTags(List<Tag> tags);
	public List<Category> selectAllCategory();
}
