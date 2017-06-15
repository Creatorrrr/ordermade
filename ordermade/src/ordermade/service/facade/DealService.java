package ordermade.service.facade;

import java.util.List;

import ordermade.domain.Account;
import ordermade.domain.PurchaseHistory;

public interface DealService {
	public boolean transactionToMaker(String requestId);
	
	public boolean transactionFromConsumer(String requestId);

	public Account findAccountById(String id);

	public boolean registerPurchaseHistory(PurchaseHistory purchaseHistory);

	public boolean modifyPurchaseHistoryById(PurchaseHistory purchaseHistory);

	public boolean modifyPurchaseHistoryByIdForDelivery(PurchaseHistory purchaseHistory);
	
	public PurchaseHistory findPurchseHistoryById(String id);

	public List<PurchaseHistory> findpurchaseHistoriesByConsumerId(String consumerId, String page);

	public int findRowsPurchaseHistoriesByConsumerId(String consumerId);

	public List<PurchaseHistory> findpurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId,
			String requestTitle, String page);

	public List<PurchaseHistory> findpurchaseHistoriesByMakerId(String makerId, String page);

	public int findRowsPurchaseHistoriesByMakerId(String makerId);

	public List<PurchaseHistory> findpurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String requestTitle,
			String page);
}
