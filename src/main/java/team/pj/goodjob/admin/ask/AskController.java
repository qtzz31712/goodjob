package team.pj.goodjob.admin.ask;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.IOException;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import team.pj.goodjob.admin.ask.util.AskUploadFileService;



@Controller
@RequestMapping("/user/ask")



public class AskController {
@Autowired
AskService askService;

@Autowired
AskUploadFileService uploadFileService;

@GetMapping("/goAskForm")
public String goAskForm() {
	String nextPage="/user/ask/ask_form";
	return nextPage;
}
	
@PostMapping("/insertAskForm")
	public String insertAskForm(AskVo askVo) {
	   String nextPage="/user/ask/ask_list";	
	   System.out.println(askVo.getA_u_type() + "  <-insertController type");
	   
	     int result = askService.insertAskForm(askVo);
	    
	    return "redirect:/user/ask/callAskList";
		
	}
	
@GetMapping("/callAskList")
public ModelAndView callAskList() {
	ModelAndView model = new ModelAndView();
	String nextPage="user/ask/ask_list";
	List<AskVo> askVos = askService.callAskList();
	model.setViewName(nextPage);
	model.addObject("askVos", askVos);
	return model;

}

@GetMapping("/goDetails")
public String goDetails(@RequestParam("a_no") int a_no, Model model) {
	String nextPage="/user/ask/ask_details";
	AskVo askVos = askService.goDetails(a_no);
	model.addAttribute("askVos", askVos);
	return nextPage;

}

@GetMapping("/askModify")
public String askModify(@RequestParam("a_no") int a_no, Model model) {
	String nextPage="/user/ask/modify_ask_form";
	AskVo askVo = askService.goDetails(a_no);
	model.addAttribute("askVo",askVo);
	
	return nextPage;
}

@PostMapping("/askModifyConfirm")
public String askModifyConfirm(AskVo askVo) {
	String nextPage = "user/ask/ask_list";
	int result = askService.askModifyConfirm(askVo);
//	String savedFileName = uploadFileService.upload(file);
//	
//	if (savedFileName != null) {
//		askVo.setA_file(savedFileName);
//		
//		if (result <= 0)
//			nextPage = "user/ask/error";
//	} else {
//		nextPage = "user/ask/error";
//	}
//	
	
	 return "redirect:/user/ask/callAskList";
	
}

@GetMapping("/deleteAskList")
public String deleteAskList(@RequestParam("a_no") int a_no) {
	String nextPage = "user/ask/ask_list";
	System.out.println("컨트롤러 입장");
	int result = askService.deleteAskList(a_no);
	return "redirect:/user/ask/callAskList";
	
}

//
}
