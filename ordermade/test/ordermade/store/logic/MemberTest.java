package ordermade.store.logic;

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
//		member.setId("qq12");
//		member.setPassword("12312");
//		member.setEmail("qq12");
//		member.setAddress("qq12");
//		member.setMemberType("qq21");
//		member.setName("qq12");
//		member.setIntroduce("qq12");
//		member.setLicenseNumber("qq12");
//		member.setImage("qq12");
//
//		store.insertMember(member);
//
//	}

//	 @Test
//	 public void testUpdateMember() {
//	 Member member = new Member();
//	
//	 member.setId("qq");
//	 member.setPassword("456");
//	 member.setEmail("ww");
//	 member.setAddress("ww");
//	 member.setMemberType("ww");
//	 member.setName("ww");
//	 member.setIntroduce("ww");
//	 member.setLicenseNumber("ww");
//	 member.setImage("ww");
//	
//	 store.updateMember(member);
//	 }
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
//	@Test
//	public void testSelectMemberBy() {
//		Member member = store.selectMemberById("jwUm");
//		System.out.println(member.toString());
//		assertEquals("ee", member.getId());
//	}

}
