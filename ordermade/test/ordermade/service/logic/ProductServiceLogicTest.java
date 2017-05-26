package ordermade.service.logic;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ordermade.domain.Product;
import ordermade.service.facade.ProductService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:WebContent/WEB-INF/dispatcher-servlet.xml")
public class ProductServiceLogicTest {
	
	@Autowired
	private ProductService pService;

//	@Test
//	public void testFindProductsByCategoryOrderByHitsForMain() {
//		System.out.println(pService.findProductsByCategoryOrderByHitsForMain("1", "2").size());
//	}
//
//	@Test
//	public void testFindProductsByCategoryOrderByIdForMain() {
//		System.out.println(pService.findProductsByCategoryOrderByIdForMain("1", "3").size());
//	}
//
	@Test
	public void testFindProductsByImage() {
		List<Product> productList = pService.findProductsByImage("./WebContent/images/cat9.jpg");
		for(Product p : productList) {
			System.out.println(p.toString());
		}
	}
//
//	@Test
//	public void testFindProductsByCategoryAndTitle() {
//		List<Product> productList = pService.findProductsByCategoryAndTitle("1", "8", "2");
//		
//		for(Product p : productList) {
//			System.out.println(p.getId());
//		}
//	}

}
