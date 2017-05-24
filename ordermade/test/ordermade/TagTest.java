package ordermade;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

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
//		tag.setId("qq123");
//		tag.setKeyword("qq123");
//		tag.setScore(1322);
//		
//		Portfolio pf = new Portfolio();
//		
//		pf.setId("rr123");
//		
//		tag.setPortfolio(pf);
//		store.insertTag(tag);
//		
//	}
//
//	@Test
//	public void testDeleteTagById() {
//		boolean cheak = store.deleteTagById("2");
//		System.out.println(cheak);
//		
//	}
//
//	@Test
//	public void testSelectTagById() {
//		List<Tag> list = store.selectTagsByPortfolioId("7");
//		for(Tag tag : list){			
//			System.out.println(tag.getId());
//		}
//	}

//	@Test
//	public void testTagsFromGoogleVision() {
//		
//	}
}
