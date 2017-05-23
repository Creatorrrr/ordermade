package ordermade.service.facade;

import ordermade.domain.Member;

public interface MemberService {
	public boolean registerMember(Member member);

	public boolean modifyMemberById(Member member);

	public boolean removeMemberById(String id);

	public Member findMemberById(String id);
}
