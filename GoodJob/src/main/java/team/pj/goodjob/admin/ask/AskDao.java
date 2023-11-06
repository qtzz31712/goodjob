package team.pj.goodjob.admin.ask;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.springframework.security.crypto.password.PasswordEncoder;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;


@Component
public class AskDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;	
	
	public int insertAskFormOk(AskVo askVo) throws DataAccessException {
		System.out.println("insetInto DAO");
		
		System.out.println(askVo.getA_email());
		System.out.println(askVo.getA_article());
		System.out.println(askVo.getA_phone());
		System.out.println(askVo.getA_file());
		System.out.println(askVo.getA_u_type());
		System.out.println(askVo.getA_u_no());
		
		int result = -1;
		result = sqlSession.insert("mapper.ask.insertIntoAsk", askVo);
		return result;
		
	}
	
	public List<AskVo> callAskListAll(){
		List<AskVo> askVos = null;
		askVos = sqlSession.selectList("mapper.ask.selectAllList");
		return askVos;		
	}
	
	public AskVo goDetailsDao(int a_no){
		
		List<AskVo> askVos = null;
		askVos = sqlSession.selectList("mapper.ask.selectNo", a_no);
		
		return askVos.size() > 0 ? askVos.get(0) : null;
	}
	
	public int askModifyConfirmDao(AskVo askVo) {
		int result = 0;
		result = sqlSession.update("mapper.ask.updateAsk", askVo);
		System.out.println(askVo.getA_article());
		if (result>0) {
			return result;
		} else {
			return -1;
		}
	
	}
	
	public int deleteAskListDao(int a_no) {
		int result = 0;
		System.out.println("디에이오입장.");
		result = sqlSession.delete("mapper.ask.deleteAsk", a_no);
		System.out.println("삭제되었는가?");
		return result;
	}
	
//	
}
