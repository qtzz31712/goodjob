package team.pj.goodjob.resume;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import team.pj.goodjob.user.member.UserMemberService;
import team.pj.goodjob.user.member.UserMemberVo;

@Controller
@RequestMapping("/resume")

public class ResumeController {
	@Autowired
	UserMemberService userMemberService;
	@Autowired
	ResumeService resumeService;

	@GetMapping("/createResumeForm")
	public String createResume(HttpSession session) {

		String nextPage = "user/resume/create_resume_form";
		UserMemberVo loginedUserMemberVo = (UserMemberVo) session.getAttribute("loginedUserMemberVo");
		if (loginedUserMemberVo == null)
			return nextPage;
		return nextPage;
	}

	@RequestMapping(value = "/createResumeConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	public String createResumeConfirm(@RequestParam("r_u_no") int r_u_no, ResumeVo resumeVo, Model model) {
			resumeService.createResumeConfirm(resumeVo);
			model.addAttribute("r_u_no", r_u_no);
			return "user/resume/resume_list_ajax";
		}
		
		
	// 개인이 로그인한뒤 나의 이력서 리스트보기
	@RequestMapping(value = "/user/listupResume/{r_u_no}", method = { RequestMethod.POST, RequestMethod.GET })
	public String alistupResume(@PathVariable("r_u_no") String r_u_no, Model model) {
		System.out.print("run"+ r_u_no);
		List<ResumeVo> resumeVos = resumeService.listupResume(r_u_no);
		model.addAttribute("resumeVos", resumeVos);
		return "user/resume/resume_mylist";
	}

	@RequestMapping(value = "/resume_list_ajax", method = { RequestMethod.POST, RequestMethod.GET })
	public String listupResume_form(@RequestParam("r_u_no") String r_u_no, Model model) {
		model.addAttribute("r_u_no", r_u_no);
		return "user/resume/resume_list_ajax";
	}

	@GetMapping(value = "/user/detailResumeForm")
	public String detailResumeForm(@RequestParam("r_u_no") int r_u_no, Model model) {
		// int RuNO = Integer.parseInt(r_u_no);
		ResumeVo resumeVo = resumeService.detailResume(r_u_no);
		model.addAttribute("resumeVo", resumeVo);
		String nextPage = "user/resume/resume_detail";
		return nextPage;
	}

	@RequestMapping(value = "/modifyResumeForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyResumeform(@RequestParam("r_no") int r_no, Model model) {

		String nextPage = "user/resume/modify_resume_form";

		ResumeVo resumeVo = resumeService.getRegistResumeVo(r_no);

		model.addAttribute("resumeVo", resumeVo);

		return nextPage;
	}

	@RequestMapping(value = "/modifyResumeConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyResumeConfirm(@RequestParam("r_u_no") int r_u_no, ResumeVo resumeVo, Model model) {
		resumeService.modifyResumeConfirm(resumeVo);
		model.addAttribute("r_u_no", r_u_no);
		return "user/resume/resume_list_ajax";
	}

	@ResponseBody
	@RequestMapping(value = "/deleteResumeConfirm/{no}/{r_u_no}", method = { RequestMethod.POST, RequestMethod.GET })
	public Map<String, Integer> deleteJobConfirm(@PathVariable("no") int r_no, @PathVariable("r_u_no") int r_u_no) {
		int result = resumeService.deleteResumeConfirm(r_no);
		Map<String, Integer> map = new HashMap<>();
		System.out.println(result);
		map.put("ok", result);
		return map;
	}
}