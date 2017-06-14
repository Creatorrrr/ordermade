package ordermade.service.facade;

import java.util.List;

import ordermade.domain.Attach;
import ordermade.domain.Comment;
import ordermade.domain.InviteRequest;
import ordermade.domain.Request;

public interface RequestService {
	public boolean registerRequest(Request request);
	public boolean modifyRequestById(Request request);
	public boolean modifyRequestByIdForPayment(String requestId, String payment);
	public boolean removeRequestById(String id);
	public Request findRequestById(String id);
	public List<Request> findRequestsByBound(String bound, String page);
	public List<Request> findRequestsByBoundAndTitle(String bound, String title, String page);
	public List<Request> findRequestsByBoundAndContent(String bound, String content, String page);
	public List<Request> findRequestsByConsumerId(String consumerId, String page);
	public int findRowsByConsumerId(String consumerId);
	public List<Request> findRequestsByConsumerIdWithMaker(String consumerId, String page);
	public List<Request> findRequestsByConsumerIdWithPayment(String consumerId, String page);
	public List<Request> findRequestsByMakerId(String makerId, String page);
	public List<Request> findRequestsByMakerIdExceptPayment(String makerId, String page);
	public List<Request> findRequestsByMakerIdWithPayment(String makerId, String page);
	public boolean registerInviteRequest(InviteRequest inviteRequest);
	public boolean removeInviteRequestById(String id);
	public boolean removeInviteRequestByRequestId(String requestId);
	public List<InviteRequest> findInviteRequestsByMakerId(String makerId, String form, String page);
	public List<InviteRequest> findInviteRequestsByConsumerId(String consumerId, String form, String page);
	public boolean registerComment(Comment comment);
	public boolean modifyCommentById(Comment comment);
	public boolean removeCommentById(String id);
	public List<Comment> findCommentsByRequestId(String requestId,String page);
	public boolean registerAttach(Attach attach);
	public boolean removeAttachById(String id);
	public List<Attach> findAllAttachsByRequestId(String requestId, String page);
	public List<Attach> findAttachsByFileNameAndRequestId(String fileName, String requestId, String page);

}
