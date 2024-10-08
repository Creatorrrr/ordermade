package ordermade.store.logic;

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
	public List<InviteRequest> selectInviteRequestsByMakerId(String makerId, String form, String page) {
		SqlSession session = factory.openSession();
		List<InviteRequest> list = null;
		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			list = mapper.selectInviteRequestsByMakerId(makerId, form, page);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int selectRowsInviteRequestsByMakerId(String makerId, String form) {
		SqlSession session = factory.openSession();
		int rows = 0;
		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			rows = mapper.selectRowsInviteRequestsByMakerId(makerId, form);
		} finally {
			session.close();
		}
		return rows;
	}

	@Override
	public List<InviteRequest> selectInviteRequestsByConsumerId(String consumerId, String form, String page) {
		SqlSession session = factory.openSession();
		List<InviteRequest> list = null;
		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			list = mapper.selectInviteRequestsByConsumerId(consumerId, form, page);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int selectRowsInviteRequestsByConsumerId(String consumerId, String form) {
		SqlSession session = factory.openSession();
		int rows = 0;
		try {
			InviteRequestMapper mapper = session.getMapper(InviteRequestMapper.class);
			rows = mapper.selectRowsInviteRequestsByConsumerId(consumerId, form);
		} finally {
			session.close();
		}
		return rows;
	}

}
