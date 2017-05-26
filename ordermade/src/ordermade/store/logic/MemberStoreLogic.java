package ordermade.store.logic;

import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.Member;
import ordermade.store.facade.MemberStore;
import ordermade.store.mapper.MemberMapper;

@Repository
public class MemberStoreLogic implements MemberStore {
	
	private SqlSessionFactory factory;
	
	public MemberStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public boolean insertMember(Member member) {
		SqlSession session = factory.openSession();

		boolean result = false;

		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);

			if (result = mapper.insertMember(member) > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public boolean updateMemberById(Member member) {
		SqlSession session = factory.openSession();

		boolean result = false;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);

			if (result = mapper.updateMemberById(member) > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public boolean deleteMemberById(String id) {
		SqlSession session = factory.openSession();

		boolean result = false;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			if (result = mapper.deleteMemberById(id) > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public Member selectMemberById(String id) {
		SqlSession session = factory.openSession();

		Member member = null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.selectMemberById(id);
		} catch (ExecutorException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return member;
	}

}
