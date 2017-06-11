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
		if(checkLogined(session)) return "member/login";	// check logined
		request.setMaker(new Member());
		request.setConsumer(new Member());
		request.getConsumer().setId((String)session.getAttribute("loginId"));
		request.setPayment(Constants.PAYMENT_N);
		if(service.registerRequest(request)) {
			return request.getId();
		} else {
			return "error";
		}
	}	//post http://localhost:8080/ordermade/request/xml/register.do
		//{"title":"의뢰\n","maker.id":"maker1","consumer.id":"user1","category":"aaa","content":"ccccc","hopePrice":"10000","price":"10500","bound":"boundsdfsdfjalkfjl"}


	@RequestMapping(value = "request/xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyRequestById(Request request, HttpSession session) {
		String memberType = (String)session.getAttribute("memberType");
		String loginId = (String)session.getAttribute("loginId");
		//System.out.println(request.toString());
		if(request.getId()==null) return "error";//수정할 의뢰서 id를 보내지 않았음.
		Request requestOK = service.findRequestById(request.getId());
		//System.out.println(requestOK.toString());
		if(memberType == Constants.CONSUMER){
			if(loginId != request.getConsumer().getId()) return "error";//로그인한 사람이 아님.
		}else if(memberType == Constants.MAKER){
			if(loginId != request.getMaker().getId()) return "error";//로그인한 사람이 아님.
		}
		
		if(request.getMaker()== null){		//DB member.id null-> fix	
			Member maker = new Member();
			maker.setId("");
			requestOK.setMaker(maker);
		}else{
			requestOK.setMaker(request.getMaker());
		}
		Member consumer = new Member();
		consumer.setId(loginId);//session loginId
		requestOK.setConsumer(consumer);
		requestOK.setCategory(request.getCategory());
		requestOK.setTitle(request.getTitle());
		requestOK.setContent(request.getContent());
		requestOK.setHopePrice(request.getHopePrice());
		//System.out.println(requestOK.toString());
		boolean check = service.modifyRequestById(requestOK);
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

	@RequestMapping(value = "request/xml/modifyBound.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String modifyRequestBound(String requestId, String bound, HttpSession session) {
		// String loginId=(String)session.getAttribute("loginId");
		if(requestId==null) return "error";
		Request requestOK= service.findRequestById(requestId);
	
		if(requestOK.getMaker()== null){		//DB member.id null-> fix	
			Member maker = new Member();
			maker.setId("");
			requestOK.setMaker(maker);
		}
		//System.out.println(requestOK.toString());
		if(bound.equals("1")){
			System.out.println(bound);
			requestOK.setBound(Constants.BOUND_PUBLIC);
		}else if(bound.equals("0")){
			System.out.println(bound);
			requestOK.setBound(Constants.BOUND_PRIVATE);
		}
		System.out.println(requestOK);
		boolean check = service.modifyRequestById(requestOK);
		return check+"";
	}	//GET  http://localhost:8080/ordermade/request/xml/modifyBound.do?requestId=1&bound=1

	

	@RequestMapping(value = "request/xml/modifyMakerId.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String modifyMakerIdToRequest(String requestId, String makerId, HttpSession session) {
		if(requestId == null || makerId == null) return "error";
		Request request= service.findRequestById(requestId);
		request.setMaker(new Member());
		request.getMaker().setId(makerId);
		return service.modifyRequestById(request) + "";
	}	//POST  http://localhost:8080/ordermade/request/xml/modifyMakerId.do
		//{"requestId":"1","makerId":"maker1"}

	@RequestMapping(value = "request/xml/removeMakerId.do", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody String removeMakerIdToRequest(String requestId, HttpSession session) {
		if(requestId == null ) return "error";
		Request request= service.findRequestById(requestId);
		request.setMaker(new Member());
		return service.modifyRequestById(request) + "";
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
	
	@RequestMapping(value = "request/xml/registerInviteRequest.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String registerInviteRequest(InviteRequest inviteRequest, HttpSession session) {
		if(checkLogined(session)) return "error";	// check logined
		if(((String)session.getAttribute("memberType")).equals(Constants.MAKER)) {
			inviteRequest.setMaker(new Member());
			inviteRequest.getMaker().setId((String)session.getAttribute("loginId"));
		} else {
			inviteRequest.setMessage((String)session.getAttribute("loginId") + "님으로부터의 1:1 의뢰입니다.");
		}
		return service.registerInviteRequest(inviteRequest) + "";
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

	// 170531 Complete
	@RequestMapping(value = "comment/xml/modify.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String modifyComment(Comment comment, HttpSession session) {
		if(checkLogined(session)) return "error";	// check logined
		comment.setMember(new Member());
		comment.getMember().setId((String)session.getAttribute("loginId"));
		return service.modifyCommentById(comment) + "";
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
	public ModelAndView showRegisterRequestUI(String makerId, String productTitle, String category) {
		ModelAndView modelAndView = new ModelAndView("request/register");
		if(makerId != null){
			modelAndView.addObject("makerId", makerId);
			modelAndView.addObject("productTitle", productTitle);
			modelAndView.addObject("category", category);
		}
		return modelAndView;
	}	//GET http://localhost:8080/ordermade/request/ui/register.do
		//GET http://localhost:8080/ordermade/request/ui/register.do?makerId=maker1&productId=1
	
	@RequestMapping(value="request/ui/myRequest.do",method=RequestMethod.GET)
	public ModelAndView showMyRequestUI(String page, HttpSession session){
		String loginId = (String)session.getAttribute("loginId");
		String memberType = (String)session.getAttribute("memberType");
		
		if(memberType==null){
			return new ModelAndView("redirect:/member/login.do");//로그인 페이지 전환.
		}
		
		if(page == null || page.isEmpty()) page = "1";
		List<Request> list = null;
		ModelAndView modelAndView = null;
		
		if(memberType.equals(Constants.CONSUMER)){
			list = service.findRequestsByConsumerId(loginId, page);
			modelAndView = new ModelAndView("request/consumerMyRequestList");//나의 의뢰서
		}else if(memberType.equals(Constants.MAKER)){
			list = service.findRequestsByMakerIdExceptPayment(loginId, page);
			modelAndView = new ModelAndView("request/makerMyRequestList");//받은 의뢰서
		}else{
			throw new RuntimeException("error");
		}

		//System.out.println(list.toString());
		modelAndView.addObject("requests", list);
		return modelAndView;
	}
	
	@RequestMapping(value="request/ui/modify.do",method=RequestMethod.GET)
	public ModelAndView showEditRequestUI(String requestId, HttpSession session){
		if(checkLogined(session)) return new ModelAndView("member/login");	// check logined
		return new ModelAndView("request/modify")
				.addObject("request", service.findRequestById(requestId));
	}	//GET  http://localhost:8080/ordermade/request/ui/modify.do?requestId=42
	
	
	// 170531 Complete
	@RequestMapping(value="request/ui/search.do",method=RequestMethod.GET)
	public String showSearchRequestUI(){
		return "request/makerRequestSearch";
	}
	
	// 170531 Complete
	@RequestMapping(value="request/ui/detail.do",method=RequestMethod.GET)
	public ModelAndView showDetailRequestUI(String id, HttpSession session){System.out.println(service.findRequestById(id).getComments());
			return new ModelAndView("request/detail")
					.addObject("request", service.findRequestById(id));
	}
	
	// 170530 Complete
	@RequestMapping(value="request/ui/makerInviteList.do",method=RequestMethod.GET)
	public ModelAndView showMakerInviteRequestListUI(String page, HttpSession session){
		if(page == null || page.isEmpty()) page = "1";
		return new ModelAndView("request/makerInviteList")
				.addObject("inviteRequests", 
						service.findInviteRequestsByMakerId(
								(String)session.getAttribute("loginId"), 
								Constants.FORM_INVITE, 
								page));
	}
	
	// 170530 Complete
	@RequestMapping(value="request/ui/consumerInviteList.do",method=RequestMethod.GET)
	public ModelAndView showConsumerInviteRequestListUI(String page, HttpSession session){
		if(page == null || page.isEmpty()) page = "1";
		return new ModelAndView("request/consumerInviteList")
				.addObject("inviteRequests", 
						service.findInviteRequestsByConsumerId(
								(String)session.getAttribute("loginId"), 
								Constants.FORM_REQUEST, 
								page));
	}
	
	//==================mobile -> xml
	
	// Complete
	@RequestMapping(value="request/xml/searchBound.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBound(String page, String bound){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByBound(Constants.BOUND_PUBLIC, page));
		
//		return new Requests(service.findRequestsByBound(bound, page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchBoundAndTitle.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBoundAndTitle(String title, String page ){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByBoundAndTitle(Constants.BOUND_PUBLIC, title, page));
		
//		return new Requests(service.findRequestsByBoundAndTitle(bound, title, page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchBoundAndContent.do", produces="application/xml")
	public @ResponseBody Requests findRequestsByBoundAndContent(String content, String page,String bound){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByBoundAndContent(Constants.BOUND_PUBLIC, content, page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyRequests.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsByConsumerId(String page, HttpSession session){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByConsumerId((String)session.getAttribute("loginId"), page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyRequestsWithMaker.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsByConsumerIdWithMaker(String page, HttpSession session){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByConsumerIdWithMaker((String)session.getAttribute("loginId"), page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyRequestsWithPayment.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsByConsumerIdWithPayment(String page, HttpSession session){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByConsumerIdWithPayment((String)session.getAttribute("loginId"), page));
	}
	
	@RequestMapping(value="request/xml/searchMyRequestsByMakerId.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsByMakerId(String page, HttpSession session){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByMakerId((String)session.getAttribute("loginId"), page));
	}
	
	@RequestMapping(value="request/xml/searchMyRequestsByMakerIdExceptPayment.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsByMakerIdExceptPayment(String page, HttpSession session){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByMakerIdExceptPayment((String)session.getAttribute("loginId"), page));
	}
	
	@RequestMapping(value="request/xml/searchMyRequestsByMakerIdWithPayment.do", produces="application/xml")
	public @ResponseBody Requests findMyRequestsByMakerIdWithPayment(String page, HttpSession session){
		if(page == null) page = "1";
		return new Requests(service.findRequestsByMakerIdWithPayment((String)session.getAttribute("loginId"), page));
	}
	
	// Complete
	@RequestMapping(value="request/xml/searchMyInviteRequestsForMaker.do", produces="application/xml")
	public @ResponseBody InviteRequests findMyInviteRequestsForMaker(String page, String form, HttpSession session){
		if(page == null) page = "1";
		return new InviteRequests(service.findInviteRequestsByMakerId(
				(String)session.getAttribute("loginId"),
				form,
				page));
	}
	// Complete
	@RequestMapping(value="request/xml/searchMyInviteRequestsForConsumer.do", produces="application/xml")
	public @ResponseBody InviteRequests findMyInviteRequestsForConsumer(String page, String form, HttpSession session){
		if(page == null) page = "1";
		return new InviteRequests(service.findInviteRequestsByConsumerId(
				(String)session.getAttribute("loginId"),
				form,
				page));
	}
	// Complete
	@RequestMapping(value="comment/xml/searchRequestId.do", produces="application/xml")
	public @ResponseBody Comments findCommentsByRequestId(String requestId, String page){
		if(page == null) page = "1";
		return new Comments(service.findCommentsByRequestId(requestId, page));
	}
	// Complete
	@RequestMapping(value="attach/xml/searchByRequestId.do", produces="application/xml")
	public @ResponseBody Attachs findAttachsByRequestId(String requestId, String page){
		if(page == null) page = "1";
		return new Attachs(service.findAllAttachsByRequestId(requestId, page));
	}
	// Complete
	@RequestMapping(value="attach/xml/searchByRequestIdAndFileName.do", produces="application/xml")
	public @ResponseBody Attachs findAttachsByRequestIdAndFileName(String requestId, String fileName, String page){
		if(page == null) page = "1";
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