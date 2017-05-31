package ordermade.controller;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ordermade.constants.Constants;
import ordermade.domain.Account;
import ordermade.domain.Member;
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
	@RequestMapping(value="xml/account/consumerMoney.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String consumerMoneyToAccount(PurchaseHistory purchaseHistory, HttpSession session){
		
		System.out.println("----------controller 성공-----------");
		System.out.println("------data : "+purchaseHistory.toString());
		
		// session에서 회원ID 가져오기
		String memberId = (String)session.getAttribute("loginId");
		boolean checkPurchase = false;
		boolean checkAccount = false;
		checkPurchase = dService.registerPurchaseHistory(purchaseHistory);
		
		System.out.println("------data : "+purchaseHistory.toString());
		
		if(checkPurchase == true){
			Account account = dService.findAccountById(memberId);
			account.setMoney(purchaseHistory.getRequest().getPrice());
			checkAccount = dService.modifyAccountById(account);
		}
		return checkAccount+"";
		
	}
	
	// http://localhost:8080/ordermade/deal/account/makerMoney.do
	// data : {"maker.id":"admin1\n","consumer.id":"consuser1\n","request.id":"1","invoiceNumber":"02255215","deliveryStatus":"yes","payment":"C" }
	@RequestMapping(value="xml/account/makerMoney.do", method=RequestMethod.POST)
	public String sendMoneyToMakerAccount(PurchaseHistory purchaseHistory, HttpSession session){
		
		System.out.println("----------controller 성공-----------");
		System.out.println("------data : "+purchaseHistory.toString());
		
		// session에서 회원ID 가져오기
//		String memberId = (String)session.getAttribute("loginUser");
		boolean checkPurchase = false;
		boolean checkAccount = false;
		
		checkPurchase = dService.registerPurchaseHistory(purchaseHistory);
		
//		if(checkPurchase == true){
			Account account = dService.findAccountById("jwUm");
			System.out.println(purchaseHistory.getRequest().getPrice());
			account.setMoney(purchaseHistory.getRequest().getPrice());
			checkAccount = dService.modifyAccountById(account);
//		}
		return checkAccount+"";
	}
	
	// http://localhost:8080/ordermade/deal/purchaseHistory/delivery.do
	// data : {"invoiceNumber":"02255215","id":"2"}
	@RequestMapping(value="xml/purchaseHistory/delivery.do", method=RequestMethod.POST)
	public @ResponseBody String registerInvoiceNumberToPurchaseHistory(String invoiceNumber, String id, HttpSession session){
		
		System.out.println("----------controller 성공-----------");
		boolean checkPurchase = false;
		// session에서 회원ID 가져오기
//		if(session.getAttribute("loginUser") != null){
			PurchaseHistory purchaseHistory = dService.findPurchseHistoryById(id);
//			purchaseHistory.getMaker().setId("tempmUser");
//			purchaseHistory.getConsumer().setId("tempcUser");
			purchaseHistory.setInvoiceNumber(invoiceNumber);
			System.out.println(purchaseHistory.toString());
			checkPurchase = dService.modifyPurchaseHistoryById(purchaseHistory);
//		}
		
		return checkPurchase+"";
//		return Boolean.toString(checkPurchase);
	}
	
	// UI For WEB
	
	// http://localhost:8080/ordermade/deal/transaction.do
	@RequestMapping(value="ui/transaction.do", method=RequestMethod.GET)
	public ModelAndView showPurchaseHistoryUI(String page, HttpSession session){
		String memberType = (String)session.getAttribute("memberType");
		String memberId = (String)session.getAttribute("loginId");
		page = "1";
		if(memberType.equals(Constants.CONSUMER)){
			List<PurchaseHistory> purchaseList = new ArrayList<>();
			purchaseList = dService.findpurchaseHistoriesByConsumerId(memberId, page);
			ModelAndView modelAndView = new ModelAndView("purchaseHistory/consumerPurchaseHistory");
			modelAndView.addObject("purchaseList", purchaseList);
			return modelAndView;
		}else if(memberType.equals(Constants.MAKER)){
			List<PurchaseHistory> purchaseList = new ArrayList<>();
			purchaseList = dService.findpurchaseHistoriesByMakerId(memberId, page);
			ModelAndView modelAndView = new ModelAndView("purchaseHistory/makerPurchaseHistory");
			modelAndView.addObject("purchaseList", purchaseList);
			return modelAndView;
		}else{
			throw new RuntimeException("No such Information");
		}
	}
	
	// XML for Mobile
	
	
	// http://localhost:8080/ordermade/deal/xml/searchPurchaseConsumerList.do
	@RequestMapping(value="xml/searchPurchaseConsumerList.do", produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesForConsumer(String page, HttpSession session){
		// session에서 회원ID 가져오기
//		String consumerId = (String)session.getAttribute("loginUser");
		String consumerId = "user1";
		page = "1";
		List<PurchaseHistory> purchaseConsumerList = dService.findpurchaseHistoriesByConsumerId(consumerId, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseConsumerList);
		return purchaseHistories;
	}
	
	// http://localhost:8080/ordermade/deal/xml/searchPurchaseConsumerTitleList.do
	@RequestMapping(value="xml/searchPurchaseConsumerTitleList.do", method=RequestMethod.POST, produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesByRequestTitleForConsumer(String requestTitle, String consumerId, String page, HttpSession session){
		consumerId = "user1";
		page = "1";
		List<PurchaseHistory> purchaseConsumerTitleList = dService.findpurchaseHistoriesByConsumerIdAndRequestTitle(consumerId, requestTitle, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseConsumerTitleList);
		return purchaseHistories;
	}
	
	// http://localhost:8080/ordermade/deal/xml/searchPurchaseMakerList.do
	@RequestMapping(value="xml/searchPurchaseMakerList.do", produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesForMaker(String makerId, HttpSession session){
		makerId = "";
		String page = "1";
		List<PurchaseHistory> purchaseMakerList = dService.findpurchaseHistoriesByMakerId(makerId, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseMakerList);
		return purchaseHistories;
	}
	
	// http://localhost:8080/ordermade/deal/xml/searchMakerListByRequestTitle.do
	@RequestMapping(value="xml/searchPurchaseMakerListByRequestTitle.do", produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesByRequestTitleForMaker(String requestTitle, String makerId, String page, HttpSession session){
		makerId="";
		requestTitle = "";
		page = "1";
		List<PurchaseHistory> purchaseMakerTitleList = dService.findpurchaseHistoriesByMakerIdAndRequestTitle(makerId, requestTitle, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseMakerTitleList);
		return purchaseHistories;
	}
}