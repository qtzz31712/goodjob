package team.pj.goodjob.admin.ask;

import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service

public class AskService {
	@Autowired 
	AskDao askDao;
	public int insertAskForm(AskVo askVo) {
		return askDao.insertAskFormOk(askVo);
	}
	
	public List<AskVo> callAskList(){
		return askDao.callAskListAll();
	}
	
	public AskVo goDetails(int a_no) {
		return askDao.goDetailsDao(a_no);
	}
	
	public int askModifyConfirm(AskVo askVo) {
		return askDao.askModifyConfirmDao(askVo);
	}
	
	public int deleteAskList(int a_no) {
		System.out.println("서비스입장");
		return askDao.deleteAskListDao(a_no);
	}
	
}
