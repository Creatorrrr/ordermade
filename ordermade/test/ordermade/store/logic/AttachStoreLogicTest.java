package ordermade.store.logic;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Attach;
import ordermade.domain.Request;
import ordermade.store.facade.AttachStore;

public class AttachStoreLogicTest {
	
	private AttachStore store;
	
	@Before
	public void setUp() throws Exception{
		store = new AttachStoreLogic();
	}

//	@Test
//	public void testInsertAttach() {
//		Attach attach = new Attach();
//		Request request = new Request();
//		
//		for(int i=0; i < 100 ; i++){
//			request.setId("id : " + i);
//			attach.setFileName("fName : " + i);
//			attach.setExtension("extens : " + i);
//			attach.setPath("system32/root/user" + i);
//			attach.setRequest(request);
//			
////			store.insertAttach(attach);
//		}
//		assertFalse(!store.insertAttach(attach));
//	}

//	@Test
//	public void testDeleteAttachById() {
//		Attach attach = new Attach();
//		Request request = new Request();
//		request.setId("11");
//		attach.setId("1");
//		attach.setRequest(request);
//		
//		assertFalse(!store.deleteAttachById(attach));
//	}
//
//	@Test
//	public void testSelectAllAttachsByRequestId() {
//		String requestId = "id : 1";
//		String page = "1";
//		List<Attach> attachList = new ArrayList<>();
//		attachList = store.selectAllAttachsByRequestId(requestId, page);
//		assertEquals(10, attachList.size());
//	}
//
//	@Test
//	public void testSelectAttachsByFileNameAndRequestId() {
//		String fileName = "fName : 1";
//		String requestId = "id : 1";
//		String page = "1";
//		List<Attach> attachList = new ArrayList<>();
//		attachList = store.selectAttachsByFileNameAndRequestId(fileName, requestId, page);
//		assertEquals(5, attachList.size());
//	}
}
