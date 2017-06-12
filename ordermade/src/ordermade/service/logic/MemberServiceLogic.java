package ordermade.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.constants.Constants;
import ordermade.domain.Member;
import ordermade.service.facade.MemberService;
import ordermade.store.facade.AccountStore;
import ordermade.store.facade.MemberStore;

@Service
public class MemberServiceLogic implements MemberService{
	@Autowired
	private MemberStore store;
	@Autowired
	private AccountStore aStore;
	
	@Override
	public boolean registerMember(Member member) {
		boolean result = store.insertMember(member);
		aStore.insertAccountByMemberId(member.getId(), Constants.INITIAL_MONEY);
		return result;
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
