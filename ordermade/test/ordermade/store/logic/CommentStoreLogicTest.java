package ordermade.store.logic;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Attach;
import ordermade.domain.Comment;
import ordermade.domain.Member;
import ordermade.domain.Request;
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
//		Member member = new Member();
//		Request request = new Request();
//		java.util.Date udate = new java.util.Date();
//		Date date = new Date(udate.getTime());
//		
//		for(int i=0 ; i < 30 ; i++) {
//			member.setId("kkjin" + i);
//			request.setId("idn" + i);
//			comment.setContent(content + i);
//			comment.setMember(member);
//			comment.setRequest(request);
//			comment.setTime(date);
//			
//			store.insertComment(comment);
//			System.out.println(comment.toString());
//		}
////		assertFalse(!store.insertComment(comment));
////	    insert를 여러번 하고 싶으면 store의 try/catch를 삭제 
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

	@Test
	public void testSelectCommentsByRequestId() {
		String requestId = "1";
		String page = "1";
		
		List<Comment> commentList = new ArrayList<>();
		commentList = store.selectCommentsByRequestId(requestId, page);
		for(Comment comment : commentList){
			System.out.println(comment.toString());
		}
		assertEquals(10, commentList.size());
	}

}
