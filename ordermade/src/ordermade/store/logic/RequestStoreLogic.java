package ordermade.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.constants.Constants;
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
			//--------pagefix
			double length = list.size()* 1.0;
			int pageNum = (int)Math.ceil(length/Constants.REQUEST_ROW_SIZE);
			System.out.println(pageNum);
			int index = 0 ;
			int start = (Integer.parseInt(page)-1)*Constants.REQUEST_ROW_SIZE;	//0*10=0 , 1*10=10
			int end = Integer.parseInt(page)*Constants.REQUEST_ROW_SIZE;		//1*10=10, 2*10=20
			for(Request request : list){//page bug 수정
				//페이지 만큼 불러주기
				//1페이지 일때0-9, 2페이지 일떄 10-19 내의 데이터만 불러옴
				if(start <= index && index < end){
					//System.out.println(pageNum+"");
					request.setPage(pageNum+"");//총페이지 수
				}
				//System.out.println(index);
				index++;
			}//--------
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
			list = mapper.selectRequestsByMakerIdWithPayment(makerId, page);//모든것을 데이터를 불러옴.
			//--------pagefix
			double length = list.size()* 1.0;
			int pageNum = (int)Math.ceil(length/Constants.REQUEST_ROW_SIZE);
			int index = 0 ;
			int start = (Integer.parseInt(page)-1)*Constants.REQUEST_ROW_SIZE;	//0*10=0 , 1*10=10
			int end = Integer.parseInt(page)*Constants.REQUEST_ROW_SIZE;		//1*10=10, 2*10=20
			for(Request request : list){//page bug 수정
				//페이지 만큼 불러주기
				//1페이지 일때0-9, 2페이지 일떄 10-19 내의 데이터만 불러옴
				if(start <= index && index < end){
					//System.out.println(pageNum+"");
					request.setPage(pageNum+"");//총페이지 수
				}
				//System.out.println(index);
				index++;
			}//--------
		} finally {
			session.close();
		}
		return list;
	}


	
}
