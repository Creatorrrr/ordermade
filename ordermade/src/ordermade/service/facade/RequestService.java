package ordermade.service.facade;

import java.util.List;

import ordermade.domain.Attach;
import ordermade.domain.Comment;
import ordermade.domain.InviteRequest;
import ordermade.domain.Request;

public interface RequestService {
	public boolean registerRequest(Request request);

	public boolean modifyRequestById(Request request);

	public boolean removeRequestById(String id);

	public Request findRequestById(String id);

	public List<Request> findRequestByBound(String bound, String page);

	public List<Request> findRequestByBoundAndTitle(String bound, String title, String page);

	public List<Request> findRequestByBoundAndContent(String bound, String content, String page);

	public List<Request> findRequestByConsumerId(String consumerId, String page);

	public List<Request> findRequestByConsumerIdWithMakerId(String consumerId, String makerId, String page);

	public List<Request> findRequestByConsumerIdWithPayment(String inconsumerId, String page);

	public boolean registerInviteRequest(InviteRequest inviteRequest);

	public boolean removeInviteRequestById(String id);

	public boolean removeInviteRequestByRequestId(String requestId);

	public List<InviteRequest> findInviteRequestsByMakerId(String MakerId, String page);

	public List<InviteRequest> findInviteRequestsByConsumerId(String consumerId, String page);

	public boolean registerComment(Comment comment);

	public boolean modifyCommentById(Comment comment);

	public boolean removeCommentById(String id);

	public List<Comment> findCommentsByRequestId();

	public boolean registerAttach(Attach attach);

	public boolean removeAttachById(String id);

	public List<Attach> findAllAttachsByRequestId(String requestId, String page);

	public List<Attach> findAttachsByFileNameAndRequestId(String fileName, String requestId, String page);

}
