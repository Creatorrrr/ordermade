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
	public void setUp() throws Exception{
		store = new AccountStoreLogic();
	}

//	@Test
//	public void testUpdateAccountById() {
//		
//		Account account = new Account();
//		Member member = new Member();
//		member.setId("hjKing");
//		member.setName("�궧�솗吏�");
//		int money = 12000;
//		
//		account.setMember(member);
//		account.setMoney(money);
//		
//		boolean check = store.updateAccountById(account);
//		assertTrue(check);
//	}

//	@Test
//	public void testSelectAccountById() {
//		String id = "hjKing";
//		assertEquals(10000, store.selectAccountById(id));
//	}

}
