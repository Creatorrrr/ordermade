package ordermade.store.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import ordermade.domain.Attach;

public interface AttachMapper {
	
	public boolean insertAttach(Attach attach);
	public boolean deleteAttachById(Attach attach);
	public List<Attach> selectAllAttachsByRequestId(@RequestParam("requestId") String requestId, @RequestParam("page") String page);
	public List<Attach> selectAttachsByFileNameAndRequestId(@RequestParam("fileName") String fileName, @RequestParam("requestId") String requestId, @RequestParam("page") String page);

}
