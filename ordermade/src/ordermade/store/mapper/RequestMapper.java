package ordermade.store.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.Request;

public interface RequestMapper {

	public boolean insertRequest(Request request);
	public boolean updateReqeustById(Request request);
	public boolean deleteRequestById(String id);
	public Request selectRequestById(String id); 
	public List<Request> selectRequestsByBound(@Param("bound")String bound, @Param("page")String page);
	public List<Request> selectRequestsByBoundAndTitle(@Param("bound")String bound, @Param("title")String title, @Param("page")String page);
	public List<Request> selectRequestsByBoundAndContent(@Param("bound")String bound, @Param("content")String content, @Param("page")String page);
	public List<Request> selectRequestsByConsumerId(@Param("consumerId")String consumerId, @Param("page")String page);
	public List<Request> selectRequestsByConsumerIdWithMaker(@Param("consumerId")String consumerId, @Param("page")String page);
	public List<Request> selectRequestsByConsumerIdWithPayment(@Param("consumerId")String inconsumerId, @Param("page")String page);
}
