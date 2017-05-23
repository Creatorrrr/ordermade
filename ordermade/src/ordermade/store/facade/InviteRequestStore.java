package ordermade.store.facade;

import java.util.List;

import ordermade.domain.InviteRequest;

public interface InviteRequestStore {
	
	public boolean insertInviteRequest(InviteRequest inviteRequest);
	public boolean deleteInviteRequestById(String id);
	public boolean deleteInviteRequestsByRequestId(String requestId);
	public List<InviteRequest> selectInviteRequestsByMakerId(String makerId, String begin, String end);
	public List<InviteRequest> selectInviteRequestsByConsumerId(String consumerId, String begin, String end);
}
