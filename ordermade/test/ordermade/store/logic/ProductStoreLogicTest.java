package ordermade.store.logic;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Member;
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
//		Product product = pStore.selectProductById("3");
//
//		System.out.println("Id : " + product.getId());
//		System.out.println("Category : " + product.getCategory());
//		System.out.println("Content : " + product.getContent());
//		System.out.println("Hit : " + product.getHit());
//		System.out.println("Image : " + product.getImage());
//		System.out.println("Period : " + product.getPeriod());
//		System.out.println("Price : " + product.getPrice());
//		System.out.println("Title : " + product.getTitle());
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
	@Test
	public void testSelectProductsByCategoryAndMakerName() {
		List<Product> productList = pStore.selectProductsByCategoryAndMakerName("1", "5", "1", "2");
		System.out.println(productList.size());
		assertEquals(3, productList.get(1).getMaker().getAddress());
	}
//
//	@Test
//	public void testSelectProductsByCategoryAndMakerId() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectProductsByMakerId() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectProductsByMakerIdAndTitle() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectAllCategory() {
//		fail("Not yet implemented");
//	}

}
