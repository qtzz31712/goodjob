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
		// �α��� �����ϸ� �ٸ� �������� �̵����� ����
		// ������ �α��� �����ߴ� ġ�� �̵�
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
		// �������� ������� �����ؼ� ������ �ٸ��� ����
		// ������ ����ȸ������ ����
		String nextPage = "com/member/modify_account_form";		// ���ȸ��
		nextPage = "user/member/modify_account_form";			// ����ȸ��
		return nextPage;
	}
	
	@RequestMapping(value = "/logout")
	public String logout() {
		// �α׾ƿ� ó���ϰ� Ȩ���� ����
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
