package ordermade;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Account;
import ordermade.domain.Member;
import ordermade.store.facade.AccountStore;
import ordermade.store.logic.AccountStoreLogic;

public class AccountStoreLogicTest {
	
	private AccountStore store;
	
	@Before
	public void setUp(){
		store = new AccountStoreLogic();
	}

//	@Test
//	public void testUpdateAccountById() {
//		
//		Account account = new Account();
//		Member member = new Member();
//		member.setId("hjKing");
//		member.setName("킹왕짱");
//		int money = 10000;
//		
//		account.setMember(member);
//		account.setMoney(money);
//		
//		boolean check = store.updateAccountById(account);
//		assertTrue(check);
//	}

	@Test
	public void testSelectAccountById() {
		String id = "hjKing";
		assertEquals(10000, store.selectAccountById(id));
	}

}
