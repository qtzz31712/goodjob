package team.pj.goodjob.admin.notice;
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
public class NoticeService {
@Autowired
NoticeDao noticeDao;

	public int insertNoticeForm(NoticeVo noticeVo) {
		return noticeDao.insertNoticeFormDao(noticeVo);
		
	}
	
	public List<NoticeVo> callNoticeList() {
		return noticeDao.callNoticeListDao();
	}
	
	public int modifyNoticeFormConfirm(NoticeVo noticeVo) {
		return noticeDao.modifyNoticeFormConfirmDao(noticeVo);
	}
	
	public NoticeVo noticeDetail(int n_no) {
		return noticeDao.noticeDetailDao(n_no);
		
	}
	
}
