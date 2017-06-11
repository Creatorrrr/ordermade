package ordermade.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ordermade.constants.Constants;
import ordermade.domain.Member;
import ordermade.service.facade.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping("/join.do") // end
	public String showRegisterUI() {
		// 회원가입 join.jsp 화면으로 이동
		return "member/memberRegister";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST, produces="text/plain") // end
	public @ResponseBody String registerMember(Member member, HttpServletRequest request) {
		// 회원가입 **회원가입이 실패하면 memberRegister.jsp 화면으로 이동 **회원가입이 성공하면 login.jsp으로
		// 이동
		if(member.getId().equals(service.findMemberById(member.getId()))) {
			return "false";
		}
		return service.registerMember(member) + "";
	}

	@RequestMapping("/login.do") // end
	public String showLoginUI() {
		// login.jsp 화면으로 이동
		return "member/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST, produces="text/plain") // end
	public @ResponseBody String loginMember(Member member, HttpSession session) {
		// 로그인 --아이디와 비밀 번호 일치할 경우 main/main.do로 이동 --아이디와 비밀 번호 불일치할 경우
		// login.jsp으로 이동
		Member loginedUser = service.findMemberById(member.getId());

		if (loginedUser != null && loginedUser.getPassword().equals(member.getPassword())) {
			session.setAttribute("loginId", loginedUser.getId());
			session.setAttribute("memberType", loginedUser.getMemberType());
			return "true";
		} else {
			return "false";
		}
	}

	@RequestMapping("/logout.do") // end
	public String logoutMember(HttpSession session) {
		// 로그아웃시 main/main.do로 이동
		session.invalidate();
		return "redirect:/main/main.do";
	}

	@RequestMapping("/modify.do") // end
	public ModelAndView showEditMyPageUI(HttpSession session) {
		if (checkLogined(session))
			return new ModelAndView("member/login"); // check logined

		// 회원 정보를 불러와 memberModify.jsp화면으로 이동
		return new ModelAndView("member/memberModify").addObject("member",
				service.findMemberById((String) session.getAttribute("loginId")));
	}

	@RequestMapping(value="/modify.do", method=RequestMethod.POST, produces="text/plain") // end
	public @ResponseBody String modifyMemberById(Member member, HttpSession session) {
		if (checkLogined(session))
			return "member/login"; // check logined
		member.setId((String)session.getAttribute("loginId"));
		// 회원 수정후 마이페이지로 이동한다.
		return service.modifyMemberById(member) + "";
	}

	@RequestMapping("/remove.do") // end
	public String removeMemberById(HttpSession session) {
		if (checkLogined(session))
			return "member/login"; // check logined

		// 회원 탈퇴시 메인 화면으로 이동
		if (service.removeMemberById((String) session.getAttribute("loginId"))) {
			session.invalidate();
			return "index";
		} else {
			throw new RuntimeException("Remove member failed");
		}
	}

	@RequestMapping("/myPage.do")
	public ModelAndView showMyPageUI(String makerId, HttpSession session) {
		// 다른 사람이 나의 페이지를 이동할 때 profile 
		if (makerId == null) {
			if (checkLogined(session))
				return new ModelAndView("member/login"); // check logined

			// 자신의 정보를 불러온다. 그 후 마이페이지화면으로 이동
			String memberType = (String) session.getAttribute("memberType");

			if (memberType.equals(Constants.CONSUMER)) {
				return new ModelAndView("/member/consumerMyPage").addObject("member",
						service.findMemberById((String) session.getAttribute("loginId")));
			} else if (memberType.equals(Constants.MAKER)) {
				return new ModelAndView("/member/makerMyPage").addObject("member",
						service.findMemberById((String) session.getAttribute("loginId")));
			} else {
				throw new RuntimeException("No such membertype");
			}
		} else {

			Member profile = service.findMemberById(makerId);

			if (profile.getMemberType().equals(Constants.CONSUMER)) {
				return new ModelAndView("/member/consumerMyPage").addObject("member", profile);
			} else if (profile.getMemberType().equals(Constants.MAKER)) {
				return new ModelAndView("/member/makerMyPage").addObject("member", profile);
			} else {
				throw new RuntimeException("No such membertype");
			}
		}
	}

	// Mobile용
	// http://localhost:8080/ordermade/member/xml/myPage.do
	@RequestMapping(value = "/xml/myPage.do", produces = "application/xml")
	public @ResponseBody Member findMyMember(HttpSession session) {
		return service.findMemberById((String) session.getAttribute("loginId"));
	}

	private boolean checkLogined(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		return loginId == null || loginId.isEmpty();
	}
}
