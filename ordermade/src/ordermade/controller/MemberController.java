package ordermade.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ordermade.domain.Member;
import ordermade.service.facade.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService service;

	@RequestMapping("/join")
	public String showJoinForm() {
		// join.jsp 화면으로 이동.
		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String showJoinForm(Member member) {
		// 회원가입 **회원가입이 실패하면 join.jsp 화면으로 이동 **회원가입이 성공하면 login.jsp으로 이동
		boolean registered = service.registerMember(member);
		if (!registered) {
			return "join";
		}
		return "login";
	}

	@RequestMapping("/login")
	public String showLoginForm() {
		// login.jsp 화면으로 이동.
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, HttpServletRequest req) {
		/*
		 * 로그인 --아이디와 비밀 번호 일치할 경우 main서블릿으로 이동 --아이디와 비밀 번호 불일치할 경우 login.jsp으로
		 * 이동
		 */

		Member loginedUser = service.findMemberById(member.getId());

		if (loginedUser != null && loginedUser.getPassword().equals(member.getPassword())) {

			HttpSession session = req.getSession();
			session.setAttribute("loginId", member.getId());

			// 여기는 임의로 index2.jsp로
			// 보냄******************************************************************
			return "index2";
		} else {
			return "login";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		// 로그아웃시 메인 서블릿으로 이동
		HttpSession session = req.getSession();
		session.invalidate();
		// 여기는 임의로 index2.jsp로
		// 보냄******************************************************************
		return "index2";
	}

	@RequestMapping(value = "/modifyMember", method = RequestMethod.POST)
	public ModelAndView modifyMemberById(Member memeber) {

		service.modifyMemberById(member);
		
		ModelAndView modelAndView = new ModelAndView("memberRegister");
		modelAndView.addObject("Member", member);

		return modelAndView;
	}

	@RequestMapping("/removeMember")
	public String removeMemberById(HttpServletRequest req) {
		// 회원 탈퇴시 메인 화면으로 이동
		String id = (String) req.getSession().getAttribute("loginId");

		boolean result = service.removeMemberById(id);
		if (result) {
			HttpSession session = req.getSession();
			session.invalidate();
		}
		// 여기는 임의로 index2.jsp로
		// 보냄******************************************************************
		return "index2";
	}
}
