package team.pj.goodjob.job;

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
public class JobService {

	@Autowired
	JobDao jobDao;

	@Autowired
	JavaMailSenderImpl javaMailSenderImpl;
	
	public List<JobVo> getAllJob() {
		return jobDao.selectAllJob();
	}
	
	public List<JobVo> getRecentJob() {
		return jobDao.selectRecentJob();
	}
	
	public List<JobVo> getFilteredJob(JobVo jobVo) {
		return jobDao.selectFilteredJob(jobVo);
	}

	public JobVo createJobConfirm(JobVo jobVo) {
		int registJobVo= jobDao.createJobForm(jobVo);
		return jobVo;

	}

	public List<JobVo> getAllList() {
	
		return jobDao.selectAllList();
	}

	
	public int modifyjobConfirm(JobVo jobVo) {
		System.out.println("[JobrService] modifyJobConfirm()");
		
		return jobDao.updateJobAccount(jobVo);
		
	}
	
	public JobVo getRegistJobVo(int rec_no ) {
		System.out.println("[JobService] getRegistJobVo()");
		
		return jobDao.selectCom(rec_no);
		
	}
	
	public int deleteJobConfirm(int rec_no) {
		System.out.println("서비스");
		return jobDao.deleteJob(rec_no);
	}
	
	public JobVo jobDetail(int rec_no) {
		return jobDao.selectDetail(rec_no);
	}
	
	public int finishJobConfirm(int rec_no) {
		return  jobDao.finishJob(rec_no);
	}
	
	
	public List<JobVo> recruitlist(String rec_c_no) {
		return jobDao.selectList(rec_c_no);
	}
}
