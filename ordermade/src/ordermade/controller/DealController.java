package ordermade.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ordermade.constants.Constants;
import ordermade.domain.PurchaseHistories;
import ordermade.domain.PurchaseHistory;
import ordermade.service.facade.DealService;

@Controller
@RequestMapping("deal")
public class DealController {
	
	@Autowired
	private DealService dService;

	// logic XML For WEB
	
	// http://localhost:8080/ordermade/deal/account/consumerMoney.do
	// data : {"maker.id":"admin1\n","consumer.id":"consuser1\n","request.id":"1","invoiceNumber":"02255215","deliveryStatus":"yes","payment":"C" }
	@RequestMapping(value="xml/account/consumerMoney.do", method=RequestMethod.GET, produces="text/plain")
	public @ResponseBody String consumerMoneyToAccount(String requestId, HttpSession session){
		if(checkLogined(session)) return "error";	// check logined
		return dService.transactionFromConsumer(requestId) + "";
	}
	
	// http://localhost:8080/ordermade/deal/account/makerMoney.do
	// data : {"maker.id":"admin1\n","consumer.id":"consuser1\n","request.id":"1","invoiceNumber":"02255215","deliveryStatus":"yes","payment":"C" }
	@RequestMapping(value="xml/account/makerMoney.do", method=RequestMethod.GET, produces="text/plain")
	public @ResponseBody String sendMoneyToMakerAccount(String requestId, HttpSession session){
		if(checkLogined(session)) return "error";	// check logined
		return dService.transactionToMaker(requestId) + "";
	}
	
	// http://localhost:8080/ordermade/deal/purchaseHistory/delivery.do
	// data : {"invoiceNumber":"02255215","id":"2"}
	@RequestMapping(value="xml/purchaseHistory/delivery.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String registerInvoiceNumberToPurchaseHistory(PurchaseHistory purchaseHistory, HttpSession session){
		if(checkLogined(session)) return "error";	// check logined
		purchaseHistory.setDeliveryStatus(Constants.DELIVERY_COMPLETE);
		return dService.modifyPurchaseHistoryByIdForDelivery(purchaseHistory) + "";
	}
	
	// UI For WEB
	
	// http://localhost:8080/ordermade/deal/ui/transaction.do
	@RequestMapping(value="ui/transaction.do", method=RequestMethod.GET)
	public ModelAndView showPurchaseHistoryUI(String page, HttpSession session){
		if(checkLogined(session)) return new ModelAndView("member/login");	// check logined
		
		String memberType = (String)session.getAttribute("memberType");
		String memberId = (String)session.getAttribute("loginId");
		
		if(page == null || page == "") page = "1";
		List<PurchaseHistory> purchaseList = new ArrayList<>();
		ModelAndView modelAndView = null;
		
		if(memberType.equals(Constants.CONSUMER)){
			purchaseList = dService.findpurchaseHistoriesByConsumerId(memberId, page);
			modelAndView = new ModelAndView("purchaseHistory/consumerPurchaseHistory");
		}else if(memberType.equals(Constants.MAKER)){
			purchaseList = dService.findpurchaseHistoriesByMakerId(memberId, page);
			modelAndView = new ModelAndView("purchaseHistory/makerPurchaseHistory");
		}
		modelAndView.addObject("purchaseList", purchaseList);
		modelAndView.addObject("thisPage", page);
		return modelAndView;
	}
	
	@RequestMapping(value="pages/transaction.do", method=RequestMethod.GET, produces="text/plain")
	public @ResponseBody String findPagesPurchaseHistory(HttpSession session){
		String memberType = (String)session.getAttribute("memberType");
		String memberId = (String)session.getAttribute("loginId");
		
		if (memberType.equals(Constants.CONSUMER)){
			return dService.findRowsPurchaseHistoriesByConsumerId(memberId) / Constants.PURCHASEHISTORY_ROW_SIZE + 1 + "";
		} else {
			return dService.findRowsPurchaseHistoriesByMakerId(memberId) / Constants.PURCHASEHISTORY_ROW_SIZE + 1 + "";
		}
	}
	
	// XML for Mobile
	
	
	// http://localhost:8080/ordermade/deal/xml/searchPurchaseConsumerList.do
	@RequestMapping(value="xml/searchPurchaseConsumerList.do", method=RequestMethod.GET, produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesForConsumer(String page, HttpSession session){
		// session에서 회원ID 가져오기
		String consumerId = (String)session.getAttribute("loginId");
		if(page == null || page == "") page = "1";
		List<PurchaseHistory> purchaseConsumerList = dService.findpurchaseHistoriesByConsumerId(consumerId, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseConsumerList);
		return purchaseHistories;
	}
	
	// http://localhost:8080/ordermade/deal/xml/searchPurchaseConsumerTitleList.do
	@RequestMapping(value="xml/searchPurchaseConsumerTitleList.do", method=RequestMethod.POST, produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesByRequestTitleForConsumer(String requestTitle, String consumerId, String page, HttpSession session){
		consumerId = "user1";
		if(page == null || page == "") page = "1";
		List<PurchaseHistory> purchaseConsumerTitleList = dService.findpurchaseHistoriesByConsumerIdAndRequestTitle(consumerId, requestTitle, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseConsumerTitleList);
		return purchaseHistories;
	}
	
	// http://localhost:8080/ordermade/deal/xml/searchPurchaseMakerList.do
	@RequestMapping(value="xml/searchPurchaseMakerList.do", method=RequestMethod.GET, produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesForMaker(String makerId, String page, HttpSession session){
		makerId = "";
		if(page == null || page == "") page = "1"; // String page 추가 17/06/03 11:58am By MBS
		List<PurchaseHistory> purchaseMakerList = dService.findpurchaseHistoriesByMakerId(makerId, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseMakerList);
		return purchaseHistories;
	}
	
	// http://localhost:8080/ordermade/deal/xml/searchMakerListByRequestTitle.do
	@RequestMapping(value="xml/searchPurchaseMakerListByRequestTitle.do", method=RequestMethod.GET, produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesByRequestTitleForMaker(String requestTitle, String makerId, String page, HttpSession session){
		makerId="";
		requestTitle = "";
		if(page == null || page == "") page = "1";
		List<PurchaseHistory> purchaseMakerTitleList = dService.findpurchaseHistoriesByMakerIdAndRequestTitle(makerId, requestTitle, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseMakerTitleList);
		return purchaseHistories;
	}
	
	// Complete
	private boolean checkLogined(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		return loginId == null || loginId.isEmpty();
	}
}