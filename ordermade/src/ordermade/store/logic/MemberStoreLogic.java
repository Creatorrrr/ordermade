package ordermade.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ordermade.domain.Member;
import ordermade.store.facade.MemberStore;
import ordermade.store.mapper.MemberMapper;

@Repository
public class MemberStoreLogic implements MemberStore {

	@Override
	public boolean insertMember(Member member) {

		int check = 0;

		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();

		MemberMapper mapper = session.getMapper(MemberMapper.class);
		check = mapper.insertMember(member);
		session.close();
		return check > 0;
	}

	@Override
	public boolean updateMember(Member member) {

		int check = 0;

		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();

		MemberMapper mapper = session.getMapper(MemberMapper.class);
		check = mapper.updateMember(member);
		session.close();

		return check > 0;
	}

	@Override
	public boolean deleteMember(String id) {

		int check = 0;

		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();

		MemberMapper mapper = session.getMapper(MemberMapper.class);
		check = mapper.deleteMember(id);
		session.close();

		return check > 0;
	}

	@Override
	public Member selectMemberById(String id) {

		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();

		MemberMapper mapper = session.getMapper(MemberMapper.class);
		Member member = mapper.selectMemberById(id);
		session.close();

		return member;
	}

}
