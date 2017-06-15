package ordermade.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.constants.Constants;
import ordermade.domain.Account;
import ordermade.domain.PurchaseHistory;
import ordermade.domain.Request;
import ordermade.service.facade.DealService;
import ordermade.store.facade.AccountStore;
import ordermade.store.facade.PurchaseHistoryStore;
import ordermade.store.facade.RequestStore;

@Service
public class DealServiceLogic implements DealService{
	
	@Autowired
	private AccountStore accountStore;
	@Autowired
	private PurchaseHistoryStore purchaseHistoryStore;
	@Autowired
	private RequestStore requestStore;

	@Override
	public boolean transactionToMaker(String requestId) {
		Request request = requestStore.selectRequestById(requestId);
		
		accountStore.transaction(
				Constants.PANDA_ACCOUNT, 
				request.getMaker().getId(), 
				request.getPrice());
		
		return purchaseHistoryStore.updatePurchaseHistoryByRequestIdForPayment(requestId, Constants.PAYMENT_Y);
	}
	
	@Override
	public boolean transactionFromConsumer(String requestId) {
		Request request = requestStore.selectRequestById(requestId);
		
		accountStore.transaction(
				request.getConsumer().getId(), 
				Constants.PANDA_ACCOUNT, 
				request.getPrice());
		
		requestStore.updateRequestByIdForPayment(requestId, Constants.PAYMENT_Y);
		
		PurchaseHistory purchaseHistory = new PurchaseHistory();
		purchaseHistory.setConsumer(request.getConsumer());
		purchaseHistory.setMaker(request.getMaker());
		purchaseHistory.setRequest(request);
		purchaseHistory.setInvoiceNumber(new String());
		purchaseHistory.setCharge(0);
		purchaseHistory.setDeliveryStatus(Constants.DELIVERY_PREPARE);
		purchaseHistory.setPayment(Constants.PAYMENT_N);
		return purchaseHistoryStore.insertPurchaseHistory(purchaseHistory);
	}

	@Override
	public Account findAccountById(String id) {
		return accountStore.selectAccountById(id);
	}
	
	@Override
	public PurchaseHistory findPurchseHistoryById(String id) {
		return purchaseHistoryStore.selectPurchseHistoryById(id);
	}

	@Override
	public boolean registerPurchaseHistory(PurchaseHistory purchaseHistory) {
		String id = purchaseHistory.getRequest().getId();
		Request request = requestStore.selectRequestById(id);
		int price = request.getPrice();
		purchaseHistory.getRequest().setPrice(price);
		return purchaseHistoryStore.insertPurchaseHistory(purchaseHistory);
	}

	@Override
	public boolean modifyPurchaseHistoryById(PurchaseHistory purchaseHistory) {
		return purchaseHistoryStore.updatePurchaseHistoryById(purchaseHistory);
	}
	
	@Override
	public boolean modifyPurchaseHistoryByIdForDelivery(PurchaseHistory purchaseHistory) {
		return purchaseHistoryStore.updatePurchaseHistoryByIdForDelivery(purchaseHistory);
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByConsumerId(String consumerId, String page) {
		return purchaseHistoryStore.selectPurchaseHistoriesByConsumerId(consumerId, page);
	}
	
	@Override
	public int findRowsPurchaseHistoriesByConsumerId(String consumerId) {
		return purchaseHistoryStore.selectRowsPurchaseHistoriesByConsumerId(consumerId);
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
	public int findRowsPurchaseHistoriesByMakerId(String makerId) {
		return purchaseHistoryStore.selectRowsPurchaseHistoriesByMakerId(makerId);
	}

	@Override
	public List<PurchaseHistory> findpurchaseHistoriesByMakerIdAndRequestTitle(String makerId, String requestTitle,
			String page) {
		return purchaseHistoryStore.selectPurchaseHistoriesByMakerIdAndRequestTitle(makerId, requestTitle, page);
	}

	
}