package ordermade;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Member;
import ordermade.store.logic.MemberStoreLogic;

public class MemberTest {
	private MemberStoreLogic store;

	@Before
	public void setUp() throws Exception {

		store = new MemberStoreLogic();
	}

//	@Test
//	public void testInsertMember() {
//
//		Member member = new Member();
//
//		member.setId("qq");
//		member.setPassword("123");
//		member.setEmail("qq");
//		member.setAddress("qq");
//		member.setMemberType("qq");
//		member.setName("qq");
//		member.setIntroduce("qq");
//		member.setLicenseNumber("qq");
//		member.setImage("qq");
//
//		store.insertMember(member);
//
//	}

	// @Test
	// public void testUpdateMember() {
	// Member member = new Member();
	//
	// member.setId("ww");
	// member.setPassword("456");
	// member.setEmail("ww");
	// member.setAddress("ww");
	// member.setMemberType("ww");
	// member.setName("ww");
	// member.setIntroduce("ww");
	// member.setLicenseNumber("ww");
	// member.setImage("ww");
	//
	// store.updateMember(member);
	// }
	//
	// @Test
	// public void testDeleteMember() {
	//
	// boolean check = store.deleteMember("ww");
	// System.out.println(check);
	// }
	//
	@Test
	public void testSelectMemberBy() {
		Member member = store.selectMemberBy("qq");
		
		assertEquals("ee", member.getId());
	}

}
