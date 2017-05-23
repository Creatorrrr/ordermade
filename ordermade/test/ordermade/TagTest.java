package ordermade;

import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Portfolio;
import ordermade.domain.Tag;
import ordermade.store.logic.TagStoreLogic;

public class TagTest {

	private TagStoreLogic store;
	@Before
	public void setUp() throws Exception {
		
		store = new TagStoreLogic();
	}

	@Test
	public void testInsertTag() {
		Tag tag = new Tag();
		
		tag.setId("qq");
		tag.setKeyword("qq");
		tag.setScore(1322);
		
		Portfolio pf = new Portfolio();
		
		pf.setId("rr");
		
		tag.setPortfolio(pf);
		store.insertTag(tag);
		
	}

//	@Test
//	public void testDeleteTagById() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectTagById() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testTagsFromGoogleVision() {
//		fail("Not yet implemented");
//	}

}
