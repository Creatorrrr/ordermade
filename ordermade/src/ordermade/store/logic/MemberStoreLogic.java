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

	@Override
	public boolean insertMember(Member member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int check = mapper.insertMember(member);
		session.close();
		return check > 0;
	}

	@Override
	public boolean updateMember(Member member) {

		boolean check = false;

		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int check = mapper.updateMember(member);
		session.close();
		return check > 0;
	}

	@Override
	public boolean deleteMember(String id) {

		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int check = mapper.deleteMember(id);
		session.close();
		return check > 0;
	}

	@Override
	public Member selectMemberBy(String id) {
		
		Member member = null;

		MemberMapper mapper = session.getMapper(MemberMapper.class);
		Member member = mapper.selectMemberById(id);
		session.close();
		return member;
	}

}
