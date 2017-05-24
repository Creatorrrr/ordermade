package ordermade.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.domain.Member;
import ordermade.service.facade.MemberService;
import ordermade.store.facade.MemberStore;
import ordermade.store.logic.MemberStoreLogic;

@Service
public class MemberServiceLogic implements MemberService{
	@Autowired
	private MemberStore store;
	
	@Override
	public boolean registerMember(Member member) {
		return store.insertMember(member);
	}

	@Override
	public boolean modifyMemberById(Member member) {
		return store.updateMemberById(member);
	}

	@Override
	public boolean removeMemberById(String id) {
		return store.deleteMemberById(id);
	}

	@Override
	public Member findMemberById(String id) {
		return store.selectMemberById(id);
	}

}
