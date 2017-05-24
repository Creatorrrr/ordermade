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

//	@Test		//ok
//	public void testInsertInviteRequest() {
//
//		Member member = new Member();
//		Request request = new Request();
//		InviteRequest ir = new InviteRequest();
//		
//		member.setId("test");
//		request.setId("requesttest");
//		
//		ir.setId("test");
//		ir.setMessage("test1");
//		ir.setForm("test");
//		ir.setRequest(request);
//		ir.setMaker(member);
//		
//		assertTrue(irStore.insertInviteRequest(ir));
//	}
	
//	@Test         //ok
//	public void deleteInviteRequestById() {
//		boolean a = irStore.deleteInviteRequestById("123");
//		assertEquals(true, a);
//	}
	
//	@Test		 //ok
//	public void deleteInviteRequestsByRequestId(){
//		boolean a = irStore.deleteInviteRequestsByRequestId("test");
//		assertEquals(true, a);
//	}
	
//	@Test		  //o
//	public void testSelectInviteRequestsByMakerId(){
//		List<InviteRequest> list = irStore.selectInviteRequestsByMakerId("1","1","2");
//		System.out.println(list.size());
//		//	assertEquals(1,list.get(0).getMaker().getId());
//	}
	
//	@Test		 //request.consumerId  innerJoin
//	public void testselectInviteRequestsByConsumerId(){
//		List<InviteRequest> list = irStore.selectInviteRequestsByMakerId("test","1","2");
//		System.out.println(list.size());
	//	assertNotNull(list);
	//	assertEquals("test",list.get(0).getMember().getId());
//	}	
	
}
