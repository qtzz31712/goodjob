package team.pj.goodjob.admin.notice;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team.pj.goodjob.admin.ask.AskVo;

import org.springframework.security.crypto.password.PasswordEncoder;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;


@Component
public class NoticeDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;	
	
	
	public int insertNoticeFormDao(NoticeVo noticeVo) throws DataAccessException {
		
System.out.println("insetInto DAO");
		
		System.out.println(noticeVo.getN_article());
		
		int result = -1;
		result = sqlSession.insert("mapper.notice.insertIntoNotice", noticeVo);
		return result;
		
	}
	
	
	public List<NoticeVo> callNoticeListDao(){
		List<NoticeVo> noticeVos = null;
		noticeVos = sqlSession.selectList("mapper.notice.selectAllList");
		return noticeVos;		
	}
	
	
	public int modifyNoticeFormConfirmDao(NoticeVo noticeVo) {
		int result = -1;
		System.out.println("confirm dao 입장");
		result = sqlSession.update("mapper.notice.updateNotice", noticeVo);
		
		System.out.println("confirm dao 수정완료");
		return result;
	}
	
	
	public NoticeVo noticeDetailDao(int n_no) {
		List<NoticeVo> noticeVos = null;
		System.out.println("dao입장");
		noticeVos = sqlSession.selectList("mapper.notice.selectNoticeNo", n_no);
		System.out.println("수정완료?");
		return noticeVos.size() > 0 ? noticeVos.get(n_no -1) : null;
	}
	
	
}
