package ordermade.store.logic;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Member;
import ordermade.domain.PurchaseHistory;
import ordermade.domain.Request;

public class PurchaseHistoryStoreLogicTest {

	private PurchaseHistoryStoreLogic store;
	
	@Before
	public void setUp() throws Exception {
		store = new PurchaseHistoryStoreLogic();
	}

	/*@Test
	public void testInsertPurchaseHistory() {
		for(int i=0; i<10; i++){
			PurchaseHistory p = new PurchaseHistory();
			Member user1= new Member();
			user1.setId("user" + i);
			Member maker1 = new Member();
			maker1.setId("maker"+i);
			p.setConsumer(user1);
			p.setMaker(maker1);
			p.setCharge(5);
			p.setDeliveryStatus("stat"+i);
			p.setInvoiceNumber("300"+i+"0");
			
			java.util.Date date1=new java.util.Date();
			date1.getTime();
			Date date = new Date(date1.getTime());
			p.setOrderDate(date);
			
			p.setPayment("date"+ i);
			Request r =  new Request();
			r.setId(""+i);
			p.setRequest(r);
			store.insertPurchaseHistory(p);
		}
	}*/

//	@Test
//	public void testUpdatePurchaseHistoryById() {
//		PurchaseHistory p = new PurchaseHistory();
//		p.setId("64");
//		Member user2= new Member();
//		user2.setId("user2");
//		Member maker2 = new Member();
//		maker2.setId("maker2");
//		p.setConsumer(user2);
//		p.setMaker(maker2);
//		p.setCharge(5);
//		p.setDeliveryStatus("ertertert");
//		p.setInvoiceNumber("777000");
//		
//		java.util.Date date1=new java.util.Date();
//		date1.getTime();
//		Date date = new Date(date1.getTime());
//		p.setOrderDate(date);
//		
//		p.setPayment(""+date1.getTime());
//		Request r =  new Request();
//		r.setId("2");
//		p.setRequest(r);
//
//		
//		store.updatePurchaseHistoryById(p);
//	}

//	@Test
//	public void testSelectPurchaseHistoryById(){
//		String id = "1";
//		store.selectPurchseHistoryById(id);
//		System.out.println(store.selectPurchseHistoryById(id).toString());
//		assertNotNull(store.selectPurchseHistoryById(id));
//		assertEquals("user1", store.selectPurchseHistoryById(id).getConsumer().getId());
//	}
	
//	@Test
//	public void testSelectPurchaseHistoriesByConsumerId() {
//		List<PurchaseHistory> list = store.selectPurchaseHistoriesByConsumerId("user1", "1");
//		for(PurchaseHistory p : list){
//			System.out.println(p.toString());
//		}
//	}

//	@Test
//	public void testSelectPurchaseHistoriesByConsumerIdAndRequestTitle() {
//		List<PurchaseHistory> list = store.selectPurchaseHistoriesByConsumerIdAndRequestTitle("user1","b", "1");
//		for(PurchaseHistory p : list){
//			System.out.println(p.toString());
//		}
//	}
	
//	@Test
//	public void testSelectPurchaseHistoriesByMakerId() {
//		List<PurchaseHistory> list = store.selectPurchaseHistoriesByMakerId("maker1", "1");
//		for(PurchaseHistory p : list){
//			System.out.println(p.toString());
//		}
//	}

//	@Test
//	public void testSlelctPurchaseHistoriesByMakerIdAndRequestTitle() {
//		List<PurchaseHistory> list = store.selectPurchaseHistoriesByMakerIdAndRequestTitle("maker1","b", "1");
//		for(PurchaseHistory p : list){
//			System.out.println(p.toString());
//		}
//	}

}
