package ordermade.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ordermade.domain.Member;
import ordermade.domain.Request;
import ordermade.service.facade.RequestService;

@Controller
@RequestMapping("request")
public class RequestController {
	
	@Autowired
	private RequestService requestService;
	
	
	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public String showPostRegisterUI(String memberId, Model model) {
		model.addAttribute("memberId", memberId);
		return "RequestRegister";
	}
	
	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerRequest(Request request, Model model, HttpSession session){
		
		String loginId=(String)session.getAttribute("loginId");
		
		String title;
		String category;
		String content;
		int price;
		int hopePrice;
		String bound;
		
		Member member = new Member();
		
		member.setMemberType("maker");
		member.setMemberType("consumer");
		
		Request req = new Request();
//		req.setTitle(title);
//		req.setCategory(category);
//		req.setContent(content);
//		req.setPrice(price);
//		req.setHopePrice(hopePrice);
//		req.setBound(bound);
		req.setMaker(member);
		req.setConsumer(member);
		
		model.addAttribute("request",requestService.findRequestById(request.getId()));
	
		return "requestDetail";
	}
	
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public String showRequestDetailUI(String requestId,Model model){
		
		Request request = requestService.findRequestById(requestId);
		
		model.addAttribute("request",request);
		
		return "requestDetail";
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public String showEditRequestUI(String id, Model model, HttpSession session) {
		Request request = requestService.findRequestById(id);
		
		model.addAttribute("request", request);
		
		return "requestModify";
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modifyRequestById(Request request, HttpSession session, Model model) {
		Request thisRequest = requestService.findRequestById(request.getId());
//		request.setTitle(title);
//		request.setContent(content);
		
		if(!requestService.modifyRequestById(thisRequest)) {
			throw new RuntimeException("post modify failed");
		}
		
		model.addAttribute("request", thisRequest);
		
		return "requestDetail";
	}

}