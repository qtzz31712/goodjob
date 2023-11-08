package team.pj.goodjob.com.member;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter

public class ComMemberVo {
	
	int   c_no;      // 회사 고유번호
	String   c_id;      // 회사 아이디
	String   c_pw;      // 회사 비밀번호
	String   c_comname;   // 회사 이름
	String   c_rn;      // 회사 사업자등록번호
	String   c_email;      // 회사 이메일
	String   c_addr;      // 회사 주소
	String   c_comph;      // 회사 연락처
	String   c_hrname;   // 회사 가입자명
	String   c_ceo_name;   // 회사 대표자명
}
