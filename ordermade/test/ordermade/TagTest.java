package ordermade;

import static org.junit.Assert.assertEquals;
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

//	@Test
//	public void testInsertTag() {
//		Tag tag = new Tag();
//		
//		tag.setId("qq");
//		tag.setKeyword("qq");
//		tag.setScore(1322);
//		
//		Portfolio pf = new Portfolio();
//		
//		pf.setId("rr");
//		
//		tag.setPortfolio(pf);
//		store.insertTag(tag);
//		
//	}

//	@Test
//	public void testDeleteTagById() {
//	boolean cheak = store.deleteTagById("1");
//		System.out.println(cheak);
//		
//	}
//
//	@Test
//	public void testSelectTagById() {
//		
//		Tag tag = store.selectTagById("1");
//		
//		assertEquals("qr", tag.getKeyword());
//		
//	}
//
//	@Test
//	public void testTagsFromGoogleVision() {
//		
//	}
}