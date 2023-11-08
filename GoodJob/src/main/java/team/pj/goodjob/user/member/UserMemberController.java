package team.pj.goodjob.user.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user/member")
public class UserMemberController {
	
	
	
	
	@Autowired
	UserMemberService userMemberService;
	/*
	 * @GetMapping({"", "/"}) public String kim() { String nextPage = "user/home";
	 * return nextPage; }
	 */
	
	
	@ResponseBody
	@RequestMapping(value="/idCheck/{amid}", method = {RequestMethod.POST, RequestMethod.GET})
	public Map<String, Boolean> idCheck(@PathVariable("amid") String a_m_id) {
//		String a_m_id = map.get("a_m_id");
		System.out.println(a_m_id);
		Map<String, Boolean> resultMap = new HashMap<String, Boolean>();
		boolean isMember = userMemberService.idCheck(a_m_id);
		resultMap.put("result", isMember);
		return resultMap;
	}
	
	
	
	
	@GetMapping("/loginForm")
	public String loginForm() {
		String nextPage = "user/member/login_form";
		return nextPage;
		
	}
	//로그인
	@PostMapping("/loginConfirm")	
	public String loginConfirm(UserMemberVo userMemberVo, HttpSession session) {
		System.out.println("[UserMemberController] loginConfirm()");
		
		String nextPage = "/home";
		
		UserMemberVo loginedUserMemberVo = userMemberService.loginConfirm(userMemberVo);
		
		if (loginedUserMemberVo == null) {
			nextPage = "user/member/login_ng";
			
		} else {
			session.setAttribute("loginedUserMemberVo", loginedUserMemberVo);
			session.setMaxInactiveInterval(60 * 30);
			
		}
		
		return nextPage;
		
	}
	@GetMapping("/createAccountForm")
	public String createAccountForm() {
		String nextPage = "user/member/create_account_form";
		return nextPage;
	}
	
	//회원가입
	@PostMapping("/createAccountConfirm")
	public String createAccountConfirm(UserMemberVo userMemberVo) {
		String nextPage = "user/member/create_account_ok";
		
		int result = userMemberService.createAccountConfirm(userMemberVo);
		
		if (result <= 0)
			nextPage = "user/member/create_account_ng";
		
		return nextPage;
		
	}
	
	
	//로그아웃
	@GetMapping("/logoutConfirm")
	public String logoutConfirm(HttpSession session) {
		
		String nextPage = "redirect:/";
		session.invalidate();
		return nextPage;
	}
	
	@GetMapping("/modifyAccountForm")
	public String modifyAccountForm(HttpSession session) {
		System.out.println("[UserMemberController] modifyAccountForm()");
		
		String nextPage = "user/member/modify_account_form";
		
		UserMemberVo loginedUserMemberVo = (UserMemberVo) session.getAttribute("loginedUserMemberVo");
		if (loginedUserMemberVo == null)
			nextPage = "redirect:/user/member/loginForm";
		
		return nextPage;
		
	}
	@RequestMapping(value = "/modifyAccountConfirm", method = {RequestMethod.POST, RequestMethod.GET})
//	@PostMapping("/modifyAccountConfirm")
	public String modifyAccountConfirm(UserMemberVo userMemberVo, HttpSession session) {
		
		String nextPage = "user/member/modify_account_ok";
		
		int result = userMemberService.modifyAccountConfirm(userMemberVo);
		
		if (result > 0) {
			UserMemberVo loginedUserMemberVo = userMemberService.getLoginedUserMemberVo(userMemberVo.getU_no());
			
			session.setAttribute("loginedUserMemberVo", loginedUserMemberVo);
			session.setMaxInactiveInterval(60 * 30);
			
		} else {
			nextPage = "user/member/modify_account_ng";
			
		}
		
		return nextPage;
		
	}
	@GetMapping("/findPasswordForm")
	public String findPasswordForm() {
		System.out.println("[UserMemberController] findPasswordForm()");
		
		String nextPage = "user/member/find_password_form";
		
		return nextPage;
		
	}
	
	/*
	 * 비밀번호 찾기 확인
	 */
//	@RequestMapping(value = "/findPasswordConfirm", method = RequestMethod.POST)
	@PostMapping("/findPasswordConfirm")
	public String findPasswordConfirm(UserMemberVo userMemberVo) {
		System.out.println("[UserMemberController] findPasswordConfirm()");
		
		String nextPage = "user/member/find_password_ok";
		
		int result = userMemberService.findPasswordConfirm(userMemberVo);
		
		if (result <= 0)
			nextPage = "user/member/find_password_ng";
		
		return nextPage;
		
	}
	
}
