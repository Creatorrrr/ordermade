package ordermade.controller;

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
import ordermade.domain.Request;
import ordermade.domain.Requests;
import ordermade.service.facade.RequestService;

@Controller
public class RequestController {

	@Autowired
	private RequestService rService;

	// ===================action -> xml

	// --request

	@RequestMapping(value = "request/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerRequest(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		System.out.println(request.toString());
		if(request.getTitle()==null) return "error";
		boolean check = rService.registerRequest(request);
		return check+"";
	}	//post http://localhost:8080/ordermade/request/xml/register.do
		//{"title":"의뢰\n","maker.id":"maker1","consumer.id":"user1","category":"aaa","content":"ccccc","hopePrice":"10000","price":"10500","bound":"boundsdfsdfjalkfjl"}


	@RequestMapping(value = "request/xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyRequestById(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		System.out.println(request.toString());
		if(request.getTitle()==null) return "error";
		boolean check = rService.modifyRequestById(request);
		return check+"";
	}	//post http://localhost:8080/ordermade/request/xml/modify.do
		//{"id":"test","title":"의뢰2\n","maker.id":"maker2","consumer.id":"user2","category":"bb","content":"uuuuu","hopePrice":"33000","price":"30500","bound":"bbbbbb"}

	@RequestMapping(value = "request/xml/remove.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeRequestById(String id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(id==null) return "error";
		boolean check = rService.removeRequestById(id);
		return check+"";
	}	//get http://localhost:8080/ordermade/request/xml/remove.do?id=5

	@RequestMapping(value = "request/xml/modifyBound.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyRequestBound(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		System.out.println(request.toString());
		if(request.getId()==null) return "error";
		boolean check = rService.modifyRequestById(request);
		return check+"";
	}

	@RequestMapping(value = "request/xml/modifyMaker.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyRequestMaker(String maker_id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		return null;
	}

	@RequestMapping(value = "request/xml/removeMaker.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String removeRequestMaker(String maker_id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		return null;
	}

	@RequestMapping(value = "request/xml/registerInviteToMaker.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerInviteRequestToMaker(InviteRequest inviteRequest) {
		return null;
	}

	@RequestMapping(value = "request/xml/registerInviteToConsumer.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerInviteRequestToConsumer(InviteRequest inviteRequest) {
		return null;
	}

	@RequestMapping(value = "request/xml/removeInvite.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String removeInviteRequestById(String id) {
		return null;
	}

	@RequestMapping(value = "request/xml/modifyPaymentValue.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyPaymentValue(Request request, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		return null;
	}

	// --comment

	@RequestMapping(value = "comment/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerComment(Comment comment, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		return null;
	}

	@RequestMapping(value = "comment/xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyComment(Comment comment, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		return null;
	}

	@RequestMapping(value = "comment/xml/remove.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String removeCommentById(String id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		return null;
	}

	// --attach

	@RequestMapping(value = "attach/xml/register.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerAttach(Attach attach, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		return null;
	}

	@RequestMapping(value = "attach/xml/remove.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String removeAttachById(String id, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		return null;
	}

	// ==================web -> html

	@RequestMapping(value = "request/ui/register.do", method = RequestMethod.GET)
	public String showRegisterRequestUI() {
		return "request/register";
	}

	@RequestMapping(value = "request/ui/register1_1.do", method = RequestMethod.GET)
	public String showRegisterRequestUIForOneToOne() {
		return "request/register1_1";
	}
	
	@RequestMapping(value="request/ui/myPage.do",method=RequestMethod.GET)
	public ModelAndView showMyRequestUI(){
		return null;
	}
	
	@RequestMapping(value="request/ui/modify.do",method=RequestMethod.GET)
	public ModelAndView showEditRequestUI(HttpSession session){
		return null;
	}
	
	@RequestMapping(value="request/ui/search.do",method=RequestMethod.GET)
	public ModelAndView showSearchRequestUI(){
		return null;
	}
	
	@RequestMapping(value="request/ui/detail.do",method=RequestMethod.GET)
	public ModelAndView showDetailRequestUI(String id, String page){
		return null;
	}
	
	@RequestMapping(value="request/ui/inviteList.do",method=RequestMethod.GET)
	public ModelAndView showInviteRequestListUI(String id, String page){
		return null;
	}
	
	
	
	
	//==================mobile -> xml
	
	@RequestMapping(value="request/xml/searchBound.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBound(String bound, String page){
		return null;
	}
	
	@RequestMapping(value="request/xml/searchBoundAndTitle.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBoundAndTitle(String bound, String title, String page){
		return null;
	}
	
	@RequestMapping(value="request/xml/searchBoundAndContent.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBoundAndContent(String bound, String content, String page){
		return null;
	}
	
	@RequestMapping(value="request/xml/searchMyRequests.do", produces="application/xml")
	public @ResponseBody Requests findMyRequests(String page, HttpSession session){
		return new Requests(rService.findRequestByConsumerId(
				(String)session.getAttribute("loginId"), 
				page));
	}

	@RequestMapping(value="request/xml/searchMyRequestsWithMaker.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsWithMaker(String page, HttpSession session){
		return new Requests(rService.findRequestsByConsumerIdWithMaker(
				(String)session.getAttribute("loginId"), 
				page));
	}
	
	@RequestMapping(value="request/xml/searchMyRequestsWithPayment.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsWithPayment(String page, HttpSession session){
		return new Requests(rService.findRequestsByConsumerIdWithPayment(
				(String)session.getAttribute("loginId"), 
				page));
	}
	
	@RequestMapping(value="request/xml/searchMyInviteRequestsForMaker.do", produces="application/xml")
	public @ResponseBody InviteRequests findMyInviteRequestsForMaker(String page, HttpSession session){
		return new InviteRequests(rService.findInviteRequestsByMakerId(
				/*(String)session.getAttribute("loginId")*/"5",
				Constants.FORM_INVITE,
				page));
	}
	
	@RequestMapping(value="request/xml/searchMyInviteRequestsForConsumer.do", produces="application/xml")
	public @ResponseBody InviteRequests findMyInviteRequestsForConsumer(String page, HttpSession session){
		return new InviteRequests(rService.findInviteRequestsByConsumerId(
				/*(String)session.getAttribute("loginId")*/"5",
				Constants.FORM_REQUEST,
				page));
	}
	
	@RequestMapping(value="comment/xml/searchRequestId.do", produces="application/xml")
	public @ResponseBody Comments findCommentsByRequestId(String requestId, String page){
		return new Comments(rService.findCommentsByRequestId(requestId, page));
	}
	
	@RequestMapping(value="attach/xml/searchByRequestId.do", produces="application/xml")
	public @ResponseBody Attachs findAttachsByRequestId(String requestId, String page){
		return new Attachs(rService.findAllAttachsByRequestId(requestId, page));
	}
	
	@RequestMapping(value="attach/xml/searchByRequestIdAndFileName.do", produces="application/xml")
	public @ResponseBody Attachs findAttachsByRequestIdAndFileName(String requestId, String fileName, String page){
		return new Attachs(rService.findAttachsByFileNameAndRequestId(fileName, requestId, page));
	}
	
	@RequestMapping(value="request/xml/searchById.do", produces="application/xml")
	public @ResponseBody Request findRequestById(String id){
		return rService.findRequestById(id);
	}
}