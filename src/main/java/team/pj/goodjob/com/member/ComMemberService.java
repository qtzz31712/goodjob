package team.pj.goodjob.com.member;

import java.security.SecureRandom;
import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import team.pj.goodjob.user.member.UserMemberVo;


@Service
public class ComMemberService {

	final static public int USER_ACCOUNT_ALREADY_EXIST = 0;
	final static public int USER_ACCOUNT_CREATE_SUCCESS = 1;
	final static public int USER_ACCOUNT_CREATE_FAIL = -1;
	@Autowired
	JavaMailSenderImpl javaMailSenderImpl;
	@Autowired
	ComMemberDao comMemberDao;
	
	public boolean idCheck(String c_m_id) {
		return comMemberDao.isComMember(c_m_id);
	}
	
	public int createAccountConfirm(ComMemberVo comMemberVo) {
		boolean isMember = comMemberDao.isComMember(comMemberVo.getC_id());
		
		if (!isMember) {
			int result = comMemberDao.insertComAccount(comMemberVo);
			
			if (result > 0)
				return USER_ACCOUNT_CREATE_SUCCESS;
			
			else
				return USER_ACCOUNT_CREATE_FAIL;
			
		} else {
			return USER_ACCOUNT_ALREADY_EXIST;
			
		}

		
	}
	public ComMemberVo loginConfirm(ComMemberVo comMemberVo) {
		ComMemberVo loginedComMemberVo = comMemberDao.selectCom(comMemberVo);
		return loginedComMemberVo;
	}
	public int modifyAccountConfirm(ComMemberVo comMemberVo) {
		System.out.println("[ComMemberService] modifyAccountConfirm()");
		
		return comMemberDao.updateComAccount(comMemberVo);
		
	}
	
	public ComMemberVo getLoginedComMemberVo(int c_no) {
		System.out.println("[ComMemberService] getLoginedComMemberVo()");
		
		return comMemberDao.selectCom(c_no);
		
	}
	
	public int findPasswordConfirm(ComMemberVo comMemberVo) {
		System.out.println("[ComMemberService] findPasswordConfirm()");
		
		ComMemberVo selectedComMemberVo = comMemberDao.selectCom(comMemberVo.getC_id(),
																 comMemberVo.getC_comname(), 
																 comMemberVo.getC_email());
		
		int result = 0;
		
		if (selectedComMemberVo != null) {
			
			String newPassword = createNewPassword();
			result = comMemberDao.updatePassword(comMemberVo.getC_id(), newPassword);

			if (result > 0)
				sendNewPasswordByMail(comMemberVo.getC_email(), newPassword);
			
		} 
		
		return result;
		
	}
	
	private String createNewPassword() {
		System.out.println("[ComMemberService] createNewPassword()");
		
		char[] chars = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
				'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
				'u', 'v', 'w', 'x', 'y', 'z'
				};

		StringBuffer stringBuffer = new StringBuffer();
		SecureRandom secureRandom = new SecureRandom();
		secureRandom.setSeed(new Date().getTime());
		
		int index = 0;
		int length = chars.length;
		for (int i = 0; i < 8; i++) {
			index = secureRandom.nextInt(length);
		
			if (index % 2 == 0) 
				stringBuffer.append(String.valueOf(chars[index]).toUpperCase());
			else
				stringBuffer.append(String.valueOf(chars[index]).toLowerCase());
		
		}
		
		System.out.println("[AdminMemberService] NEW PASSWORD: " + stringBuffer.toString());
		
		return stringBuffer.toString();
		
	}
	
	private void sendNewPasswordByMail(String toMailAddr, String newPassword) {
		System.out.println("[AdminMemberService] sendNewPasswordByMail()");
		
		final MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMessageHelper.setTo(toMailAddr);
				mimeMessageHelper.setSubject("[goodjob] 새 비밀번호 안내입니다.");
				mimeMessageHelper.setText("새 비밀번호는 : " + newPassword +"입니다.!!!!", true );
				
			}
			
		};
		
		javaMailSenderImpl.send(mimeMessagePreparator);
		
	}
	
}
