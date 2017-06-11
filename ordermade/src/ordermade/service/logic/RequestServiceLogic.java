package ordermade.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.constants.Constants;
import ordermade.domain.Attach;
import ordermade.domain.Comment;
import ordermade.domain.InviteRequest;
import ordermade.domain.Request;
import ordermade.service.facade.RequestService;
import ordermade.store.facade.AttachStore;
import ordermade.store.facade.CommentStore;
import ordermade.store.facade.InviteRequestStore;
import ordermade.store.facade.RequestStore;

@Service
public class RequestServiceLogic implements RequestService{

	@Autowired
	private RequestStore rStore;
	@Autowired
	private InviteRequestStore irStore;
	@Autowired
	private CommentStore cStore;
	@Autowired
	private AttachStore aStore;
	
	@Override
	public boolean registerRequest(Request request) {
		return rStore.insertRequest(request);
	}

	@Override
	public boolean modifyRequestById(Request request) {
		return rStore.updateRequestById(request);
	}
	
	@Override
	public boolean modifyRequestByIdForPayment(String requestId, String payment) {
		return rStore.updateRequestByIdForPayment(requestId, payment);
	}

	@Override
	public boolean removeRequestById(String id) {
		return rStore.deleteRequestById(id);
	}

	@Override
	public Request findRequestById(String id) {
		return rStore.selectRequestById(id);
	}

	@Override
	public List<Request> findRequestsByBound(String bound, String page) {
		return rStore.selectRequestsByBound(bound, getRequestBegin(page),getRequestEnd(page));
	}

	@Override
	public List<Request> findRequestsByBoundAndTitle(String bound, String title, String page) {
		return rStore.selectRequestsByBoundAndTitle(bound, title, getRequestBegin(page),getRequestEnd(page));
	}

	@Override
	public List<Request> findRequestsByBoundAndContent(String bound, String content, String page) {
		return rStore.selectRequestsByBoundAndContent(bound, content, getRequestBegin(page),getRequestEnd(page));
	}

	@Override
	public List<Request> findRequestsByConsumerId(String consumerId, String page) {
		return rStore.selectRequestsByConsumerId(consumerId, getRequestBegin(page),getRequestEnd(page));
	}

	@Override
	public List<Request> findRequestsByConsumerIdWithMaker(String consumerId, String page) {
		return rStore.selectRequestsByConsumerIdWithMaker(consumerId, getRequestBegin(page),getRequestEnd(page));
	}

	@Override
	public List<Request> findRequestsByConsumerIdWithPayment(String consumerId, String page) {
		return rStore.selectRequestsByConsumerIdWithPayment(consumerId, getRequestBegin(page),getRequestEnd(page));
	}

	@Override
	public List<Request> findRequestsByMakerId(String makerId, String page) {
		return rStore.selectRequestsByMakerId(makerId, getRequestBegin(page),getRequestEnd(page));
	}
	
	@Override
	public List<Request> findRequestsByMakerIdExceptPayment(String makerId, String page) {
		return rStore.selectRequestsByMakerIdExceptPayment(makerId, getRequestBegin(page),getRequestEnd(page));
	}

	@Override
	public List<Request> findRequestsByMakerIdWithPayment(String makerId, String page) {
		return rStore.selectRequestsByMakerIdWithPayment(makerId, getRequestBegin(page),getRequestEnd(page));
	}
	
	@Override
	public boolean registerInviteRequest(InviteRequest inviteRequest) {
		return irStore.insertInviteRequest(inviteRequest);
	}

	@Override
	public boolean removeInviteRequestById(String id) {
		return irStore.deleteInviteRequestById(id);
	}

	@Override
	public boolean removeInviteRequestByRequestId(String requestId) {
		return irStore.deleteInviteRequestsByRequestId(requestId);
	}

	@Override
	public List<InviteRequest> findInviteRequestsByMakerId(String makerId, String form, String page) {
		return irStore.selectInviteRequestsByMakerId(makerId, form, page);
	}

	@Override
	public List<InviteRequest> findInviteRequestsByConsumerId(String consumerId, String form, String page) {
		return irStore.selectInviteRequestsByConsumerId(consumerId, form, page);
	}

	@Override
	public boolean registerComment(Comment comment) {
		return cStore.insertComment(comment);
	}

	@Override
	public boolean modifyCommentById(Comment comment) {
		return cStore.updateCommentById(comment);
	}

	@Override
	public boolean removeCommentById(String id) {
		return cStore.deleteCommentById(id);
	}

	@Override
	public List<Comment> findCommentsByRequestId(String requestId,String page) {
		return cStore.selectCommentsByRequestId(requestId, page);
	}

	@Override
	public boolean registerAttach(Attach attach) {
		return aStore.insertAttach(attach);
	}

	@Override
	public boolean removeAttachById(String id) {
		return aStore.deleteAttachById(id);
	}

	@Override
	public List<Attach> findAllAttachsByRequestId(String requestId, String page) {
		return aStore.selectAllAttachsByRequestId(requestId, page);
	}

	@Override
	public List<Attach> findAttachsByFileNameAndRequestId(String fileName, String requestId, String page) {
		return aStore.selectAttachsByFileNameAndRequestId(fileName, requestId, page);
	}

	private String getRequestBegin(String page) {
		return (Integer.parseInt(page) - 1) * Constants.REQUEST_ROW_SIZE + 1 + "";
	}
	
	private String getRequestEnd(String page) {
		return Integer.parseInt(page) * Constants.REQUEST_ROW_SIZE + "";
	}
	
}
