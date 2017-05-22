package ordermade.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ordermade.domain.Member;
import ordermade.store.facade.MemberStore;
import ordermade.store.mapper.MemberMapper;
@Repository
public class MemberStoreLogic implements MemberStore{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insertMember(Member member) {
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return false;
	}

	@Override
	public boolean updateMember(Member member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Member selectMemberBy(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
