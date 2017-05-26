package ordermade.store.logic;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.crypto.Data;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Member;
import ordermade.domain.Portfolio;
import ordermade.domain.Tag;

public class PortfolioStoreLogicTest {

	private PortfolioStoreLogic store;
	
	@Before
	public void setUp() throws Exception {
		store = new PortfolioStoreLogic();
	}

//	@Test
//	public void testInsertPortfolio() {
//		Portfolio p = new Portfolio();
//		p.setCategory("aa");//type
//		p.setTitle("title"+(new Date()).getTime());
//		p.setContent("content"+(new Date()).getTime());
//		Member m=new Member();
//		m.setId("user1");
//		p.setMaker(m);
//		p.setImage("http://asdfasdfal");
//		store.insertPortfolio(p);
//	}
//
//	@Test
//	public void testUpdatePortfolioById() {
//		Portfolio p = new Portfolio();
//		p.setId("8");
//		p.setCategory("bbb");//type
//		p.setTitle("TTTTT"+(new Date()).getTime());
//		p.setContent("CCCCC"+(new Date()).getTime());
//		Member m=new Member();
//		m.setId("user2222");
//		p.setMaker(m);
//		p.setImage("http://2354234234234");
//		store.updatePortfolioById(p);
//	}
//
//	@Test
//	public void testDeletePortfolioById() {
//		store.deletePortfolioById("9");
//	}
//
//	@Test
//	public void testSelectPortfolioById() {
//		Portfolio p=store.selectPortfolioById("1");
//		System.out.println(p.getId());
//		System.out.println(p.getTitle());
//		System.out.println(p.getCategory());
//		System.out.println(p.getContent());
//		System.out.println(p.getMaker().getId());
//		System.out.println(p.getImage());
//		System.out.println(p.toString());
//	}

//	@Test
//	public void testSelectPortfoliosByMakerId() {
//		List<Portfolio> list = store.selectPortfoliosByMakerId("user1", "2");
//		for(Portfolio p : list){
//			System.out.println(p.getId());
//			System.out.println(p.getTitle());
//			System.out.println(p.getCategory());
//			System.out.println(p.getContent());
//			//System.out.println(p.getMaker().getId());
//			System.out.println(p.getImage());
//		}
//		
//	}

//	@Test
//	public void testSelectPortfoliosByMakerIdAndTitle() {
//		List<Portfolio> list = store.selectPortfoliosByMakerIdAndTitle("user1", "title", "1");
//		for(Portfolio p : list){
//			//System.out.println(p.getId());
//			System.out.println(p.toString());
//		}
//	}

//	@Test
//	public void testSelectPortfoliosByCategory() {
//		List<Portfolio> list = store.selectPortfoliosByCategory("bbb", "1");
//		for(Portfolio p : list){
//			System.out.println(p.toString());
//		}
//	}

	@Test
	public void testSelectPortfoliosByTags() {
		List<Tag> tags = new ArrayList<>();
		Tag tag = new Tag();
		tag.setKeyword("1");
		tags.add(tag);
		tag = new Tag();
		tag.setKeyword("2");
		tags.add(tag);
		tag = new Tag();
		tag.setKeyword("3");
		tags.add(tag);
		List<Portfolio> list = store.selectPortfoliosByTags(tags);
		for(Portfolio p : list){
			System.out.println(p.toString());
		}
	}
}
