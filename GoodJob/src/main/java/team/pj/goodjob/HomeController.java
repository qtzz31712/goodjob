package team.pj.goodjob;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/")
	public String home() {
		String nextPage = "/home";
		return nextPage;
	}
	
	/*
	 * @RequestMapping(value = "/login") public String login() { String nextPage =
	 * "/login_form"; return nextPage; }
	 */
	@GetMapping("/login")
	public String login() {
		String nextPage = "/login_form";
		return nextPage;
	}
	
	@RequestMapping(value = "/loginConfirm")
	public String loginConfirm() {
		// 로그인 실패하면 다른 페이지로 이동하지 않음
		// 지금은 로그인 성공했다 치고 이동
		String nextPage = "/home";
		return nextPage;
	}
	
	@RequestMapping(value = "/join")
	public String createAccount() {
		String nextPage = "/select_join";
		return nextPage;
	}
	
	@RequestMapping(value = "/createUserAccountForm")
	public String createUserAccount() {
		String nextPage = "user/member/join_form";
		return nextPage;
	}
	
	@RequestMapping(value = "/createComAccountForm")
	public String createComAccount() {
		String nextPage = "com/member/join_form";
		return nextPage;
	}
	
	@RequestMapping(value = "/modifyAccountForm")
	public String modifyAccountForm() {
		// 개인인지 기업인지 구분해서 페이지 다르게 보냄
		// 지금은 개인회원으로 간주
		String nextPage = "com/member/modify_account_form";		// 기업회원
		nextPage = "user/member/modify_account_form";			// 개인회원
		return nextPage;
	}
	
	@RequestMapping(value = "/logout")
	public String logout() {
		// 로그아웃 처리하고 홈으로 연결
		String nextPage = "home";
		return nextPage;
	}
	
	/*
	 * 
	@RequestMapping(value = "/")
	public String () {
		String nextPage = "";
		return nextPage;
	}
	 
	*/
	
	
}
