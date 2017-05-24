package ordermade.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import ordermade.domain.Account;
import ordermade.domain.PurchaseHistory;
import ordermade.service.facade.DealService;
import ordermade.store.facade.AccountStore;
import ordermade.store.facade.PurchaseHistoryStore;

public class DealServiceLogic implements DealService{
	
	@Autowired
	private AccountStore accountStore;
	
	@Autowired
	private PurchaseHistoryStore purchaseHistoryStore;

	@Override
	public boolean modifyAccountById(Account account) {
		return accountStore.updateAccountById(account);
	}

	@Override
	public Account findAccountById(String id) {
		return accountStore.selectAccountById(id);
	}

	@Override
	public boolean registerPurchaseHistory(PurchaseHistory purchaseHistory) {
		return purchaseHistoryStore.insertPurchaseHistory(purchaseHistory);
	}

	@Override
	public boolean modifyPurchaseHistoryById(PurchaseHistory purchaseHistory) {
		return purchaseHistoryStore.updatePurchaseHistoryById(purchaseHistory);
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByConsumerId(String consumerId, String page) {
		return purchaseHistoryStore.selectPurchaseHistoriesByConsumerId(consumerId, page);
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId,
			String requestTitle, String page) {
		return purchaseHistoryStore.selectPurchaseHistoriesByConsumerIdAndRequestTitle(consumerId, requestTitle, page);
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByMakerId(String makerId, String page) {
		return purchaseHistoryStore.selectPurchaseHistoriesByMakerId(makerId, page);
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String requestTitle,
			String page) {
		return purchaseHistoryStore.selectPurchaseHistoriesByMakerIdAndRequestTitle(makerId, requestTitle, page);
	}

}
