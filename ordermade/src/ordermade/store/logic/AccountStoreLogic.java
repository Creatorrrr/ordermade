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
	public boolean insertAccountByMemberId(String memberId, int money) {
		SqlSession session = factory.openSession();
		boolean check = false;
		
		try{
			AccountMapper mapper = session.getMapper(AccountMapper.class);
			check = mapper.insertAccountByMemberId(memberId, money);
			session.commit();
		} finally {
			session.close();
		}
		return check;
	}
	
	@Override
	public boolean transaction(String fromId, String toId, int money) {
		SqlSession session = factory.openSession();
		boolean check = false;
		
		try{
			AccountMapper mapper = session.getMapper(AccountMapper.class);
			check = mapper.transaction(fromId, toId, money);
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
