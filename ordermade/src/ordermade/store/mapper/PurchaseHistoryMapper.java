package ordermade.store.mapper;

import java.util.List;

import ordermade.domain.PurchaseHistory;

public interface PurchaseHistoryMapper {

	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(String consumerId, String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(String consumerId, String requestTitle, String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(String makerId, String page);
	public List<PurchaseHistory> slelctPurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String title, String page);


}
