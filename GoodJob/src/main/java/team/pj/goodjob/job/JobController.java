package team.pj.goodjob.job;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.MissingServletRequestParameterException;

import team.pj.goodjob.com.member.ComMemberVo;

@Controller
@RequestMapping(value = "/job")
public class JobController {

	@Autowired
	JobService jobService;
	
	@RequestMapping(value={"/", ""})
	public ModelAndView jobMain() {
		List<JobVo> jobVos = jobService.getAllJob();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job/all_job_list");
		mav.addObject("jobVos", jobVos);
		return mav;
	}
	
	@RequestMapping(value="/recentJob")
	public ModelAndView recentJob() {
		List<JobVo> jobVos = jobService.getRecentJob();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job/job_list_contents");
		mav.addObject("jobVos", jobVos);
		return mav;
	}
	
	@RequestMapping(value="/allJob")
	public ModelAndView allJob() {
		List<JobVo> jobVos = jobService.getAllJob();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job/job_list_contents");
		mav.addObject("jobVos", jobVos);
		return mav;
	}
	
	@RequestMapping(value="/filtered")
	public ModelAndView filteredJob(JobVo jobVo) {
		List<JobVo> jobVos = jobService.getFilteredJob(jobVo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job/filtered_job_list");
		mav.addObject("jobVos", jobVos);
		return mav;
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView detailJob (@RequestParam("rec_no") int rec_no) {
		JobVo jobVo = jobService.jobDetail(rec_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job/job_article");
		mav.addObject("jobVo", jobVo);
		return mav;
	}

	@RequestMapping(value = "/createJob")
	public String createJob(HttpSession session) {

		String nextPage = "/com/job/create_job_form";
		ComMemberVo loginedComMemberVo = (ComMemberVo) session.getAttribute("loginedComMemberVo");
		if (loginedComMemberVo == null)
			return nextPage;
		return nextPage;
	}

	@PostMapping("/createJobConfirm")
	public String createJobConfirm(JobVo jobVo, HttpSession session) {

		String nextPage = "com/job/create_job_form_ok";

		ComMemberVo loginedComMemberVo = (ComMemberVo) session.getAttribute("loginedComMemberVo");

		JobVo registJobVo = jobService.createJobConfirm(jobVo);
		if (registJobVo == null) {
			nextPage = "com/job/create_job_form_ok";
		} else {
			session.setAttribute("registJobVo", registJobVo);
			session.setMaxInactiveInterval(60 * 30);
		}
		return nextPage;

	}

	// 기업이 로그인한뒤 나의 고용 리스트보기
	@RequestMapping(value = "/com/recruitlist", method = { RequestMethod.POST, RequestMethod.GET })
	public String recruitlist(@RequestParam("rec_c_no") String rec_c_no, Model model) {

		model.addAttribute("rec_c_no", rec_c_no);
		return "com/job/allRecruitList";

	}

	@RequestMapping(value = "/com/myallList/{rec_c_no}", method = { RequestMethod.POST, RequestMethod.GET })
	public String myallList(@PathVariable("rec_c_no") String rec_c_no, Model model) {
		List<JobVo> jobVos = jobService.recruitlist(rec_c_no);
		model.addAttribute("jobVos", jobVos);
		String nextPage = "com/job/myList";
		return nextPage;
	}

	@RequestMapping(value = "/com/allList", method = { RequestMethod.POST, RequestMethod.GET })
	public List<JobVo> allList() {
		return jobService.getAllList();
	}

	@RequestMapping(value = "/com/deleteJobArticle")
	public void deleteJobArticle(int no) {
	}

	@RequestMapping(value = "/com/modifyJobForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyJobForm(@RequestParam("rec_no") int rec_no, Model model) {
		String nextPage = "com/job/modify_job_form";

		JobVo jobVo = jobService.getRegistJobVo(rec_no);

		model.addAttribute("jobVo", jobVo);
		return nextPage;
	}

	@RequestMapping(value = "/com/modifyjobConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	// @PostMapping("/modifyJobConfirm")
	public String modifyjobConfirm(JobVo jobVo) {
		System.out.println(jobVo.getRec_c_no() + "컨트롤러2");
		String nextPage = "redirect:/job/com/recruitlist?rec_c_no=" + jobVo.getRec_c_no();
		int result = jobService.modifyjobConfirm(jobVo);
		if (result < 0) {
			nextPage = "com/job/modify_job_form_ng";
		}

		return nextPage;

	}

	@ResponseBody
	@RequestMapping(value = "/com/deleteJobConfirm/{no}", method = { RequestMethod.POST, RequestMethod.GET })
	public Map<String, Integer> deleteJobConfirm(@PathVariable("no") int rec_no) {
		int result = jobService.deleteJobConfirm(rec_no);
		Map<String, Integer> map = new HashMap<>();
		System.out.println(result);
		map.put("ok", result);
		return map;
	}

	@GetMapping(value = "/com/jobDetailForm")
	public String jobDetailForm(@RequestParam("rec_no") int rec_no, Model model) {
		String nextPage = "com/job/job_detail";

		JobVo jobVo = jobService.jobDetail(rec_no);

		model.addAttribute("jobVo", jobVo);

		return nextPage;
	}

	@RequestMapping(value = "/com/finishJobConfirm")
	public String finishJobConfirm(@RequestParam("rec_no") String rec_no, @RequestParam("rec_c_no") String rec_c_no,
			Model model) {

		System.out.println("마감완료?");

		int RecNO = Integer.parseInt(rec_no);

		jobService.finishJobConfirm(RecNO);

		return "redirect:/job/com/recruitlist?rec_c_no=" + rec_c_no;

	}

	String nextPage;

}