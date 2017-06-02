package ordermade.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private MemberService service;

	@RequestMapping("/join.do") // end
	public String showRegisterUI() {
		// 회원가입 join.jsp 화면으로 이동
		return "member/memberRegister";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST) // end
	public String registerMember(HttpServletRequest request) {
		// 회원가입 **회원가입이 실패하면 memberRegister.jsp 화면으로 이동 **회원가입이 성공하면 login.jsp으로
		// 이동
		String imagePath = Constants.IMAGE_PATH;

		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		Member member = new Member();

		try {
			MultipartRequest mr = new MultipartRequest(request, imagePath, 5 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());

			member.setId(mr.getParameter("id"));
			member.setPassword(mr.getParameter("password"));
			member.setName(mr.getParameter("name"));
			member.setEmail(mr.getParameter("email"));
			member.setAddress(mr.getParameter("address"));
			member.setIntroduce(mr.getParameter("introduce"));
			member.setMemberType(mr.getParameter("memberType"));

			if (member.getMemberType().equals(Constants.MAKER)) {
				member.setLicenseNumber(mr.getParameter("licenseNumber"));
			} else if (member.getMemberType().equals(Constants.CONSUMER)) {
				member.setLicenseNumber("null");
			} else {
				throw new RuntimeException("Invalid MemberType");
			}

			member.setImage(mr.getFile("image").getName());
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (!service.registerMember(member)) {
			return "member/memberRegister";
		} else {
			return "member/login";
		}
	}

	@RequestMapping("/login.do") // end
	public String showLoginUI() {
		// login.jsp 화면으로 이동
		return "member/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST) // end
	public String loginMember(Member member, HttpSession session) {
		// 로그인 --아이디와 비밀 번호 일치할 경우 main/main.do로 이동 --아이디와 비밀 번호 불일치할 경우
		// login.jsp으로 이동
		Member loginedUser = service.findMemberById(member.getId());

		if (loginedUser != null && loginedUser.getPassword().equals(member.getPassword())) {
			session.setAttribute("loginId", loginedUser.getId());
			session.setAttribute("memberType", loginedUser.getMemberType());
			return "redirect:/main/main.do";
		} else {
			return "member/login";
		}
	}

	@RequestMapping("/logout.do") // end
	public String logoutMember(HttpSession session) {
		// 로그아웃시 main/main.do로 이동
		session.invalidate();
		return "redirect:/main/main.do";
	}

	@RequestMapping("/modifyMember.do") // end
	public ModelAndView showEditMyPageUI(HttpSession session) {
		if (checkLogined(session))
			return new ModelAndView("member/login"); // check logined

		// 회원 정보를 불러와 memberModify.jsp화면으로 이동
		return new ModelAndView("member/memberModify").addObject("member",
				service.findMemberById((String) session.getAttribute("loginId")));
	}

	@RequestMapping(value = "/modifyMember.do", method = RequestMethod.POST) // end
	public String modifyMemberById(Member member, HttpSession session) {
		if (checkLogined(session))
			return "member/login"; // check logined

		// 회원 수정후 마이페이지로 이동한다.
		if (service.modifyMemberById(member)) {
			return "redirect:/member/myPage.do";
		} else {
			throw new RuntimeException("Modify member failed");
		}
	}

	@RequestMapping("/removeMember.do") // end
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

	@RequestMapping("/image.do")
	public void getMemberImage(String img, HttpServletResponse resp) throws IOException {
		File image = new File(Constants.IMAGE_PATH + img);
		if (!image.exists()) {
			throw new RuntimeException("No member image");
		}

		try (InputStream in = new BufferedInputStream(new FileInputStream(image));
				OutputStream out = resp.getOutputStream();) {
			byte[] buf = new byte[8096];
			int readByte = 0;
			while ((readByte = in.read(buf)) > -1) {
				out.write(buf, 0, readByte);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private boolean checkLogined(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		return loginId == null || loginId.isEmpty();
	}
}
