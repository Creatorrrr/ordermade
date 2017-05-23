package ordermade.store.mapper;

import java.util.HashMap;
import java.util.List;

import ordermade.domain.Request;

public interface RequestMapper {

	public boolean insertRequest(Request request);
	public boolean updateReqeust(Request request);
	public boolean deleteRequest(String id);
	public Request selectRequestById(String id); 
	public List<Request> selectRequestsByBound(HashMap<String , String> map);
	public List<Request> selectRequestsByBoundAndTitle(HashMap<String , String> map);
	public List<Request> selectRequestsByBoundAndContent(HashMap<String , String> map);
	public List<Request> selectRequestsByConsumerId(HashMap<String , String> map);
	public List<Request> selectRequestsByConsumerIdWithMaker(HashMap<String , String> map);
	public List<Request> selectRequestsByConsumerIdWithPayment(HashMap<String , String> map);
}
