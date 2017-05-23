package ordermade.store.mapper;

import ordermade.domain.Member;

public interface MemberMapper {
	public int insertMember(Member member);

	public int updateMemberById(Member member);

	public int deleteMemberById(String id);

	public Member selectMemberById(String id);
}
