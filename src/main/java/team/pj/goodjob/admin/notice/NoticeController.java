package team.pj.goodjob.admin.notice;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import team.pj.goodjob.admin.ask.AskVo;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {

@Autowired
NoticeService noticeService;
	
	@GetMapping("/goNoticeList")
	public String goNoticeList() {
		
		
		return "redirect:/admin/notice/callNoticeList";		
	}
	
	@GetMapping("/goNoticeForm")
	public String goNoticeForm() {
		String nextPage = "/admin/notice/notice_Form";
		return nextPage;
	}
	
	
	@PostMapping("/createNotice")
	public String createNotice(NoticeVo noticeVo) {
		String nextPage = "/admin/notice/notice_list";
		int result = noticeService.insertNoticeForm(noticeVo);
	
		return "redirect:/admin/notice/callNoticeList";
	}
	
	
	@GetMapping("/callNoticeList")
	public ModelAndView callNoticeList() {
		ModelAndView model = new ModelAndView();
		String nextPage="/admin/notice/notice_list";
		List<NoticeVo> noticeVos = noticeService.callNoticeList();
		model.setViewName(nextPage);
		model.addObject("noticeVos", noticeVos);
		return model;

	}

	@GetMapping("/modifyNoticeForm")
	public String modifyNoticeForm(@RequestParam("n_no") int n_no, Model model) {
		String nextPage = "/admin/notice/modify_notice_form";
		NoticeVo noticeVo = noticeService.noticeDetail(n_no);
		model.addAttribute("noticeVo",noticeVo);		
		return nextPage;
	}
	
	@PostMapping("/modifyNoticeFormConfirm")
	public String modifyNoticeFormConfirm(NoticeVo noticeVo) {
		
		int result = noticeService.modifyNoticeFormConfirm(noticeVo);
		
		return "redirect:/admin/notice/callNoticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("n_no") int n_no, Model model) {
		String nextPage = "/admin/notice/notice_detail";
		NoticeVo noticeVo = noticeService.noticeDetail(n_no);
		model.addAttribute("noticeVo", noticeVo);
		return nextPage;
		
	}
	
	
//	
}
