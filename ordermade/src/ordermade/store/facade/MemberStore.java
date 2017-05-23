package ordermade.store.facade;

import ordermade.domain.Member;

public interface MemberStore {
	public boolean insertMember(Member member);

	public boolean updateMember(Member member);

	public boolean deleteMember(String id);

	public Member selectMemberById(String id);
}
