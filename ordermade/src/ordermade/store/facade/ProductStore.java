package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Category;
import ordermade.domain.Product;

public interface ProductStore {
	public boolean insertProduct(Product product);
	public boolean updateProductById(Product product);
	public boolean deleteProductById(String id);
	public Product selectProductById(String id);
	public List<Product> selectProductsByCategoryOrderByHitsForMain(String hits, String page);
	public List<Product> selectProductsByCategoryOrderByIdForMain(String hits, String page);
	public List<Product> selectProductsByCategory(String category, String page);
	public List<Product> selectProductsByCategoryAndImage(String category, String image, String page);
	public List<Product> selectProductsByCategoryAndTitle(String category, String title, String page);
	public List<Product> selectProductsByCategoryAndMakerName(String category, String makerName, String page);
	public List<Product> selectProductsByCategoryAndMakerId(String category, String makerId, String page);
	public List<Product> selectProductsByMakerId(String makerId, String page);
	public List<Product> selectProductsByMakerIdAndTitle(String makerId, String title, String page);
	public List<Category> selectAllCategory();
}
