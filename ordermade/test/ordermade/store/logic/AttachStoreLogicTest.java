package ordermade.store.logic;

import static org.junit.Assert.*;

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

	@Test
	public void testInsertAttach() {
		
		Attach attach = new Attach();
		Request request = new Request();
		request.setId("11");
		
		attach.setFileName("hi");
		attach.setExtension("jpg");
		attach.setPath("system32/root/user");
		attach.setRequest(request);
		
		assertFalse(!store.insertAttach(attach));
		
	}

//	@Test
//	public void testDeleteAttachById() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectAllAttachsByRequestId() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectAttachsByFileNameAndRequestId() {
//		fail("Not yet implemented");
//	}

}
