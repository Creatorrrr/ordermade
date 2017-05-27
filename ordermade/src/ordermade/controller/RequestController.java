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
import ordermade.domain.Portfolio;
import ordermade.domain.Request;
import ordermade.domain.Requests;
import ordermade.service.facade.RequestService;

@Controller
public class RequestController {

	@Autowired
	private RequestService service;

	// ===================action -> xml

	// --request

	@RequestMapping(value = "request/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerRequest(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		System.out.println(request.toString());
		if(request.getTitle()==null) return "error";
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
	}	//get http://localhost:8080/ordermade/request/xml/remove.do?id=5

	@RequestMapping(value = "request/xml/modifyBound.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyRequestBound(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		System.out.println(request.toString());
		if(request.getId()==null) return "error";
		boolean check = service.modifyRequestById(request);
		return check+"";
	}

	@RequestMapping(value = "request/xml/modifyMakerId.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyMakerIdToRequest(String requestId, String makerId, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(requestId == null) return "error";
		Request request= service.findRequestById(requestId);
		Member maker = new Member();
		maker.setId(makerId);
		request.setMaker(maker);
		boolean check = service.modifyRequestById(request);
		return check+"";
	}

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
	}
	
	
	@RequestMapping(value = "request/xml/modifyPaymentValue.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyPaymentValue(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(request.getId() == null ) return "error";
		Request requestOK= service.findRequestById(request.getId());
		requestOK.setPrice(request.getPrice());
		boolean check = service.modifyRequestById(requestOK);
		return check+"";
	}
	
	
	
	//-- invite request
	
	@RequestMapping(value = "inviteRequest/xml/registerToMaker.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerInviteRequestToMaker(InviteRequest inviteRequest) {
//		System.out.println(inviteRequest.toString());
		if(inviteRequest.getId()==null) return "error";
		boolean check = service.registerInviteRequest(inviteRequest);
		return check+"";
	}


	@RequestMapping(value = "inviteRequest/xml/removeById.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeInviteRequestById(String id) {
		if(id == null) return "error";
		boolean check = service.removeInviteRequestById(id);
		return check+"";
	}

	@RequestMapping(value = "inviteRequest/xml/removeByRequestId.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeInviteRequestByRequestId(String requestId) {
		if(requestId == null) return "error";
		boolean check = service.removeInviteRequestByRequestId(requestId);
		return check+"";
	}


	// --comment

	@RequestMapping(value = "comment/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerComment(Comment comment, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(comment.getId() == null) return "error";
		boolean check = service.registerComment(comment);
		return check+"";
	}

	@RequestMapping(value = "comment/xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyComment(Comment comment, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(comment.getId() == null) return "error";
		boolean check = service.modifyCommentById(comment);
		return check+"";
	}

	@RequestMapping(value = "comment/xml/remove.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String removeCommentById(String id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(id == null) return "error";
		boolean check = service.removeAttachById(id);
		return check+"";
	}

	
	
	// --attach

	@RequestMapping(value = "attach/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerAttach(Attach attach, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(attach.getId() == null) return "error";
		boolean check = service.registerAttach(attach);
		return check+"";
	}

	@RequestMapping(value = "attach/xml/remove.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String removeAttachById(String id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(id == null) return "error";
		boolean check = service.removeCommentById(id);
		return check+"";
	}

	
	
	
	
	// ==================web -> html

	@RequestMapping(value = "request/ui/register.do", method = RequestMethod.GET)
	public String showRegisterRequestUI() {
		return "request/register";
	}	//GET http://localhost:8080/ordermade/request/ui/register.do

	@RequestMapping(value = "request/ui/register1_1.do", method = RequestMethod.GET)
	public String showRegisterRequestUIForOneToOne() {
		return "request/register1_1";
	}	//GET http://localhost:8080/ordermade/request/ui/register1_1.do
	
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
	public ModelAndView showEditRequestUI(String requestId,HttpSession session){
		List<Request> list = null;
		String consumerId = "user1";

		Request request = service.findRequestById(requestId);
		ModelAndView modelAndView = new ModelAndView("request/modify");
		modelAndView.addObject("request", request);
		return modelAndView;
	}
	
	@RequestMapping(value="request/ui/search.do",method=RequestMethod.GET)
	public ModelAndView showSearchRequestUI(){
		List<Request> list = null;
		String consumerId = "user1";
		String type = "consumer";
		
		if(type == "consumer"){
			list = service.findRequestsByConsumerId(consumerId, "1");
		}else{
			list = service.findRequestsByConsumerIdWithMaker(consumerId, "1");
		}
		
		ModelAndView modelAndView = new ModelAndView("request/search");
		modelAndView.addObject("request", list);
		return modelAndView;
	}
	
	@RequestMapping(value="request/ui/detail.do",method=RequestMethod.GET)
	public ModelAndView showDetailRequestUI(String id, String page){
		List<Request> list = null;
		String consumerId = "user1";
		String type = "consumer";
		
		if(type == "consumer"){
			list = service.findRequestsByConsumerId(consumerId, "1");
		}else{
			list = service.findRequestsByConsumerIdWithMaker(consumerId, "1");
		}
		
		ModelAndView modelAndView = new ModelAndView("request/detail");
		modelAndView.addObject("request", list);
		return modelAndView;
	}
	
	@RequestMapping(value="request/ui/inviteList.do",method=RequestMethod.GET)
	public ModelAndView showInviteRequestListUI(String id, String page){
		List<InviteRequest> list = null;

		String form = "consumer";
		if(form == "consumer"){
			list = service.findInviteRequestsByConsumerId("user1", form, "1");
		}else{
			list = service.findInviteRequestsByMakerId("maker1", form, "1");
		}
		
		ModelAndView modelAndView = new ModelAndView("request/inviteList");
		modelAndView.addObject("request", list);
		return modelAndView;
	}
	
	
	
	
	//==================mobile -> xml
	
	@RequestMapping(value="request/xml/searchBound.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBound(String bound, String page){
		return new Requests(service.findRequestsByBound(bound, page));
	}
	
	@RequestMapping(value="request/xml/searchBoundAndTitle.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBoundAndTitle(String bound, String title, String page){
		return new Requests(service.findRequestsByBoundAndTitle(bound, title, page));
	}
	
	@RequestMapping(value="request/xml/searchBoundAndContent.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBoundAndContent(String bound, String content, String page){
		return new Requests(service.findRequestsByBoundAndContent(bound, content, page));
	}
	
	@RequestMapping(value="request/xml/searchMyRequests.do", produces="application/xml")
	public @ResponseBody Requests findMyRequests(String page, HttpSession session){
		return new Requests(service.findRequestsByConsumerId((String)session.getAttribute("loginId"), page));
	}

	@RequestMapping(value="request/xml/searchMyRequestsWithMaker.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsWithMaker(String page, HttpSession session){
		return new Requests(service.findRequestsByConsumerIdWithMaker((String)session.getAttribute("loginId"), page));
	}
	
	@RequestMapping(value="request/xml/searchMyRequestsWithPayment.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsWithPayment(String page, HttpSession session){
		return new Requests(service.findRequestsByConsumerIdWithPayment((String)session.getAttribute("loginId"), page));
	}
	
	@RequestMapping(value="request/xml/searchMyInviteRequestsForMaker.do", produces="application/xml")
	public @ResponseBody InviteRequests findMyInviteRequestsForMaker(String page, HttpSession session){
		return new InviteRequests(service.findInviteRequestsByMakerId(
				/*(String)session.getAttribute("loginId")*/"5",
				Constants.FORM_INVITE,
				page));
	}
	
	@RequestMapping(value="request/xml/searchMyInviteRequestsForConsumer.do", produces="application/xml")
	public @ResponseBody InviteRequests findMyInviteRequestsForConsumer(String page, HttpSession session){
		return new InviteRequests(service.findInviteRequestsByConsumerId(
				/*(String)session.getAttribute("loginId")*/"5",
				Constants.FORM_REQUEST,
				page));
	}
	
	@RequestMapping(value="comment/xml/searchRequestId.do", produces="application/xml")
	public @ResponseBody Comments findCommentsByRequestId(String requestId, String page){
		return new Comments(service.findCommentsByRequestId(requestId, page));
	}
	
	@RequestMapping(value="attach/xml/searchByRequestId.do", produces="application/xml")
	public @ResponseBody Attachs findAttachsByRequestId(String requestId, String page){
		return new Attachs(service.findAllAttachsByRequestId(requestId, page));
	}
	
	@RequestMapping(value="attach/xml/searchByRequestIdAndFileName.do", produces="application/xml")
	public @ResponseBody Attachs findAttachsByRequestIdAndFileName(String requestId, String fileName, String page){
		return new Attachs(service.findAttachsByFileNameAndRequestId(fileName, requestId, page));
	}
	
	@RequestMapping(value="request/xml/searchById.do", produces="application/xml")
	public @ResponseBody Request findRequestById(String id){
		return service.findRequestById(id);
	}
}