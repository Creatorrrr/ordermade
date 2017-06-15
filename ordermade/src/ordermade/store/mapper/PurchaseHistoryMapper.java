package ordermade.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.PurchaseHistory;

public interface PurchaseHistoryMapper {

	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryByIdForDelivery(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryByRequestIdForPayment(@Param("requestId")String requestId, @Param("payment")String payment);
	public PurchaseHistory selectPurchseHistoryById(String id);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(@Param("consumerId")String consumerId, @Param("page")String page);
	public int selectRowsPurchaseHistoriesByConsumerId(@Param("consumerId")String consumerId);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(@Param("consumerId")String consumerId, @Param("title")String requestTitle, @Param("page")String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(@Param("makerId")String makerId, @Param("page")String page);
	public int selectRowsPurchaseHistoriesByMakerId(@Param("makerId")String makerId);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerIdAndRequestTitle(@Param("makerId")String makerId, @Param("title")String title, @Param("page")String page);


}