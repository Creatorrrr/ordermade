package ordermade.store.facade;

import java.util.List;

import ordermade.domain.InviteRequest;

public interface InviteRequestStore {
	
	public boolean insertInviteRequest(InviteRequest inviteRequest);
	public boolean deleteInviteRequestById(String id);
	public boolean deleteInviteRequestsByRequestId(String requestId);
	public List<InviteRequest> selectInviteRequestsByMakerId(String makerId, String form, String page);
	public int selectRowsInviteRequestsByMakerId(String makerId, String form);
	public List<InviteRequest> selectInviteRequestsByConsumerId(String consumerId, String form, String page);
	public int selectRowsInviteRequestsByConsumerId(String consumerId, String form);
}
