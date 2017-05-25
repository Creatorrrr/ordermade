package ordermade.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ordermade.domain.Account;
import ordermade.domain.PurchaseHistory;
import ordermade.service.facade.DealService;

@Controller
public class DealController {
	
	@Autowired
	DealService dService;

	@RequestMapping(value="/account/consumerMoney.do", method=RequestMethod.POST)
	public String consumerMoneyToAccount(PurchaseHistory purchaseHistory, HttpSession session){
		Account account = new Account();
		account = dService.findAccountById((String)session.getAttribute("loginUser"));
		
		boolean checkAccount = false;
		boolean checkPurchase = false;
		
		checkAccount = dService.modifyAccountById(account);
		if(checkAccount == true){
			checkPurchase = dService.modifyPurchaseHistoryById(purchaseHistory);
		}
		
		return Boolean.toString(checkPurchase);
	}
	
	@RequestMapping(value="/account/makerMoney.do", method=RequestMethod.POST)
	public String sendMoneyToMakerAccount(PurchaseHistory purchaseHistory, HttpSession session){
		Account account = new Account();
		account = dService.findAccountById((String)session.getAttribute("loginUser"));
		
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
		
		boolean checkPurchase = false;
		if(session.getAttribute("loginUser") != null){
			PurchaseHistory purchaseHistory = dService.findPurchseHistoryById(id);
			purchaseHistory.setInvoiceNumber(invoiceNumber);
			checkPurchase = dService.registerPurchaseHistory(purchaseHistory);
		}
		
		return Boolean.toString(checkPurchase);
	}
}
