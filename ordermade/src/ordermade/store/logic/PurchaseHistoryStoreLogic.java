package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import ordermade.domain.PurchaseHistory;
import ordermade.store.facade.PurchaseHistoryStore;
import ordermade.store.mapper.PurchaseHistoryMapper;

@Repository
public class PurchaseHistoryStoreLogic implements PurchaseHistoryStore {
	
	private SqlSessionFactory factory;
	
	public PurchaseHistoryStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory) {
		SqlSession session = factory.openSession();
		boolean result = false;
		try{
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			result = mapper.insertPurchaseHistory(purchaseHistory);
			if(result) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally{
			session.close();
		}
		return result;
	}
	
	@Override
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory) {
		SqlSession session = factory.openSession();
		boolean check = false;
		try {
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			check = mapper.updatePurchaseHistoryById(purchaseHistory);
			if(check){
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
	public PurchaseHistory selectPurchseHistoryById(String id) {
		SqlSession session = factory.openSession();
		PurchaseHistory purchaseHistory = null;
		try {
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			purchaseHistory = mapper.selectPurchseHistoryById(id);
		} finally {
			session.close();
		}
		return purchaseHistory;
	}
	
	

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(String consumerId, String page) {
		SqlSession session = factory.openSession();
		List<PurchaseHistory> list = null;
		try {
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			list = mapper.selectPurchaseHistoriesByConsumerId(consumerId, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId,
			String requestTitle, String page) {
		SqlSession session = factory.openSession();
		List<PurchaseHistory> list = null;
		try {
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			list = mapper.selectPurchaseHistoriesByConsumerIdAndRequestTitle(consumerId, requestTitle, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(String makerId, String page) {
		SqlSession session = factory.openSession();
		List<PurchaseHistory> list = null;
		
		try {
			System.out.println(makerId);
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			list = mapper.selectPurchaseHistoriesByMakerId(makerId, page);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String title, String page) {
		SqlSession session = factory.openSession();
		List<PurchaseHistory> list = null;
		
		try {
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			list = mapper.selectPurchaseHistoriesByMakerIdAndRequestTitle(makerId, title, page);
		} finally {
			session.close();
		}
		return list;
	}

}
