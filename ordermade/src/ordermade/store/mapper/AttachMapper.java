package ordermade.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.Attach;

public interface AttachMapper {
	
	public boolean insertAttach(Attach attach);
	public boolean deleteAttachById(String id);
	public List<Attach> selectAllAttachsByRequestId(@Param("requestId") String requestId, @Param("page") String page);
	public List<Attach> selectAttachsByFileNameAndRequestId(@Param("fileName") String fileName, @Param("requestId") String requestId, @Param("page") String page);

}