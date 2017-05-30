package ordermade.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ordermade.constants.Constants;
import ordermade.domain.Attach;
import ordermade.domain.Attachs;
import ordermade.domain.Comment;
import ordermade.domain.Comments;
import ordermade.domain.InviteRequest;
import ordermade.domain.InviteRequests;
import ordermade.domain.Member;
import ordermade.domain.Product;
import ordermade.domain.Request;
import ordermade.domain.Requests;
import ordermade.service.facade.ProductService;
import ordermade.service.facade.RequestService;
import ordermade.service.logic.ProductServiceLogic;

@Controller
public class RequestController {

	@Autowired
	private RequestService service;
	

	// ===================action -> xml

	// --request

	@RequestMapping(value = "request/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerRequest(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(request.getTitle()==null) return "error";
		//System.out.println(request.getMaker().getId());
		if(request.getMaker()== null){		//DB member.id null-> fix	
			Member maker = new Member();
			maker.setId("");
			request.setMaker(maker);
		}
		
		Member consumer = new Member();
		consumer.setId("user1");
		request.setConsumer(consumer);
		request.setBound("N");//비공개
		System.out.println(request.toString());
		boolean check = service.registerRequest(request);
		return check+"";
	}	//post http://localhost:8080/ordermade/request/xml/register.do
		//{"title":"의뢰\n","maker.id":"maker1","consumer.id":"user1","category":"aaa","content":"ccccc","hopePrice":"10000","price":"10500","bound":"boundsdfsdfjalkfjl"}


	@RequestMapping(value = "request/xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyRequestById(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		System.out.println(request.toString());
		if(request.getTitle()==null) return "error";
		boolean check = service.modifyRequestById(request);
		return check+"";
	}	//post http://localhost:8080/ordermade/request/xml/modify.do
		//{"id":"test","title":"의뢰2\n","maker.id":"maker2","consumer.id":"user2","category":"bb","content":"uuuuu","hopePrice":"33000","price":"30500","bound":"bbbbbb"}

	@RequestMapping(value = "request/xml/remove.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeRequestById(String id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(id==null) return "error";
		boolean check = service.removeRequestById(id);
		return check+"";
	}	//GET http://localhost:8080/ordermade/request/xml/remove.do?id=5

	@RequestMapping(value = "request/xml/modifyBound.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyRequestBound(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(request.getId()==null) return "error";
		Request requestOK= service.findRequestById(request.getId());
//		System.out.println(request.getBound());
		if(requestOK.getMaker()== null){		//DB member.id null-> fix	
			Member maker = new Member();
			maker.setId("");
			requestOK.setMaker(maker);
		}
		//System.out.println(requestOK.toString());
		requestOK.setBound(request.getBound());
		boolean check = service.modifyRequestById(requestOK);
		return check+"";
	}	//POST  http://localhost:8080/ordermade/request/xml/modifyBound.do
		//{"id":"1","bound":"open"}
	

	@RequestMapping(value = "request/xml/modifyMakerId.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyMakerIdToRequest(String requestId, String makerId, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		System.out.println(requestId);
		if(requestId == null) return "error";
		Request request= service.findRequestById(requestId);
		Member maker = new Member();
		maker.setId(makerId);
		request.setMaker(maker);
		boolean check = service.modifyRequestById(request);
		return check+"";
	}	//POST  http://localhost:8080/ordermade/request/xml/modifyMakerId.do
		//{"requestId":"1","makerId":"maker1"}

	@RequestMapping(value = "request/xml/removeMakerId.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String removeMakerIdToRequest(String requestId, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(requestId == null ) return "error";
		Request request= service.findRequestById(requestId);
		Member maker = new Member();
		maker.setId("");
		request.setMaker(maker);
		boolean check = service.modifyRequestById(request);
		return check+"";
	}	//POST  http://localhost:8080/ordermade/request/xml/removeMakerId.do
		//{"requestId":"1"}
	
	
	@RequestMapping(value = "request/xml/modifyPaymentValue.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyPaymentValue(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		//System.out.println(request.getId());
		if(request.getId() == null ) return "error";
		Request requestOK= service.findRequestById(request.getId());
		//System.out.println(request.getPrice());
		if(requestOK.getMaker()== null){		//DB member.id null-> fix	
			Member maker = new Member();
			maker.setId("");
			requestOK.setMaker(maker);
		}
		requestOK.setPrice(request.getPrice());
		System.out.println(requestOK.toString());
		boolean check = service.modifyRequestById(requestOK);
		return check+"";
	}	//POST  http://localhost:8080/ordermade/request/xml/modifyPaymentValue.do
		//{"id":"2","price":"30000"}
	
	
	
	//-- invite request
	
	@RequestMapping(value = "request/xml/registerInviteToMaker.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerInviteRequestToMaker(InviteRequest inviteRequest) {
//		System.out.println(inviteRequest.toString());
		if(inviteRequest.getMessage()==null) return "error";
		boolean check = service.registerInviteRequest(inviteRequest);
		return check+"";
	}	//POST  http://localhost:8080/ordermade/request/xml/registerInviteToMaker.do
		//{"message":"asdfaasf","maker.id":"maker2","form":"test","request.id":"7"}


	@RequestMapping(value = "request/xml/removeInviteById.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeInviteRequestById(String id) {
		if(id == null) return "error";
		boolean check = service.removeInviteRequestById(id);
		return check+"";
	} 	//GET  http://localhost:8080/ordermade/request/xml/removeInviteById.do?id=13

	@RequestMapping(value = "request/xml/removeInviteByRequestId.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeInviteRequestByRequestId(String requestId) {
		if(requestId == null) return "error";
		boolean check = service.removeInviteRequestByRequestId(requestId);
		return check+"";
	}	//GET  http://localhost:8080/ordermade/request/xml/removeInviteByRequestId.do?requestId=7


	// --comment

	// 170530 Complete
	@RequestMapping(value = "comment/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerComment(Comment comment, HttpSession session) {
		if(checkLogined(session)) return "error";	// check logined
		comment.setMember(new Member());
		comment.getMember().setId((String)session.getAttribute("loginId"));
		return service.registerComment(comment) + "";
	}	//POST  http://localhost:8080/ordermade/comment/xml/register.do
		//{"content":"cccccccccc","request.id":"7","member.id":"maker2"}

	@RequestMapping(value = "comment/xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyComment(Comment comment, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(comment.getId() == null) return "error";
		boolean check = service.modifyCommentById(comment);
		return check+"";
	}	//POST  http://localhost:8080/ordermade/comment/xml/modify.do
		//{"id":"1","content":"dddd","request.id":"8","member.id":"user1"}

	// 170530 Complete
	@RequestMapping(value = "comment/xml/remove.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeCommentById(String id, HttpSession session) {
		if(checkLogined(session)) return "error";	// check logined
		return service.removeCommentById(id) + "";
	}	//GET  http://localhost:8080/ordermade/comment/xml/remove.do?id=1

	
	
	// --attach

	@RequestMapping(value = "attach/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerAttach(Attach attach, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(attach.getFileName() == null) return "error";
		boolean check = service.registerAttach(attach);
		return check+"";
	}	//POST  http://localhost:8080/ordermade/attach/xml/register.do
		//{"path":"path/dddd/","extension":"extension asjdfla sfkl","fileName":"aaa.jpg","request.id":"8"}

	@RequestMapping(value = "attach/xml/remove.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeAttachById(String id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(id == null) return "error";
		boolean check = service.removeAttachById(id);
		return check+"";
	}	//GET  http://localhost:8080/ordermade/attach/xml/remove.do?id=1

	
	
	
	
	// ==================web -> html


	@RequestMapping(value = "request/ui/register.do", method = RequestMethod.GET)
	public ModelAndView showRegisterRequestUIForOneToOne(String makerId, String productId, String categoryId) {
		if(makerId==null) return new ModelAndView("request/register");
		//-----상품페이지에서 데이터를 받아와야 함.
		ModelAndView modelAndView = new ModelAndView("request/register1_1");
		modelAndView.addObject("productId", productId);
		modelAndView.addObject("makerId", makerId);
		modelAndView.addObject("categoryId", categoryId);		
		return modelAndView;
	}	//GET http://localhost:8080/ordermade/request/ui/register.do
		//GET http://localhost:8080/ordermade/request/ui/register.do?makerId=maker1&productId=1
	
	@RequestMapping(value="request/ui/myPage.do",method=RequestMethod.GET)
	public ModelAndView showMyRequestUI(){
		List<Request> list = null;
		String consumerId = "user1";
		String type = "consumer";
		
		if(type == "consumer"){
			list = service.findRequestsByConsumerId(consumerId, "1");
		}else{
			list = service.findRequestsByConsumerIdWithMaker(consumerId, "1");
		}
		
		ModelAndView modelAndView = new ModelAndView("request/myPage");
		modelAndView.addObject("requests", list);
		return modelAndView;
	}
	
	@RequestMapping(value="request/ui/modify.do",method=RequestMethod.GET)
	public ModelAndView showEditRequestUI(String requestId, HttpSession session){
		if(checkLogined(session)) return new ModelAndView("member/login");	// check logined
		return new ModelAndView("request/modify")
				.addObject("request", service.findRequestById(requestId));
	}
	
	@RequestMapping(value="request/ui/search.do",method=RequestMethod.GET)
	public String showSearchRequestUI(){
		return "request/makerRequestSearch";
	}
	
	@RequestMapping(value="request/ui/detail.do",method=RequestMethod.GET)
	public ModelAndView showDetailRequestUI(String id, HttpSession session){
			return new ModelAndView("request/detail")
					.addObject("request", service.findRequestById(id));
	}
	
	// 170530 Complete
	@RequestMapping(value="request/ui/makerInviteList.do",method=RequestMethod.GET)
	public ModelAndView showMakerInviteRequestListUI(String page, HttpSession session){
		return new ModelAndView("request/makerInviteList")
				.addObject("inviteRequests", 
						service.findInviteRequestsByMakerId(
								(String)session.getAttribute("loginId"), 
								Constants.FORM_INVITE, 
								/*page*/"1"));
	}
	
	// 170530 Complete
	@RequestMapping(value="request/ui/consumerInviteList.do",method=RequestMethod.GET)
	public ModelAndView showConsumerInviteRequestListUI(String page, HttpSession session){
		return new ModelAndView("request/consumerInviteList")
				.addObject("inviteRequests", 
						service.findInviteRequestsByConsumerId(
								(String)session.getAttribute("loginId"), 
								Constants.FORM_REQUEST, 
								/*page*/"1"));
	}
	
	//==================mobile -> xml
	
	// Complete
	@RequestMapping(value="request/xml/searchBound.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBound(String page){
		return new Requests(service.findRequestsByBound(Constants.BOUND_PUBLIC, page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchBoundAndTitle.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBoundAndTitle(String title, String page){
		return new Requests(service.findRequestsByBoundAndTitle(Constants.BOUND_PUBLIC, title, page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchBoundAndContent.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBoundAndContent(String content, String page){
		return new Requests(service.findRequestsByBoundAndContent(Constants.BOUND_PUBLIC, content, page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyRequests.do", produces="application/xml")
	public @ResponseBody Requests findMyRequests(String page, HttpSession session){
		return new Requests(service.findRequestsByConsumerId((String)session.getAttribute("loginId"), page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyRequestsWithMaker.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsWithMaker(String page, HttpSession session){
		return new Requests(service.findRequestsByConsumerIdWithMaker((String)session.getAttribute("loginId"), page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyRequestsWithPayment.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsWithPayment(String page, HttpSession session){
		return new Requests(service.findRequestsByConsumerIdWithPayment((String)session.getAttribute("loginId"), page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyInviteRequestsForMaker.do", produces="application/xml")
	public @ResponseBody InviteRequests findMyInviteRequestsForMaker(String page, HttpSession session){
		return new InviteRequests(service.findInviteRequestsByMakerId(
				(String)session.getAttribute("loginId"),
				Constants.FORM_INVITE,
				page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyInviteRequestsForConsumer.do", produces="application/xml")
	public @ResponseBody InviteRequests findMyInviteRequestsForConsumer(String page, HttpSession session){
		return new InviteRequests(service.findInviteRequestsByConsumerId(
				(String)session.getAttribute("loginId"),
				Constants.FORM_REQUEST,
				page));
	}
	// Complete
	@RequestMapping(value="comment/xml/searchRequestId.do", produces="application/xml")
	public @ResponseBody Comments findCommentsByRequestId(String requestId, String page){
		return new Comments(service.findCommentsByRequestId(requestId, page));
	}
	// Complete
	@RequestMapping(value="attach/xml/searchByRequestId.do", produces="application/xml")
	public @ResponseBody Attachs findAttachsByRequestId(String requestId, String page){
		return new Attachs(service.findAllAttachsByRequestId(requestId, page));
	}
	// Complete
	@RequestMapping(value="attach/xml/searchByRequestIdAndFileName.do", produces="application/xml")
	public @ResponseBody Attachs findAttachsByRequestIdAndFileName(String requestId, String fileName, String page){
		return new Attachs(service.findAttachsByFileNameAndRequestId(fileName, requestId, page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchById.do", produces="application/xml")
	public @ResponseBody Request findRequestById(String id){
		return service.findRequestById(id);
	}
	// Complete
	private boolean checkLogined(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		return loginId == null || loginId.isEmpty();
	}
}