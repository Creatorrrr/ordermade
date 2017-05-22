package ordermade.store.mapper;

import ordermade.domain.Account;

public interface AccountMapper {

	public boolean updateAccountById(Account account);
	public Account selectAccountById(String id);
	 
}
