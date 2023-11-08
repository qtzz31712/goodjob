package team.pj.goodjob.resume;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import team.pj.goodjob.resume.ResumeVo;

@Component
public class ResumeDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	SqlSession sqlSession;

	public int insertNewResume(ResumeVo resumeVo) {
		int result = 0;

		result = sqlSession.insert("mapper.resume.insertNewResume", resumeVo);
		return result;
	}

	public List<ResumeVo> selectAllList() {
		List<ResumeVo> resumes = new ArrayList<ResumeVo>();
		resumes = sqlSession.selectList("mapper.resume.selectAllList");
		return resumes.size() > 0 ? resumes : null;

	}

	public int updateResume(ResumeVo resumeVo) {

		int result = -1;
		result = sqlSession.update("mapper.resume.updateResume", resumeVo);
		return result;
	}

	public List<ResumeVo> selectList(String r_u_no) {
		List<ResumeVo> resumes = new ArrayList<ResumeVo>();
		resumes = sqlSession.selectList("mapper.resume.updateResume", r_u_no);
		return resumes.size() > 0 ? resumes : null;
	}

	public ResumeVo selectDetail(int r_u_no) {
		List<ResumeVo> resumeVos = new ArrayList<ResumeVo>();
		resumeVos = sqlSession.selectList("mapper.resume.selectDetail", r_u_no);
		return resumeVos.size() > 0 ? resumeVos.get(0) : null;

	}

	public ResumeVo selectResume(int r_no) {
		List<ResumeVo> resumeVos = new ArrayList<ResumeVo>();
		resumeVos = sqlSession.selectList("mapper.resume.selectResume", r_no);
		return resumeVos.size() > 0 ? resumeVos.get(0) : null;
	}

	public int deleteResume(int r_no) {
		int result = -1;
	result = sqlSession.delete("mapper.resume.deleteResume", r_no);
		return result;
	}

}
