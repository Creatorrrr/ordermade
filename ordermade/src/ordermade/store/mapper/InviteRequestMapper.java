package ordermade.store.mapper;

import java.util.HashMap;
import java.util.List;

import ordermade.domain.InviteRequest;

public interface InviteRequestMapper {

	public boolean insertInviteRequest(InviteRequest inviteRequest);
	public boolean deleteInviteRequestById(String id);
	public boolean deleteInviteRequestsByRequestId(String requestId);
	public List<InviteRequest> selectInviteRequestsByMakerId(HashMap<String , String> map);
	public List<InviteRequest> selectInviteRequestsByConsumerId(HashMap<String , String> map);
}
