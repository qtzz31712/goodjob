package team.pj.goodjob.admin.ask;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class AskVo {

	public int a_no;
	public String a_part;
	public String a_article;
	public String a_email;
	public String a_phone;
	 public String a_file;
	public String a_rep_date;
	public String a_rep_article;
	public int a_u_no;
	public String a_u_type;
	
}
