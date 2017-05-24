package ordermade.service.logic;

import java.util.List;

import ordermade.domain.Account;
import ordermade.domain.PurchaseHistory;
import ordermade.service.facade.DealService;

public class DealServiceLogic implements DealService{

	@Override
	public boolean modifyAccountById(Account account) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Account findAccountById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean registerPurchaseHistory(PurchaseHistory purchaseHistory) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyPurchaseHistoryById(PurchaseHistory purchaseHistory) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByConsumerId(String consumerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId,
			String requestTitle, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByMakerId(String makerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String requestTitle,
			String page) {
		// TODO Auto-generated method stub
		return null;
	}

}
