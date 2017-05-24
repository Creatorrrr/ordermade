package ordermade.service.logic;

import java.util.List;

import ordermade.domain.Attach;
import ordermade.domain.Comment;
import ordermade.domain.InviteRequest;
import ordermade.domain.Request;
import ordermade.service.facade.RequestService;

public class RequestServiceLogic implements RequestService{

	@Override
	public boolean registerRequest(Request request) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyRequestById(Request request) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeRequestById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Request findRequestById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Request> findRequestByBound(String bound, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Request> findRequestByBoundAndTitle(String bound, String title, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Request> findRequestByBoundAndContent(String bound, String content, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Request> findRequestByConsumerId(String consumerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Request> findRequestByConsumerIdWithMakerId(String consumerId, String makerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Request> findRequestByConsumerIdWithPayment(String inconsumerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean registerInviteRequest(InviteRequest inviteRequest) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeInviteRequestById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeInviteRequestByRequestId(String requestId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<InviteRequest> findInviteRequestsByMakerId(String MakerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InviteRequest> findInviteRequestsByConsumerId(String consumerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean registerComment(Comment comment) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyCommentById(Comment comment) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeCommentById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Comment> findCommentsByRequestId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean registerAttach(Attach attach) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeAttachById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Attach> findAllAttachsByRequestId(String requestId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Attach> findAttachsByFileNameAndRequestId(String fileName, String requestId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

}
