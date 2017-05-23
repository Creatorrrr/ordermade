package ordermade.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ordermade.domain.Category;
import ordermade.domain.Product;
import ordermade.store.facade.ProductStore;
import ordermade.store.mapper.ProductMapper;

public class ProductStoreLogic implements ProductStore {
	private SqlSessionFactory factory;
	
	public ProductStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public boolean insertProduct(Product product) {
		SqlSession session = factory.openSession();
		boolean check = false;
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			check = mapper.insertProduct(product);
			if(check){
				session.commit();
			}else{
				session.rollback();
			}
		}finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean updateProductById(Product product) {
		SqlSession session = factory.openSession();
		boolean check = false;
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			check = mapper.updateProductById(product);
			if(check){
				session.commit();
			}else{
				session.rollback();
			}
		}finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean deleteProductById(String id) {
		SqlSession session = factory.openSession();
		boolean check = false;
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			check = mapper.deleteProductById(id);
			if(check){
				session.commit();
			}else{
				session.rollback();
			}
		}finally {
			session.close();
		}
		return check;
	}

	@Override
	public Product selectProductById(String id) {
		SqlSession session = factory.openSession();
		Product product = null;
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			product = mapper.selectProductById(id);
		}finally {
			session.close();
		}
		return product;
	}

	@Override
	public List<Product> selectProductsByCategoryOrderByHitsForMain(String category, String page) {
		SqlSession session = factory.openSession();
		List<Product> productList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("page", page);
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			productList = mapper.selectProductsByCategoryOrderByHitsForMain(map);
		}finally {
			session.close();
		}
		return productList;
	}

	@Override
	public List<Product> selectProductsByCategoryOrderByIdForMain(String category, String page) {
		SqlSession session = factory.openSession();
		List<Product> productList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("page", page);
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			productList = mapper.selectProductsByCategoryOrderByIdForMain(map);
		}finally {
			session.close();
		}
		return productList;
	}

	@Override
	public List<Product> selectProductsByCategory(String category, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Product> productList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			productList = mapper.selectProductsByCategory(map);
		}finally {
			session.close();
		}
		return productList;
	}

	@Override
	public List<Product> selectProductsByCategoryAndTitle(String category, String title, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Product> productList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("title", title);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			productList = mapper.selectProductsByCategoryAndTitle(map);
		}finally {
			session.close();
		}
		return productList;
	}

	@Override
	public List<Product> selectProductsByCategoryAndMakerName(String category, String makerName, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Product> productList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("makerName", makerName);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			productList = mapper.selectProductsByCategoryAndMakerName(map);
		}finally {
			session.close();
		}
		return productList;
	}

	@Override
	public List<Product> selectProductsByCategoryAndMakerId(String category, String makerId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Product> productList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("makerId", makerId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			productList = mapper.selectProductsByCategoryAndMakerId(map);
		}finally {
			session.close();
		}
		return productList;
	}

	@Override
	public List<Product> selectProductsByMakerId(String makerId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Product> productList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("makerId", makerId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			productList = mapper.selectProductsByMakerId(map);
		}finally {
			session.close();
		}
		return productList;
	}

	@Override
	public List<Product> selectProductsByMakerIdAndTitle(String makerId, String title, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Product> productList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("makerId", makerId);
		map.put("title", title);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			productList = mapper.selectProductsByMakerIdAndTitle(map);
		}finally {
			session.close();
		}
		return productList;
	}

	@Override
	public List<Category> selectAllCategory() {
		SqlSession session = factory.openSession();
		List<Category> categoryList = null;
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			categoryList = mapper.selectAllCategory();
		}finally {
			session.close();
		}
		return categoryList;
	}
	
	
}
