package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ordermade.domain.PurchaseHistory;
import ordermade.store.facade.PurchaseHistoryStore;
import ordermade.store.mapper.PortfolioMapper;
import ordermade.store.mapper.PurchaseHistoryMapper;

public class PurchaseHistoryStoreLogic implements PurchaseHistoryStore {
	
	private SqlSession session;
	
	public PurchaseHistoryStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}
	
	@Override
	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory) {
		try{
			PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
			boolean check = mapper.insertPurchaseHistory(purchaseHistory);
			session.commit();
			return check;
		
		} finally{
			session.close();
		}
	}

	@Override
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory) {
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		boolean check = mapper.updatePurchaseHistoryById(purchaseHistory);
		session.commit();
		return check;
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(String consumerId, String page) {
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		return mapper.selectPurchaseHistoriesByConsumerId(consumerId, page);
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId,
			String requestTitle, String page) {
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		return mapper.selectPurchaseHistoriesByConsumerIdAndRequestTitle(consumerId, requestTitle, page);
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(String makerId, String page) {
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		return mapper.selectPurchaseHistoriesByMakerId(makerId, page);
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String title, String page) {
		PurchaseHistoryMapper mapper = session.getMapper(PurchaseHistoryMapper.class);
		return mapper.selectPurchaseHistoriesByMakerIdAndRequestTitle(makerId, title, page);
	}

}
