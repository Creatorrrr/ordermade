package ordermade.store.facade;

import ordermade.domain.Account;

public interface AccountStore {
	
	public boolean transaction(String fromId, String toId, int money);
	public Account selectAccountById(String id);
	
}
