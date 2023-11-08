package team.pj.goodjob.user.member;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserMemberVo {
	int      u_no;      // 회원번호
	String   u_id;      // 회원 아이디
	String   u_pw;      // 회원 비밀번호
	String   u_name;      // 회원 이름
	String   u_rn;      // 회원 주민번호
	String   u_email;      // 회원 이메일
	String   u_addr;      // 회원 주소
	String   u_ph;      // 회원 연락처
	String   u_bd;      // 회원 생년월일
	String   u_gender;   // 회원 성별
	String   u_focus_com;   // 회원 관심회사
	
}
