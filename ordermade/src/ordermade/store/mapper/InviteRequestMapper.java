package ordermade.store.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.InviteRequest;

public interface InviteRequestMapper {

	public boolean insertInviteRequest(InviteRequest inviteRequest);
	public boolean deleteInviteRequestById(String id);
	public boolean deleteInviteRequestsByRequestId(String requestId);
	public List<InviteRequest> selectInviteRequestsByMakerId(@Param("makerId")String makerId, @Param("page")String page);
	public List<InviteRequest> selectInviteRequestsByConsumerId(@Param("consumerId")String consumerId, @Param("page")String page);
}
