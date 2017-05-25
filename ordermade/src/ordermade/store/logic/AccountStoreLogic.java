package ordermade.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.Account;
import ordermade.store.facade.AccountStore;
import ordermade.store.mapper.AccountMapper;

@Repository
public class AccountStoreLogic implements AccountStore{
	
	private SqlSessionFactory factory;
	
	public AccountStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public boolean updateAccountById(Account account) {
		SqlSession session = factory.openSession();
		boolean check = false;
		
		try{
			AccountMapper mapper = session.getMapper(AccountMapper.class);
			check = mapper.updateAccountById(account);
			session.commit();
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public Account selectAccountById(String id) {
		SqlSession session = factory.openSession();
		Account account = null;
		
		try{
			AccountMapper mapper = session.getMapper(AccountMapper.class);
			account = mapper.selectAccountById(id);
		} finally {
			session.close();
		}
		return account;
	}

}
