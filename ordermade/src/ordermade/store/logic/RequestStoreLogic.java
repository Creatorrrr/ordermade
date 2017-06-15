package ordermade.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.Request;
import ordermade.store.facade.RequestStore;
import ordermade.store.mapper.RequestMapper;

@Repository
public class RequestStoreLogic implements RequestStore {

	private SqlSessionFactory factory;

	public RequestStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public boolean insertRequest(Request request) {

		SqlSession session = factory.openSession();
		boolean result = false;

		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			if (result = mapper.insertRequest(request) == true) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public boolean updateRequestById(Request request) {
		SqlSession session = factory.openSession();
		boolean result = false;
		
		try{
			RequestMapper mapper= session.getMapper(RequestMapper.class);
			if(result=mapper.updateRequestById(request)){
				session.commit();
			}else{
				session.rollback();
			}
			return result;
		}finally{
				session.close();
		}
	}
	
	@Override
	public boolean updateRequestByIdForPayment(String requestId, String payment) {
		SqlSession session = factory.openSession();
		boolean result = false;
		
		try{
			RequestMapper mapper= session.getMapper(RequestMapper.class);
			if(result=mapper.updateRequestByIdForPayment(requestId, payment)){
				session.commit();
			}else{
				session.rollback();
			}
			return result;
		}finally{
				session.close();
		}
	}

	@Override
	public boolean deleteRequestById(String id) {
		SqlSession session = factory.openSession();
		boolean result = false;

		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			if (result = mapper.deleteRequestById(id) == true) {
				session.commit();
			} else {
				session.rollback();
			} return result;
		} finally {
			session.close();
		}
	}

	@Override
	public Request selectRequestById(String id) {
		SqlSession session = factory.openSession();
		Request request = null;

		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			request = mapper.selectRequestById(id);
		} finally {
			session.close();
		}
		return request;
	}
	
	@Override
	public List<Request> selectRequestsByBound(String bound, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("bound", bound);
		map.put("begin", begin);
		map.put("end", end);
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByBound(map);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int selectRowsByBound(String bound) {
		SqlSession session = factory.openSession();
		int rows = 0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			rows = mapper.selectRowsByBound(bound);
		} finally {
			session.close();
		}
		return rows;
	}

	@Override
	public List<Request> selectRequestsByBoundAndTitle(String bound, String title, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("bound", bound);
		map.put("title", title);
		map.put("begin", begin);
		map.put("end", end);

		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByBoundAndTitle(map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByBoundAndContent(String bound, String content, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("bound", bound);
		map.put("content", content);
		map.put("begin", begin);
		map.put("end", end);
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByBoundAndContent(map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByConsumerId(String consumerId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("consumerId", consumerId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByConsumerId(map);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int selectRowsByConsumerId(String consumerId) {
		SqlSession session = factory.openSession();
		int rows = 0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			rows = mapper.selectRowsByConsumerId(consumerId);
		} finally {
			session.close();
		}
		return rows;
	}

	@Override
	public List<Request> selectRequestsByConsumerIdWithMaker(String consumerId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("consumerId", consumerId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByConsumerIdWithMaker(map);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int selectRowsByConsumerIdWithMaker(String consumerId) {
		SqlSession session = factory.openSession();
		int rows = 0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			rows = mapper.selectRowsByConsumerIdWithMaker(consumerId);
		} finally {
			session.close();
		}
		return rows;
	}

	@Override
	public List<Request> selectRequestsByConsumerIdWithPayment(String consumerId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("consumerId", consumerId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByConsumerIdWithPayment(map);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int selectRowsByConsumerIdWithPayment(String consumerId) {
		SqlSession session = factory.openSession();
		int rows = 0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			rows = mapper.selectRowsByConsumerIdWithPayment(consumerId);
		} finally {
			session.close();
		}
		return rows;
	}

//	@Override
//	public List<Request> selectRequestsByMakerId(String makerId, String begin, String end) {
//		SqlSession session = factory.openSession();
//		List<Request> list = null;
//		HashMap<String, String> map = new HashMap<>();
//		map.put("makerId", makerId);
//		map.put("begin", begin);
//		map.put("end", end);
//		try {
//			RequestMapper mapper = session.getMapper(RequestMapper.class);
//			list = mapper.selectRequestsByMakerId(map);
//		} finally {
//			session.close();
//		}
//		return list;
//	}
	
	@Override
	public List<Request> selectRequestsByMakerIdExceptPayment(String makerId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("makerId", makerId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByMakerIdExceptPayment(map);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int selectRowsByMakerIdExceptPayment(String makerId) {
		SqlSession session = factory.openSession();
		int rows = 0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			rows = mapper.selectRowsByMakerIdExceptPayment(makerId);
		} finally {
			session.close();
		}
		return rows;
	}

	@Override
	public List<Request> selectRequestsByMakerIdWithPayment(String makerId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("makerId", makerId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByMakerIdWithPayment(map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int selectRowsByMakerIdWithPayment(String makerId) {
		SqlSession session = factory.openSession();
		int rows = 0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			rows = mapper.selectRowsByMakerIdWithPayment(makerId);
		} finally {
			session.close();
		}
		return rows;
	}
	
}
