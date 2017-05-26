package ordermade.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ordermade.domain.Attach;
import ordermade.store.facade.AttachStore;
import ordermade.store.mapper.AttachMapper;

@Repository
public class AttachStoreLogic implements AttachStore{
	
	private SqlSession session;
	
	public AttachStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	@Override
	public boolean insertAttach(Attach attach) {
		
		boolean check = false;
		
		try {
			AttachMapper mapper = session.getMapper(AttachMapper.class);
			check = mapper.insertAttach(attach);
			session.commit();
		} finally {
			session.close();
		}
		
		return check;
	}

	@Override
	public boolean deleteAttachById(String id) {
		boolean check = false;
		try {
			AttachMapper mapper = session.getMapper(AttachMapper.class);
			check = mapper.deleteAttachById(id);
			session.commit();
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public List<Attach> selectAllAttachsByRequestId(String requestId, String page) {
		List<Attach> attachList = new ArrayList<>();
		try {
			AttachMapper mapper = session.getMapper(AttachMapper.class);
			attachList = mapper.selectAllAttachsByRequestId(requestId, page);
		} finally {
			session.close();
		}
		return attachList;
	}

	@Override
	public List<Attach> selectAttachsByFileNameAndRequestId(String fileName, String requestId, String page) {
		List<Attach> attachList = new ArrayList<>();
		try {
			AttachMapper mapper = session.getMapper(AttachMapper.class);
			attachList = mapper.selectAttachsByFileNameAndRequestId(fileName, requestId, page);
		} finally {
			session.close();
		}
		return attachList;
	}

}
