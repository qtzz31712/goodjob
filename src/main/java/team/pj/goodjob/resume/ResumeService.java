package team.pj.goodjob.resume;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;


@Service
public class ResumeService {
	

	@Autowired
	ResumeDao resumeDao;
	
	@Autowired
	JavaMailSenderImpl javaMailSenderImpl;
	
	public ResumeVo createResumeConfirm(ResumeVo resumeVo) {
		 int resgistResumeVo = resumeDao.insertNewResume(resumeVo);
		return resumeVo;
	}
	
	public List<ResumeVo> allListupResume(){
		return resumeDao.selectAllList();
	}
	
	public int modifyResumeConfirm(ResumeVo resumeVo) {
	 return	resumeDao.updateResume(resumeVo);
	}
	
//	public void deleteResumeConfirm(int r_no) {
//		resumeDao.deleteResume(r_no);
//	}
	
	public List<ResumeVo> listupResume(String r_u_no){
		return resumeDao.selectList(r_u_no);
		
	}
	public ResumeVo detailResume(int r_u_no) {
		return resumeDao.selectDetail(r_u_no);
	}
	
	
	public ResumeVo getRegistResumeVo(int r_no) {
		return resumeDao.selectResume(r_no);
	}
	
	public int deleteResumeConfirm(int r_no) {
		return resumeDao.deleteResume(r_no);
	}
}
