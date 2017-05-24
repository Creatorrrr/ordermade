package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Attach;

public interface AttachStore {
	
	public boolean insertAttach(Attach attach);
	public boolean deleteAttachById(Attach attach);
	public List<Attach> selectAllAttachsByRequestId(String requestId, String page);
	public List<Attach> selectAttachsByFileNameAndRequestId(String fileName, String requestId, String page);
	
}
