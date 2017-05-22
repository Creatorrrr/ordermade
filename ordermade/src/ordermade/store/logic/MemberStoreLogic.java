package ordermade.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ordermade.domain.Member;
import ordermade.store.facade.MemberStore;
import ordermade.store.mapper.MemberMapper;

@Repository
public class MemberStoreLogic implements MemberStore {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertMember(Member member) {

		int check = 0;

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		check = mapper.insertMember(member);
		return check > 0;
	}

	@Override
	public boolean updateMember(Member member) {

		int check = 0;

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		check = mapper.updateMember(member);
		return check > 0;
	}

	@Override
	public boolean deleteMember(String id) {

		int check = 0;

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		check = mapper.deleteMember(id);
		return check > 0;
	}

	@Override
	public Member selectMemberBy(String id) {

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		Member member = mapper.selectMemberBy(id);
		return member;
	}

}
