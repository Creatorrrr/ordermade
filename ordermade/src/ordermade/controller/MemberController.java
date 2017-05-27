package ordermade.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ordermade.constants.Constants;
import ordermade.domain.Member;
import ordermade.service.facade.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService service;

	@RequestMapping("/join") // end
	public String showRegisterUI() {
		// 회원가입 join.jsp 화면으로 이동
		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST) // end
	public String registerMember(Member member, HttpServletRequest request) {
		// 회원가입 **회원가입이 실패하면 join.jsp 화면으로 이동 **회원가입이 성공하면 login.jsp으로 이동

		String imagePath = Constants.IMAGE_PATH;

		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		try {
			MultipartRequest mr = new MultipartRequest(request, imagePath, 5 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());

			String memberId = mr.getParameter("id");
			String password = mr.getParameter("password");
			String name = mr.getParameter("name");
			String email = mr.getParameter("email");
			String address = mr.getParameter("address");
			String introduce = mr.getParameter("introduce");
			String memberType = mr.getParameter("memberType");
			String license = mr.getParameter("licenseNumber");

			File image = mr.getFile("image");

			member.setId(memberId);
			member.setPassword(password);
			member.setName(name);
			member.setEmail(email);
			member.setAddress(address);
			member.setIntroduce(introduce);
			member.setMemberType(memberType);
			if (memberType.equals("customer")) {
				member.setLicenseNumber("null");
			} else if (memberType.equals("buisnessman")) {
				member.setLicenseNumber(license);
			}

			member.setImage(image.getCanonicalPath());

		} catch (IOException e) {
			e.printStackTrace();
		}

		boolean registered = service.registerMember(member);
		if (!registered) {
			return "member/join";
		} else {
			return "member/login";
		}
	}

	@RequestMapping("/login") // end
	public String showLoginUI() {
		// 로그인 login.jsp화면으로 이동
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST) // end
	public String loginMember(Member member, HttpServletRequest req) {
		/*
		 * 로그인 --아이디와 비밀 번호 일치할 경우 main서블릿으로 이동 --아이디와 비밀 번호 불일치할 경우 login.jsp으로
		 * 이동
		 */

		Member loginedUser = service.findMemberById(member.getId());

		if (loginedUser != null && loginedUser.getPassword().equals(member.getPassword())) {

			HttpSession session = req.getSession();
			session.setAttribute("loginId", member.getId());
			return "index";
			
		} else {
			return "member/login";
		}
	}

	@RequestMapping("/logout") // end
	public String logoutMember(HttpServletRequest req) {
		// 로그아웃시 메인 서블릿으로 이동
		HttpSession session = req.getSession();
		session.invalidate();
		// 여기는 임의로 index2.jsp로
		// 보냄******************************************************************
		return "index";
	}

	@RequestMapping("/modifyMember") // end
	public ModelAndView showEditMyPageUI(HttpServletRequest req) {
		// 회원 정보를 불러와 Modify.jsp화면으로 이동
		String id = (String) req.getSession().getAttribute("loginId");

		Member member = service.findMemberById(id);

		ModelAndView modelAndView = new ModelAndView("member/memberModify");
		modelAndView.addObject("member", member);

		return modelAndView;
	}

	@RequestMapping(value = "/modifyMember", method = RequestMethod.POST) // end
	public ModelAndView modifyMemberById(Member member) {
		// 회원 수정후 마이페이지로 이동한다.
		service.modifyMemberById(member);

		// 여기는 임의로 memberRegister.jsp로
		// 보냄******************************************************************
		ModelAndView modelAndView = new ModelAndView("member/makerMyPage");
		modelAndView.addObject("member", member);

		return modelAndView;
	}

	@RequestMapping("/removeMember") // end
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
		return "index";
	}

	@RequestMapping("/showMyPage")
	public ModelAndView showMyPageUI(HttpServletRequest req) {
		// 자신의 정보를 불러온다. 그 후 마이페이지화면으로 이동
		String id = (String) req.getSession().getAttribute("loginId");

		Member member = service.findMemberById(id);

		// 여기는 임의로 memberRegister.jsp로
		// 보냄******************************************************************
		ModelAndView modelAndView = new ModelAndView("/index");
		modelAndView.addObject("member", member);

		return modelAndView;
	}

	// Mobile용
	public Member findMyMember(HttpServletRequest req) {

		String id = (String) req.getSession().getAttribute("loginId");

		Member member = service.findMemberById(id);

		return member;
	}

}
