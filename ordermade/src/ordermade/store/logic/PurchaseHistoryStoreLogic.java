package ordermade.store.logic;

import java.util.List;

import ordermade.domain.PurchaseHistory;
import ordermade.store.facade.PurchaseHistoryStore;

public class PurchaseHistoryStoreLogic implements PurchaseHistoryStore {

	@Override
	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(String consumerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId,
			String requestTitle, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(String makerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PurchaseHistory> slelctPurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String title,
			String page) {
		// TODO Auto-generated method stub
		return null;
	}

}
