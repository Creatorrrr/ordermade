package ordermade.store.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.Request;

public interface RequestMapper {

	public boolean insertRequest(Request request);
	public boolean updateRequestById(Request request);
	public boolean updateRequestByIdForPayment(@Param("requestId")String requestId, @Param("payment")String payment);
	public boolean deleteRequestById(String id);
	public Request selectRequestById(String id); 
//	public List<Request> selectRequestsByBound(@Param("bound")String bound, @Param("page")String page);
//	public List<Request> selectRequestsByBoundAndTitle(@Param("bound")String bound, @Param("title")String title, @Param("page")String page);
//	public List<Request> selectRequestsByBoundAndContent(@Param("bound")String bound, @Param("content")String content, @Param("page")String page);
//	public List<Request> selectRequestsByConsumerId(@Param("consumerId")String consumerId, @Param("page")String page);
//	public List<Request> selectRequestsByConsumerIdWithMaker(@Param("consumerId")String consumerId, @Param("page")String page);
//	public List<Request> selectRequestsByConsumerIdWithPayment(@Param("consumerId")String consumerId, @Param("page")String page);
//	public List<Request> selectRequestsByMakerId(@Param("makerId")String makerId, @Param("page")String page);
//	public List<Request> selectRequestsByMakerIdWithPayment(@Param("makerId")String makerId, @Param("page")String page);

	public List<Request> selectRequestsByBound(HashMap<String, String> map);
	public int selectRowsByBound(String bound);
	public List<Request> selectRequestsByBoundAndTitle(HashMap<String, String> map);
	public List<Request> selectRequestsByBoundAndContent(HashMap<String, String> map);
	public List<Request> selectRequestsByConsumerId(HashMap<String, String> map);
	public int selectRowsByConsumerId(String consumerId);
	public List<Request> selectRequestsByConsumerIdWithMaker(HashMap<String, String> map);
	public int selectRowsByConsumerIdWithMaker(String consumerId);
	public List<Request> selectRequestsByConsumerIdWithPayment(HashMap<String, String> map);
	public int selectRowsByConsumerIdWithPayment(String consumerId);
//	public List<Request> selectRequestsByMakerId(HashMap<String, String> map);
	public List<Request> selectRequestsByMakerIdExceptPayment(HashMap<String, String> map);
	public int selectRowsByMakerIdExceptPayment(String makerId);
	public List<Request> selectRequestsByMakerIdWithPayment(HashMap<String, String> map);
	public int selectRowsByMakerIdWithPayment(String makerId);
}
