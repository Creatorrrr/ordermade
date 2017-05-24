package ordermade.store.logic;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import ordermade.store.facade.CommentStore;
import ordermade.store.logic.CommentStoreLogic;

public class CommentStoreLogicTest {
	
	private CommentStore store;
	
	@Before
	public void setUp() throws Exception{
		store = new CommentStoreLogic();
	}

//	@Test
//	public void testInsertComment() {
//		Comment comment = new Comment();
//		String content = "정말 기대됩니다.";
//		Attach attach = new Attach();
//		attach.setId("1");
//		Member member = new Member();
//		member.setId("kkjin");
//		Request request = new Request();
//		request.setId("2");
//		Date time = Date.valueOf("2017-05-23");
//		
//		
//		comment.setAttach(attach);
//		comment.setContent(content);
//		comment.setMember(member);
//		comment.setRequest(request);
//		comment.setTime(time);
//		
//		
//		assertFalse(!store.insertComment(comment));
//	}

//	@Test
//	public void testUpdateCommentById() {
//		Comment comment = new Comment();
//		Date time = Date.valueOf("2017-05-22");
//		Member member = new Member();
//		member.setId("kkjin");
//		comment.setContent("다니됩대기 말정");
//		comment.setTime(time);
//		comment.setMember(member);
//		assertFalse(!store.updateCommentById(comment));
//	}

//	@Test
//	public void testDeleteCommentById() {
//		String id = "kkji";
//		assertFalse(!store.deleteCommentById(id));
//	}

//	@Test
//	public void testSelectCommentsByRequestId() {
//	}

}
