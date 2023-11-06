package team.pj.goodjob.user.member;

import java.security.SecureRandom;
import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
@Service
public class UserMemberService {

	final static public int USER_ACCOUNT_ALREADY_EXIST = 0;
	final static public int USER_ACCOUNT_CREATE_SUCCESS = 1;
	final static public int USER_ACCOUNT_CREATE_FAIL = -1;
	@Autowired
	JavaMailSenderImpl javaMailSenderImpl;
	@Autowired
	UserMemberDao userMemberDao;
	public boolean idCheck(String a_m_id) {
		return userMemberDao.isUserMember(a_m_id);
	}

	public int createAccountConfirm(UserMemberVo userMemberVo) {
		boolean isMember = userMemberDao.isUserMember(userMemberVo.getU_id());
		
		if (!isMember) {
			int result = userMemberDao.insertUserAccount(userMemberVo);
			
			if (result > 0)
				return USER_ACCOUNT_CREATE_SUCCESS;
			
			else
				return USER_ACCOUNT_CREATE_FAIL;
			
		} else {
			return USER_ACCOUNT_ALREADY_EXIST;
			
		}

		
	}
	
	
	
	
	public UserMemberVo loginConfirm(UserMemberVo userMemberVo) {
		UserMemberVo loginedUserMemberVo = userMemberDao.selectUser(userMemberVo);
		return loginedUserMemberVo;
	}
	public int modifyAccountConfirm(UserMemberVo userMemberVo) {
		System.out.println("[UserMemberService] modifyAccountConfirm()");
		
		return userMemberDao.updateUserAccount(userMemberVo);
		
	}
	
	public UserMemberVo getLoginedUserMemberVo(int u_no) {
		System.out.println("[UserMemberService] getLoginedUserMemberVo()");
		
		return userMemberDao.selectUser(u_no);
		
	}
	
	public int findPasswordConfirm(UserMemberVo userMemberVo) {
		System.out.println("[UserMemberService] findPasswordConfirm()");
		
		UserMemberVo selectedUserMemberVo = userMemberDao.selectUser(userMemberVo.getU_id(),
																	 userMemberVo.getU_name(), 
																	 userMemberVo.getU_email());
		
		int result = 0;
		
		if (selectedUserMemberVo != null) {
			
			String newPassword = createNewPassword();
			result = userMemberDao.updatePassword(userMemberVo.getU_id(), newPassword);

			if (result > 0)
				sendNewPasswordByMail(userMemberVo.getU_email(), newPassword);
			
		} 
		
		return result;
		
	}
	
	private String createNewPassword() {
		System.out.println("[AdminMemberService] createNewPassword()");
		
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
				mimeMessageHelper.setText("새 비밀번호는 : " + newPassword +"입니다.", true );
				
			}
			
		};
		
		javaMailSenderImpl.send(mimeMessagePreparator);
		
	}
	
	
}
