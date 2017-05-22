package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import ordermade.domain.Category;
import ordermade.domain.Product;
import ordermade.store.facade.ProductStore;

public class ProductStoreLogic implements ProductStore {
	private SqlSessionFactory factory;

	@Override
	public boolean insertProduct(Product product) {
		return false;
	}

	@Override
	public boolean updateProductById(Product product) {
		return false;
	}

	@Override
	public boolean deleteProductById(String id) {
		return false;
	}

	@Override
	public Product selectProductById(String id) {
		return null;
	}

	@Override
	public List<Product> selectProductsByCategoryOrderByHitsForMain(String hits, String page) {
		return null;
	}

	@Override
	public List<Product> selectProductsByCategoryOrderByIdForMain(String hits, String page) {
		return null;
	}

	@Override
	public List<Product> selectProductsByCategory(String category, String page) {
		return null;
	}

	@Override
	public List<Product> selectProductsByCategoryAndImage(String category, String image, String page) {
		return null;
	}

	@Override
	public List<Product> selectProductsByCategoryAndTitle(String category, String title, String page) {
		return null;
	}

	@Override
	public List<Product> selectProductsByCategoryAndMakerName(String category, String makerName, String page) {
		return null;
	}

	@Override
	public List<Product> selectProductsByCategoryAndMakerId(String category, String makerId, String page) {
		return null;
	}

	@Override
	public List<Product> selectProductsByMakerId(String makerId, String page) {
		return null;
	}

	@Override
	public List<Product> selectProductsByMakerIdAndTitle(String makerId, String title, String page) {
		return null;
	}

	@Override
	public List<Category> selectAllCategory() {
		return null;
	}
	
	
}
