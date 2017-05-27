package ordermade.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.Attach;
import ordermade.store.facade.AttachStore;
import ordermade.store.mapper.AttachMapper;

@Repository
public class AttachStoreLogic implements AttachStore{
	
	private SqlSessionFactory factory;
	
	public AttachStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public boolean insertAttach(Attach attach) {
		SqlSession session = factory.openSession();
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
		SqlSession session = factory.openSession();
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
		SqlSession session = factory.openSession();
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
		SqlSession session = factory.openSession();
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
