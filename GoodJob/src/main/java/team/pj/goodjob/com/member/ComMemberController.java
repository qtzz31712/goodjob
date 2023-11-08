package team.pj.goodjob.com.member;

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

import team.pj.goodjob.user.member.UserMemberVo;


@Controller
@RequestMapping("/com/member")
public class ComMemberController {

	@Autowired
	ComMemberService comMemberService;
	
	@ResponseBody
	@RequestMapping(value="/idCheck/{cmid}", method = {RequestMethod.POST, RequestMethod.GET})
	public Map<String, Boolean> idCheck(@PathVariable("cmid") String c_m_id) {
//		String a_m_id = map.get("a_m_id");
		System.out.println(c_m_id);
		Map<String, Boolean> resultMap = new HashMap<String, Boolean>();
		boolean isMember = comMemberService.idCheck(c_m_id);
		resultMap.put("result", isMember);
		return resultMap;
	}
	
	@GetMapping("/createAccountForm")
	public String createAccountForm() {
		String nextPage = "com/member/create_account_form";
		return nextPage;
	}
	@PostMapping("/createAccountConfirm")
	public String createAccountConfirm(ComMemberVo comMemberVo) {
		
		String nextPage = "com/member/create_account_ok";
		int result =comMemberService.createAccountConfirm(comMemberVo);
		if (result <= 0)
			nextPage = "com/member/create_account_ng";
		return nextPage;
		
	}
	@GetMapping("/loginForm")
	public String loginForm() {
		String nextPage = "com/member/login_form";
		return nextPage;
		
	}
	@PostMapping("/loginConfirm")	
	public String loginConfirm(ComMemberVo comMemberVo, HttpSession session) {
		System.out.println("[ComMemberController] comConfirm()");
		
		String nextPage = "/home";
		
		ComMemberVo loginedComMemberVo = comMemberService.loginConfirm(comMemberVo);
		
		if (loginedComMemberVo == null) {
			nextPage = "com/member/login_ng";
			
		} else {
			session.setAttribute("loginedComMemberVo", loginedComMemberVo);
			session.setMaxInactiveInterval(60 * 30);
			
		}
		
		return nextPage;
		
	}
	@GetMapping("/logoutConfirm")
	public String logoutConfirm(HttpSession session) {
		
		String nextPage = "redirect:/";
		session.invalidate();
		return nextPage;
	}
	@GetMapping("/modifyAccountForm")
	public String modifyAccountForm(HttpSession session) {
		System.out.println("[ComMemberController] modifyAccountForm()");
		
		String nextPage = "com/member/modify_account_form";
		
		ComMemberVo loginedComMemberVo = (ComMemberVo) session.getAttribute("loginedComMemberVo");
		if (loginedComMemberVo == null)
			nextPage = "redirect:/com/member/loginForm";
		
		return nextPage;
		
	}
	@RequestMapping(value = "/modifyAccountConfirm", method = {RequestMethod.POST, RequestMethod.GET})
//	@PostMapping("/modifyAccountConfirm")
	public String modifyAccountConfirm(ComMemberVo comMemberVo, HttpSession session) {
		
		String nextPage = "com/member/modify_account_ok";
		
		int result = comMemberService.modifyAccountConfirm(comMemberVo);
		
		if (result > 0) {
			ComMemberVo loginedComMemberVo = comMemberService.getLoginedComMemberVo(comMemberVo.getC_no());
			
			session.setAttribute("loginedComMemberVo", loginedComMemberVo);
			session.setMaxInactiveInterval(60 * 30);
			
		} else {
			nextPage = "com/member/modify_account_ng";
			
		}
		
		return nextPage;
		
	}
	@GetMapping("/findPasswordForm")
	public String findPasswordForm() {
		System.out.println("[ComMemberController] findPasswordForm()");
		
		String nextPage = "com/member/find_password_form";
		
		return nextPage;
		
	}
	
	/*
	 * 비밀번호 찾기 확인
	 */
//	@RequestMapping(value = "/findPasswordConfirm", method = RequestMethod.POST)
	@PostMapping("/findPasswordConfirm")
	public String findPasswordConfirm(ComMemberVo comMemberVo) {
		System.out.println("[ComMemberController] findPasswordConfirm()");
		
		String nextPage = "com/member/find_password_ok";
		
		int result = comMemberService.findPasswordConfirm(comMemberVo);
		
		if (result <= 0)
			nextPage = "com/member/find_password_ng";
		
		return nextPage;
		
	}
	
}
