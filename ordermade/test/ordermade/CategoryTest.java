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
		assertEquals(5, list.size());
	}

}
