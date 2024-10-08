package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Request;

public interface RequestStore {
	
	public boolean insertRequest(Request request);
	public boolean updateRequestById(Request request);
	public boolean updateRequestByIdForPayment(String requestId, String payment);
	public boolean deleteRequestById(String id);
	public Request selectRequestById(String id); 
	public List<Request> selectRequestsByBound(String bound, String begin, String end);
	public int selectRowsByBound(String bound);
	public List<Request> selectRequestsByBoundAndTitle(String bound, String title, String begin, String end);
	public List<Request> selectRequestsByBoundAndContent(String bound, String content, String begin, String end);
	public List<Request> selectRequestsByConsumerId(String consumerId, String begin, String end);
	public int selectRowsByConsumerId(String consumerId);
	public List<Request> selectRequestsByConsumerIdWithMaker(String consumerId, String begin, String end);
	public int selectRowsByConsumerIdWithMaker(String consumerId);
	public List<Request> selectRequestsByConsumerIdWithPayment(String consumerId, String begin, String end);
	public int selectRowsByConsumerIdWithPayment(String consumerId);
//	public List<Request> selectRequestsByMakerId(String makerId, String begin, String end);
	public List<Request> selectRequestsByMakerIdExceptPayment(String makerId, String begin, String end);
	public int selectRowsByMakerIdExceptPayment(String makerId);
	public List<Request> selectRequestsByMakerIdWithPayment(String makerId, String begin, String end);
	public int selectRowsByMakerIdWithPayment(String makerId);
}
