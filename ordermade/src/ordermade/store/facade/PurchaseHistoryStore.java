package ordermade.store.facade;

import java.util.List;

import ordermade.domain.PurchaseHistory;

public interface PurchaseHistoryStore {

	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryByIdForDelivery(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryByRequestIdForPayment(String requestId, String payment);
	public PurchaseHistory selectPurchseHistoryById(String id);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(String consumerId, String page);
	public int selectRowsPurchaseHistoriesByConsumerId(String consumerId);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId, String requestTitle, String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(String makerId, String page);
	public int selectRowsPurchaseHistoriesByMakerId(String makerId);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String title, String page);

}
