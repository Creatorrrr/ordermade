package ordermade.store.logic;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Category;
import ordermade.domain.Member;
import ordermade.domain.Request;
import ordermade.store.facade.RequestStore;

public class RequestStoreLogicTest {

	private RequestStore rStore;

	@Before
	public void setup() {
		rStore = new RequestStoreLogic();
	}

//	@Test   //ok
//	public void testInsertRequest() {
//		Member maker = new Member();
//		Member consumer = new Member();
//		Request rs = new Request();
//
//		maker.setId("testM");
//		consumer.setId("testC");
//
//		rs.setId("test");
//		rs.setTitle("의뢰");
//		rs.setContent("12345");
//		rs.setBound("");
//		rs.setCategory("가구");
//		rs.setHopePrice(10000);
//		rs.setPrice(10500);
//		rs.setMaker(maker);
//		rs.setConsumer(consumer);
//
//		assertTrue(rStore.insertRequest(rs));
//	}
	
//	@Test  //ok
//	public void testUpdateReqeustById() {
//		Member maker = new Member();
//		Member consumer = new Member();
//		Request rs = new Request();
//		
//		maker.setId("testM");
//		consumer.setId("testC");
//
//		rs.setId("test");
//		rs.setTitle("의뢰서");
//		rs.setContent("012345");
//		rs.setBound("1");
//		rs.setCategory("가구");
//		rs.setHopePrice(10000);
//		rs.setPrice(10500);
//		rs.setMaker(maker);
//		rs.setConsumer(consumer);
//
//		assertTrue(rStore.updateReqeustById(rs));
//	}
	
//	@Test  
//	public void testDeleteRequestById() {
//		
//		Request rs = new Request();
//		assertEquals(true,rStore.deleteRequestById("test"));
//	}
	
//	@Test		//ok
//	public void testSelectRequestById() {
//		
//		Request request = rStore.selectRequestById("test");
//		
//		System.out.println("Id : " + request.getId());
//		System.out.println("Category : " + request.getCategory());
//		System.out.println("Content : " + request.getContent());
//		System.out.println("Bound : " + request.getBound());
//		System.out.println("Hprice : " + request.getHopePrice());
//		System.out.println("Price : " + request.getPrice());
//		System.out.println("Title : " + request.getTitle());
//	//	System.out.println("Mak : " + request.getMaker());
//	//	System.out.println("Con : " + request.getConsumer());
//		//System.out.println("Comments : " + request.getComments());
//		//System.out.println("attachs : " + request.getAttachs());
//		//assertEquals("test", request.getId());
//	}

//	@Test		//ok
//	public void testSelectRequestsByBound() {
//		
//		List<Request> list = rStore.selectRequestsByBound("1", "1", "2");
//		
//		System.out.println(list.size());
//		assertEquals(1, list.size());
//		
//	}
	
//	@Test 	//ok
//	public void testSelectRequestsByBoundAndTitle() {
//		
//		List<Request> list = rStore.selectRequestsByBoundAndTitle("1","의뢰서", "1", "2");
//		System.out.println(list.size());
//		assertEquals(1, list.size());
//
//	}

//	@Test		//ok
//	public void testSelectRequestsByBoundAndContent() {
//		
//		List<Request> list = rStore.selectRequestsByBoundAndContent("1","012345", "1", "2");
//		System.out.println(list.size());
//		assertEquals(1, list.size());
//	}
	
//	@Test 		//ok
//	public void testSelectRequestsByConsumerId() {
//		
//		List<Request> list = rStore.selectRequestsByConsumerId("testC", "1", "2");
//		System.out.println(list.size());
//		assertEquals(1, list.size());
//	}
	
//	@Test		//ok
//	public void testSelectRequestsByConsumerIdWithMaker() {
//		
//		List<Request> list = rStore.selectRequestsByConsumerIdWithMaker("testC", "1", "2");
//		System.out.println(list.size());
//		assertEquals(1, list.size());
//	}

//	@Test		//ok
//	public void testSelectRequestsByConsumerIdWithPayment() {
//		
//		List<Request> list = rStore.selectRequestsByConsumerIdWithPayment("testC", "1", "2");
//		System.out.println(list.size());
//		assertEquals(1, list.size());
//	}
}
