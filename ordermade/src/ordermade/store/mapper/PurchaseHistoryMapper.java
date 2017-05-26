package ordermade.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import ordermade.domain.PurchaseHistory;

public interface PurchaseHistoryMapper {

	public boolean insertPurchaseHistory(PurchaseHistory purchaseHistory);
	public boolean updatePurchaseHistoryById(PurchaseHistory purchaseHistory);
	public PurchaseHistory selectPurchseHistoryById(String id);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerId(@Param("consumerId")String consumerId, @Param("page")String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByConsumerIdAndRequestTitle(@Param("consumerId")String consumerId, @Param("title")String requestTitle, @Param("page")String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerId(@Param("makerId")String makerId, @Param("page")String page);
	public List<PurchaseHistory> selectPurchaseHistoriesByMakerIdAndRequestTitle(@Param("makerId")String makerId, @Param("title")String title, @Param("page")String page);


}