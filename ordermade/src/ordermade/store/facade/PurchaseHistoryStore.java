package ordermade.store.facade;

import java.util.List;

import ordermade.domain.PurchaseHistory;

public interface PurchaseHistoryStore {

	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory);
	public PurchaseHistory selectPurchseHistoryById(String id);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(String consumerId, String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId, String requestTitle, String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(String makerId, String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String title, String page);

}
