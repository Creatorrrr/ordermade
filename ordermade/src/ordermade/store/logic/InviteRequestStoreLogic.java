package ordermade.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.InviteRequest;
import ordermade.store.facade.InviteRequestStore;
import ordermade.store.mapper.InviteRequestMapper;

@Repository
public class InviteRequestStoreLogic implements InviteRequestStore {

	private SqlSessionFactory factory;

	public InviteRequestStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public boolean insertInviteRequest(InviteRequest inviteRequest) {

		SqlSession session = factory.openSession();
		boolean check = false;

		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			check = mapper.insertInviteRequest(inviteRequest);
			if (check) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean deleteInviteRequestById(String id) {

		SqlSession session = factory.openSession();
		boolean check = false;

		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			check = mapper.deleteInviteRequestById(id);
			if (check) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return check;
	}

	@Override // �쓽猶곗꽌媛� 李멸�媛� �셿猷뚮릺�뿀�쓣 �븣 洹� �뿉 �빐�떦�릺�뒗 紐⑤뱺 李멸��슂泥��쓣 �떎 吏���
	public boolean deleteInviteRequestsByRequestId(String requestId) {

		SqlSession session = factory.openSession();
		boolean check = false;

		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			check = mapper.deleteInviteRequestsByRequestId(requestId);
			if (check) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public List<InviteRequest> selectInviteRequestsByMakerId(String makerId, String begin, String end) {

		SqlSession session = factory.openSession();
		List<InviteRequest> list = null;

		HashMap<String, String> map = new HashMap();
		map.put("makerId", makerId);
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

		HashMap<String, String> map = new HashMap<>();
		map.put("consumerId", consumerId);
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
