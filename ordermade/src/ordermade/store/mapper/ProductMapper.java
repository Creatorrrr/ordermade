package ordermade.store.mapper;

import java.util.HashMap;
import java.util.List;

import ordermade.domain.Category;
import ordermade.domain.Portfolio;
import ordermade.domain.Product;
import ordermade.domain.Tag;

public interface ProductMapper {
	public boolean insertProduct(Product product);
	public boolean updateProductById(Product product);
	public boolean deleteProductById(String id);
	public Product selectProductById(String id);
	public List<Product> selectProductsByCategoryOrderByHitsForMain(HashMap<String, String> map);
	public List<Product> selectProductsByCategoryOrderByIdForMain(HashMap<String, String> map);
	public List<Product> selectProductsByCategory(HashMap<String, String> map);
	public int selectRowsProductsByCategory(String category);
	public List<Product> selectProductsByCategoryAndTitle(HashMap<String, String> map);
	public List<Product> selectProductsByCategoryAndMakerName(HashMap<String, String> map);
	public List<Product> selectProductsByCategoryAndMakerId(HashMap<String, String> map);
	public List<Product> selectProductsByCategoryAndMakerIdForImage(List<Portfolio> portfolios);
	public List<Product> selectProductsByMakerId(HashMap<String, String> map);
	public int selectRowsByMakerId(String makerId);
	public List<Product> selectProductsByMakerIdAndTitle(HashMap<String, String> map);
	public List<Product> selectProductsByTitle(HashMap<String, String> map);
	public List<Product> selectProductsByMakerName(HashMap<String, String> map);
	public List<Product> selectProductsByTags(List<Tag> tags);
	public List<Category> selectAllCategory();
}
