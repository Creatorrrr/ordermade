package ordermade.store.mapper;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.Account;

public interface AccountMapper {

	public boolean insertAccountByMemberId(@Param("memberId")String memberId, @Param("money")int money);
	public boolean transaction(@Param("fromId")String fromId, @Param("toId")String toId, @Param("money")int money);
	public Account selectAccountById(String id);
	 
}
