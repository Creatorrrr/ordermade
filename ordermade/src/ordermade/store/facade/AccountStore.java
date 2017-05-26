package ordermade.store.facade;

import ordermade.domain.Account;

public interface AccountStore {
	
	public boolean updateAccountById(Account account);
	public Account selectAccountById(String id);
	
}
