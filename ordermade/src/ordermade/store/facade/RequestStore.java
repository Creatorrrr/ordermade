package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Request;

public interface RequestStore {
	
	public boolean insertRequest(Request request);
	public boolean updateReqeustById(Request request);
	public boolean deleteRequestById(String id);
	public Request selectRequestById(String id); 
	public List<Request> selectRequestsByBound(String bound,  String begin, String end);
	public List<Request> selectRequestsByBoundAndTitle(String bound, String title,  String begin, String end);
	public List<Request> selectRequestsByBoundAndContent(String bound, String content,  String begin, String end);
	public List<Request> selectRequestsByConsumerId(String consumerId,  String begin, String end);
	public List<Request> selectRequestsByConsumerIdWithMaker(String consumerId,  String begin, String end);
	public List<Request> selectRequestsByConsumerIdWithPayment(String consumerId, String begin, String end);
}
