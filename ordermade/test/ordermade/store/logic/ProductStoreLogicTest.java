package ordermade.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Member;
import ordermade.domain.Portfolio;
import ordermade.domain.Product;
import ordermade.store.facade.ProductStore;

public class ProductStoreLogicTest {
	
	private ProductStore pStore;
	
	@Before
	public void beforeTest() {
		pStore = new ProductStoreLogic();
	}

//	@Test
//	public void testInsertProduct() {
//		Product product = new Product();
//		product.setCategory("1");
//		product.setContent("2");
//		product.setHit(3);
//		product.setImage("4");
//		Member maker = new Member();
//		maker.setId("5");
//		product.setMaker(maker);
//		product.setPeriod(6);
//		product.setPrice(7);
//		product.setTitle("8");
//		pStore.insertProduct(product);
//	}
//
//	@Test
//	public void testUpdateProductById() {
//		Product product = new Product();
//		product.setId("2");
//		product.setCategory("8");
//		product.setContent("7");
//		product.setHit(6);
//		product.setImage("5");
//		Member maker = new Member();
//		maker.setId("4");
//		product.setMaker(maker);
//		product.setPeriod(3);
//		product.setPrice(2);
//		product.setTitle("1");
//		pStore.updateProductById(product);
//	}
//
//	@Test
//	public void testDeleteProductById() {
//		pStore.deleteProductById("2");
//	}
//
//	@Test
//	public void testSelectProductById() {
//		Product product = pStore.selectProductById("6");
//
//		System.out.println("Id : " + product.getId());
//		System.out.println("Category : " + product.getCategory());
//		System.out.println("Content : " + product.getContent());
//		System.out.println("Hit : " + product.getHit());
//		System.out.println("Image : " + product.getImage());
//		System.out.println("Period : " + product.getPeriod());
//		System.out.println("Price : " + product.getPrice());
//		System.out.println("Title : " + product.getTitle());
//		System.out.println("Maker : " + product.getMaker().getImage());
//		System.out.println("Review : " + product.getReviews().get(0).getId());
//	}
//
//	@Test
//	public void testSelectProductsByCategoryOrderByHitsForMain() {
//		List<Product> productList = pStore.selectProductsByCategoryOrderByHitsForMain("1", "2");
//		System.out.println(productList.size());
//		assertEquals(2, productList.size());
//		assertEquals("5", productList.get(1).getId());
//	}
//
//	@Test
//	public void testSelectProductsByCategoryOrderByIdForMain() {
//		List<Product> productList = pStore.selectProductsByCategoryOrderByIdForMain("1", "2");
//		System.out.println(productList.size());
//		assertEquals(2, productList.size());
//		assertEquals(3, productList.get(1).getHit());
//	}
//
//	@Test
//	public void testSelectProductsByCategory() {
//		List<Product> productList = pStore.selectProductsByCategory("1", "2", "3");
//		System.out.println(productList.size());
//		assertEquals(2, productList.size());
//	}
//
//	@Test
//	public void testSelectProductsByCategoryAndTitle() {
//		List<Product> productList = pStore.selectProductsByCategoryAndTitle("1", "8", "1", "2");
//		System.out.println(productList.size());
//		assertEquals(1, productList.size());
//	}
//
//	@Test
//	public void testSelectProductsByCategoryAndMakerName() {
//		List<Product> productList = pStore.selectProductsByCategoryAndMakerName("1", "5", "1", "2");
//		System.out.println(productList.size());
//		assertEquals("2", productList.get(1).getTitle());
//	}
//
//	@Test
//	public void testSelectProductsByCategoryAndMakerId() {
//		List<Product> productList = pStore.selectProductsByCategoryAndMakerId("1", "5", "1", "7");
//		System.out.println(productList.size());
//	}
	
	@Test
	public void testSelectProductsByCategoryAndMakerIdForImage() {
		List<Portfolio> portfolioList = new ArrayList<>();
		
		Portfolio pf = new Portfolio();
		Member m = new Member();
		pf.setCategory("1");
		m.setId("6");
		pf.setMaker(m);
		portfolioList.add(pf);
		
		pf = new Portfolio();
		m = new Member();
		pf.setCategory("2");
		m.setId("7");
		pf.setMaker(m);
		portfolioList.add(pf);
		
		pf = new Portfolio();
		m = new Member();
		pf.setCategory("3");
		m.setId("6");
		pf.setMaker(m);
		portfolioList.add(pf);
		
		List<Product> productList = pStore.selectProductsByCategoryAndMakerIdForImage(portfolioList);
		for(Product p : productList) {
			System.out.println(p.toString());
		}
	}
//
//	@Test
//	public void testSelectProductsByMakerId() {
//		List<Product> productList = pStore.selectProductsByMakerId("6", "1", "7");
//		System.out.println(productList.size());
//	}
//
//	@Test
//	public void testSelectProductsByMakerIdAndTitle() {
//		List<Product> productList = pStore.selectProductsByMakerIdAndTitle("5", "8", "1", "7");
//		System.out.println(productList.size());
//	}
//
//	@Test
//	public void testSelectAllCategory() {
//		List<Category> categoryList = pStore.selectAllCategory();
//		assertEquals(5, categoryList.size());
//	}

}
