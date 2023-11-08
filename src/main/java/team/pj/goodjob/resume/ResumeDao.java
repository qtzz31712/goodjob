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
		String sql = "SELECT * FROM tbl_resume " + "WHERE r_no = ?";
		List<ResumeVo> resumeVos = new ArrayList<ResumeVo>();

		try {

			resumeVos = jdbcTemplate.query(sql, new RowMapper<ResumeVo>() {

				@Override
				public ResumeVo mapRow(ResultSet rs, int rowNum) throws SQLException {

					ResumeVo resumeVo = new ResumeVo();
					resumeVo.setR_no(rs.getInt("r_no"));
					resumeVo.setR_title(rs.getString("r_title"));
					resumeVo.setR_edu(rs.getString("r_edu"));
					resumeVo.setR_career(rs.getString("r_career"));
					resumeVo.setR_career_date(rs.getInt("r_career_date"));
					resumeVo.setR_mod_date(rs.getString("r_mod_date"));
					resumeVo.setR_hope_loc(rs.getString("r_hope_loc"));
					resumeVo.setR_hope_sct(rs.getString("r_hope_sct"));
					resumeVo.setR_hope_hrd(rs.getString("r_hope_hrd"));
					resumeVo.setR_hope_prd(rs.getString("r_hope_prd"));
					resumeVo.setR_hope_day(rs.getString("r_hope_day"));
					resumeVo.setR_hope_time(rs.getString("r_hope_time"));
					resumeVo.setR_hope_pay(rs.getInt("r_hope_pay"));
					resumeVo.setR_des(rs.getString("r_des"));
					resumeVo.setR_u_no(rs.getInt("r_u_no"));
					return resumeVo;
				}

			}, r_no);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return resumeVos.size() > 0 ? resumeVos.get(0) : null;
	}

	public int deleteResume(int r_no) {
		String sql = "DELETE FROM tbl_resume " + "WHERE r_no = ?";
		int result = -1;
		try {
			result = jdbcTemplate.update(sql, r_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}

}
