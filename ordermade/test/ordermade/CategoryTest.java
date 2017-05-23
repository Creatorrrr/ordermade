package ordermade;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Category;
import ordermade.store.logic.CategoryStoreLogic;

public class CategoryTest {

	private CategoryStoreLogic store;
	
	@Before
	public void setUp() throws Exception {
		store = new CategoryStoreLogic();
	}

	@Test
	public void test() {
		List<Category> list = store.selectAllCategory();
		System.out.println(list.size());
		assertEquals(4, list.size());
	}

}
