package ordermade.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ordermade.domain.Member;
import ordermade.store.facade.MemberStore;
import ordermade.store.mapper.MemberMapper;

@Repository
public class MemberStoreLogic implements MemberStore {
	
	private SqlSession session;
	
	public MemberStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	private SqlSession session;

	public MemberStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	@Override
	public boolean insertMember(Member member) {

		boolean check = false;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			check = mapper.insertMember(member);
			session.commit();
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean updateMember(Member member) {

		boolean check = false;

		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			check = mapper.updateMember(member);
			session.commit();
		} finally {
			session.close();
		}

		return check;
	}

	@Override
	public boolean deleteMember(String id) {

		boolean check = false;
		
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			check = mapper.deleteMember(id);
			session.commit();
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public Member selectMemberBy(String id) {
		
		Member member = null;

		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.selectMemberById(id);
			session.commit();
		} finally {
			session.close();
		}
		return member;
	}

}
