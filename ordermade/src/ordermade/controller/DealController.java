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
	
	@RequestMapping(value="account/consumerMoney.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String consumerMoneyToAccount(PurchaseHistory purchaseHistory, HttpSession session){
		
		System.out.println("----------test 성공-----------");
		System.out.println("------data : "+purchaseHistory.toString());
		
		// session에서 회원ID 가져오기
//		String memberId = (String)session.getAttribute("loginUser");
		boolean checkPurchase = false;
		boolean checkAccount = false;
		
		checkPurchase = dService.registerPurchaseHistory(purchaseHistory);
		
//		if(checkPurchase == true){
			Account account = dService.findAccountById("jwUm");
			account.setMoney(purchaseHistory.getRequest().getPrice());
			checkAccount = dService.modifyAccountById(account);
//		}
		return checkAccount+"";
		
	}
	
	@RequestMapping(value="account/makerMoney.do", method=RequestMethod.POST)
	public String sendMoneyToMakerAccount(PurchaseHistory purchaseHistory, HttpSession session){
		
		System.out.println("----------test 성공-----------");
		Account account = new Account();
		// session에서 회원ID 가져오기
//		String memberId = (String)session.getAttribute("loginUser");
		account = dService.findAccountById("jwUm");
		
		boolean checkAccount = false;
		boolean checkPurchase = false;
		
		checkAccount = dService.modifyAccountById(account);
		if(checkAccount == true){
			checkPurchase = dService.modifyAccountById(account);
		}
		return Boolean.toString(checkPurchase);
	}
	
	@RequestMapping(value="purchaseHistory/delivery.do", method=RequestMethod.POST)
	public String registerInvoiceNumberToPurchaseHistory(String invoiceNumber, String id, HttpSession session){
		
		System.out.println("----------test 성공-----------");
		boolean checkPurchase = false;
		// session에서 회원ID 가져오기
//		if(session.getAttribute("loginUser") != null){
			PurchaseHistory purchaseHistory = dService.findPurchseHistoryById(id);
			purchaseHistory.setInvoiceNumber(invoiceNumber);
			checkPurchase = dService.registerPurchaseHistory(purchaseHistory);
//		}
		
		return Boolean.toString(checkPurchase);
	}
	
	// UI For WEB
	
	@RequestMapping(value="transaction.do", method=RequestMethod.POST)
	public ModelAndView showPurchaseHistoryUI(HttpSession session){
		// session에서 회원객체 가져오기
		Member memberCheck = (Member)session.getAttribute("loginUser");
		String page = "1";
		if(memberCheck.getMemberType() == "consumer"){
			String consumerId = memberCheck.getId();
			page = (String)session.getAttribute("page");
			List<PurchaseHistory> purchaseList = new ArrayList<>();
			purchaseList = dService.findpurchaseHistoriesByConsumerId(consumerId, page);
			ModelAndView modelAndView = new ModelAndView("deal/transaction");
			modelAndView.addObject("purchaseList", purchaseList);
			return modelAndView;
		}else if(memberCheck.getMemberType() == "maker"){
			String makerId = memberCheck.getId();
			page = (String)session.getAttribute("page");
			List<PurchaseHistory> purchaseList = new ArrayList<>();
			purchaseList = dService.findpurchaseHistoriesByMakerId(makerId, page);
			ModelAndView modelAndView = new ModelAndView("deal/transaction");
			modelAndView.addObject("purchaseList", purchaseList);
			return modelAndView;
		}
		return null;
	}
	
	// XML for Mobile
	
	
	// 
	@RequestMapping(value="xml/purchaseConsumerList.do", produces="application/xml")
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
	
	@RequestMapping(value="xml/purchaseConsumerTitleList.do", produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesByRequestTitleForConsumer(String requestTitle, String consumerId, HttpSession session){
		requestTitle = "";
		consumerId = "";
		String page = "1";
		List<PurchaseHistory> purchaseConsumerTitleList = dService.findpurchaseHistoriesByConsumerIdAndRequestTitle(consumerId, requestTitle, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseConsumerTitleList);
		return purchaseHistories;
	}
	
	@RequestMapping(value="xml/purchaseMakerList.do", produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesForMaker(String makerId, HttpSession session){
		makerId = "";
		String page = "1";
		List<PurchaseHistory> purchaseMakerList = dService.findpurchaseHistoriesByMakerId(makerId, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseMakerList);
		return purchaseHistories;
	}
	
	@RequestMapping(value="xml/searchByRequestTitle.do", produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesByRequestTitleForMaker(String requestTitle, String makerId, HttpSession session){
		makerId="";
		requestTitle = "";
		String page = "1";
		List<PurchaseHistory> purchaseMakerTitleList = dService.findpurchaseHistoriesByMakerIdAndRequestTitle(makerId, requestTitle, page);
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseMakerTitleList);
		return purchaseHistories;
	}
}