package ordermade.store.logic;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.InviteRequest;
import ordermade.domain.Member;
import ordermade.domain.Request;
import ordermade.store.facade.InviteRequestStore;
import sun.security.util.Length;

public class InviteRequestStoreLogicTest {

	private InviteRequestStore irStore;

	@Before
	public void setup() {
		irStore = new InviteRequestStoreLogic();
	}

	/*@Test		//ok
	public void testInsertInviteRequest() {

		Member member = new Member();
		Request request = new Request();
		InviteRequest ir = new InviteRequest();
		
		member.setId("user1");
		request.setId("1");
		
		ir.setMessage("제 요청을 받아주세요");
		ir.setForm("I");
		ir.setRequest(request);
		ir.setMaker(member);
		
		assertTrue(irStore.insertInviteRequest(ir));
	}*/
	
//	@Test         //ok
//	public void deleteInviteRequestById() {
//		boolean a = irStore.deleteInviteRequestById("6");
//		assertEquals(true, a);
//	}
	
//	@Test		 //ok
//	public void deleteInviteRequestsByRequestId(){
//		boolean a = irStore.deleteInviteRequestsByRequestId("7");
//		assertEquals(true, a);
//	}

//	@Test		  //ok
//	public void testSelectInviteRequestsByMakerId(){
//		List<InviteRequest> list = irStore.selectInviteRequestsByMakerId("maker1","test","1");
//		System.out.println(list.size());
//		for(InviteRequest ir : list ){
//			System.out.println(ir.getId()+" "+ ir.getMessage());
//		}
//	}
	
//	@Test		 //request.consumerId  innerJoin
//	public void testselectInviteRequestsByConsumerId(){
//		List<InviteRequest> list = irStore.selectInviteRequestsByConsumerId("user1","test","1");
//		System.out.println(list.size());
//		for(InviteRequest ir : list ){
//			System.out.println(ir.getId()+" "+ ir.getMessage());
//		}
//	}	
	
}