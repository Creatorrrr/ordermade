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
@Component
public class PurchaseHistoryStoreLogic implements PurchaseHistoryStore {
	
	private SqlSessionFactory factory;
	
	public PurchaseHistoryStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory) {
		SqlSession session = factory.openSession();
		//try{
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			boolean check = mapper.insertPurchaseHistory(purchaseHistory);
			session.commit();
			return check;
		
//		} finally{
//			session.close();
//		}
	}

	@Override
	public PurchaseHistory selectPurchseHistoryById(String id) {
		SqlSession session = factory.openSession();
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		PurchaseHistory purchaseHistory = mapper.selectPurchseHistoryById(id);
		return purchaseHistory;
	}
	
	@Override
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory) {
		SqlSession session = factory.openSession();
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		boolean check = mapper.updatePurchaseHistoryById(purchaseHistory);
		session.commit();
		return check;
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(String consumerId, String page) {
		SqlSession session = factory.openSession();
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		return mapper.selectPurchaseHistoriesByConsumerId(consumerId, page);
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId,
			String requestTitle, String page) {
		SqlSession session = factory.openSession();
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		return mapper.selectPurchaseHistoriesByConsumerIdAndRequestTitle(consumerId, requestTitle, page);
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(String makerId, String page) {
		SqlSession session = factory.openSession();
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		return mapper.selectPurchaseHistoriesByMakerId(makerId, page);
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String title, String page) {
		SqlSession session = factory.openSession();
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		return mapper.selectPurchaseHistoriesByMakerIdAndRequestTitle(makerId, title, page);
	}

}
