package ordermade.service.facade;

import java.util.List;

import ordermade.domain.Account;
import ordermade.domain.PurchaseHistory;

public interface DealService {
	public boolean modifyAccountById(Account account);

	public Account findAccountById(String id);

	public boolean registerPurchaseHistory(PurchaseHistory purchaseHistory);

	public boolean modifyPurchaseHistoryById(PurchaseHistory purchaseHistory);
	
	public PurchaseHistory findPurchseHistoryById(String id);

	public List<PurchaseHistory> findpurchaseHistoriesByConsumerId(String consumerId, String page);

	public List<PurchaseHistory> findpurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId,
			String requestTitle, String page);

	public List<PurchaseHistory> findpurchaseHistoriesByMakerId(String makerId, String page);

	public List<PurchaseHistory> findpurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String requestTitle,
			String page);
}
