package ordermade.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ordermade.domain.InviteRequest;
import ordermade.store.facade.InviteRequestStore;
import ordermade.store.mapper.InviteRequestMapper;

public class InviteRequestStoreLogic implements InviteRequestStore {

	private SqlSessionFactory factory;

	public InviteRequestStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public boolean insertInviteRequest(InviteRequest inviteRequest) {

		SqlSession session = factory.openSession();
		boolean check = false;

		InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);

		try {
			if (check = mapper.insertInviteRequest(inviteRequest) == true) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return check;

		// check = mapper.insertInviteRequest(inviteRequest);
		// if(check ==true){
		// session.commit();
		// }else {
		// session.close();
		// }
		// return check;
	}

	@Override
	public boolean deleteInviteRequestById(String id) {

		SqlSession session = factory.openSession();
		boolean check = false;

		HashMap<String, String> map = new HashMap<>();

		return false;
	}

	@Override // 의뢰서가 참가가 완료되었을 때 그 에 해당되는 모든 참가요청을 다 지움
	public boolean deleteInviteRequestsByRequestId(String requestId) {

		SqlSession session = factory.openSession();
		boolean check = false;
		
		try{
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			if(check = mapper.deleteInviteRequestsByRequestId(requestId)){
				session.commit();
			}else{
				session.rollback();
			}
		}finally{
			session.close();
		}
		return check;
	}

	@Override
	public List<InviteRequest> selectInviteRequestsByMakerId(String makerId, String begin, String end) {

		SqlSession session = factory.openSession();
		List<InviteRequest> list = null;

		HashMap<String, String> map = new HashMap();
		map.put("makerId",makerId);
		map.put("begin", begin);
		map.put("end", end);
		
		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			list = mapper.selectInviteRequestsByMakerId(map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<InviteRequest> selectInviteRequestsByConsumerId(String consumerId, String begin, String end) {

		SqlSession session = factory.openSession();
		List<InviteRequest> list = null;
		
		HashMap<String, String> map = new HashMap();
		map.put("consumerId",consumerId);
		map.put("begin", begin);
		map.put("end", end);

		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			list = mapper.selectInviteRequestsByConsumerId(map);
		} finally {
			session.close();
		}
		return list;
	}

}
