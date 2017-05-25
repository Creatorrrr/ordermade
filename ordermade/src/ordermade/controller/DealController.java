package ordermade.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class DealController {
	
	@Autowired
	DealService dService;

	@RequestMapping(value="/account/consumerMoney.do", method=RequestMethod.POST)
	public String consumerMoneyToAccount(@ModelAttribute PurchaseHistory purchaseHistory, HttpSession session){
		
		System.out.println("----------test 성공-----------");
		Account account = new Account();
		// session에서 회원ID 가져오기
//		String memberId = (String)session.getAttribute("loginUser");
		account = dService.findAccountById("jwUm");
		boolean checkAccount = false;
		boolean checkPurchase = false;
		
		checkAccount = dService.modifyAccountById(account);
		if(checkAccount == true){
			checkPurchase = dService.modifyPurchaseHistoryById(purchaseHistory);
		}
		
		return Boolean.toString(checkPurchase);
		
	}
	
	@RequestMapping(value="/account/makerMoney.do", method=RequestMethod.POST)
	public String sendMoneyToMakerAccount(@ModelAttribute PurchaseHistory purchaseHistory, HttpSession session){
		
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
	
	@RequestMapping(value="/purchaseHistory/delivery.do", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/deal/transaction.do", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/purchaseHistoryList", method=RequestMethod.GET, produces="application/xml")
	public @ResponseBody PurchaseHistories findMyPurchaseHistoriesForConsumer(String page, HttpSession session){
		// session에서 회원ID 가져오기
//		String consumerId = (String)session.getAttribute("loginUser");
		List<PurchaseHistory> purchaseList = dService.findpurchaseHistoriesByConsumerId("user1", "1");
		PurchaseHistories purchaseHistories = new PurchaseHistories();
		purchaseHistories.setPurchaseList(purchaseList);
		return purchaseHistories;
	}
	
}
