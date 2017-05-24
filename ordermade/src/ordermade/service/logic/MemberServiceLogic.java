package ordermade.service.logic;

import ordermade.domain.Member;
import ordermade.service.facade.MemberService;
import ordermade.store.facade.MemberStore;
import ordermade.store.logic.MemberStoreLogic;

public class MemberServiceLogic implements MemberService{

	private MemberStore store;
	
	public MemberServiceLogic() {
		store = new MemberStoreLogic();
	}
	@Override
	public boolean registerMember(Member member) {
		return store.insertMember(member);
	}

	@Override
	public boolean modifyMemberById(Member member) {
		return store.updateMember(member);
	}

	@Override
	public boolean removeMemberById(String id) {
		return store.deleteMember(id);
	}

	@Override
	public Member findMemberById(String id) {
		return store.selectMemberBy(id);
	}

}
