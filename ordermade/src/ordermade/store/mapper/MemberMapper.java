package ordermade.store.mapper;

import ordermade.domain.Member;

public interface MemberMapper {
	public boolean insertMember(Member member);

	public boolean updateMember(Member member);

	public boolean deleteMember(String id);

	public Member selectMemberBy(String id);
}
