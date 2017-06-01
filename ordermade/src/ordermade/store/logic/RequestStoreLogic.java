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
	public boolean updateReqeustById(Request request) {
		SqlSession session = factory.openSession();
		boolean result = false;
		
		try{
			RequestMapper mapper= session.getMapper(RequestMapper.class);
			if(result=mapper.updateReqeustById(request)){
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
	public List<Request> selectRequestsByBound(String bound, String page) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByBound(bound, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByBoundAndTitle(String bound, String title, String page) {
		SqlSession session = factory.openSession();
		List<Request> list = null;


		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByBoundAndTitle(bound, title, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByBoundAndContent(String bound, String content, String page) {
		SqlSession session = factory.openSession();
		List<Request> list = null;

		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByBoundAndContent(bound, content, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByConsumerId(String consumerId, String page) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByConsumerId(consumerId, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByConsumerIdWithMaker(String consumerId, String page) {
		SqlSession session = factory.openSession();
		List<Request> list = null;

		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByConsumerIdWithMaker(consumerId, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByConsumerIdWithPayment(String consumerId, String page) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByConsumerIdWithPayment(consumerId, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByMakerId(String makerId, String page) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByMakerId(makerId, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Request> selectRequestsByMakerIdWithPayment(String makerId, String page) {
		SqlSession session = factory.openSession();
		List<Request> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectRequestsByMakerIdWithPayment(makerId, page);
		} finally {
			session.close();
		}
		return list;
	}


	
}
