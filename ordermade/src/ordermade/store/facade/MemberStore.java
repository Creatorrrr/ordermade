package ordermade.store.facade;

import ordermade.domain.Member;

public interface MemberStore {
	public boolean insertMember(Member member);

	public boolean updateMemberById(Member member);

	public boolean deleteMemberById(String id);

	public Member selectMemberById(String id);
}
