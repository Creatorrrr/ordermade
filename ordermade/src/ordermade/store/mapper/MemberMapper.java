package ordermade.store.mapper;

import ordermade.domain.Member;

public interface MemberMapper {
	public int insertMember(Member member);

	public int updateMember(Member member);

	public int deleteMember(String id);

	public Member selectMemberById(String id);
}
