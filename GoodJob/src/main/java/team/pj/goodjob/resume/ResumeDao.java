package team.pj.goodjob.resume;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	public int insertNewResume(ResumeVo resumeVo) {
		int result = 0;

		String sql = "INSERT INTO tbl_resume(";
		sql += " r_title, ";
		sql += " r_edu, ";
		sql += " r_career, ";
		sql += " r_career_date, ";
		sql += " r_mod_date, ";
		sql += " r_hope_loc, ";
		sql += " r_hope_sct, ";
		sql += " r_hope_hrd, ";
		sql += " r_hope_prd, ";
		sql += " r_hope_day, ";
		sql += " r_hope_time, ";
		sql += " r_hope_pay, ";
		sql += " r_des, ";
		sql += " r_u_no) ";
		sql += " VALUES(?, ?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			result = jdbcTemplate.update(sql, resumeVo.getR_title(), resumeVo.getR_edu(), resumeVo.getR_career(),
					resumeVo.getR_career_date(), resumeVo.getR_hope_loc(), resumeVo.getR_hope_sct(),
					resumeVo.getR_hope_hrd(), resumeVo.getR_hope_prd(), resumeVo.getR_hope_day(),
					resumeVo.getR_hope_time(), resumeVo.getR_hope_pay(), resumeVo.getR_des(), resumeVo.getR_u_no()

			);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<ResumeVo> selectAllList() {
		String sql = "SELECT * FROM tbl_resume ";
		List<ResumeVo> resumes = new ArrayList<ResumeVo>();

		try {

			RowMapper<ResumeVo> rowMapper = BeanPropertyRowMapper.newInstance(ResumeVo.class);
			resumes = jdbcTemplate.query(sql, rowMapper);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return resumes.size() > 0 ? resumes : null;

	}

	public int updateResume(ResumeVo resumeVo) {
		System.out.println(resumeVo.getR_u_no() + "뭔데이거 몇인데");
		String sql = "UPDATE tbl_resume SET " + "r_title = ?, " + "r_edu = ?, " + "r_career = ?, "
				+ "r_career_date = ?, " + "r_hope_loc = ?, " + "r_hope_sct = ?, " + "r_hope_hrd = ?, "
				+ "r_hope_prd = ?, " + "r_hope_day = ?, " + "r_hope_time = ?, " + "r_hope_pay = ?, " + "r_des = ? "
				+ "WHERE r_no = ? ";

		int result = -1;

		try {
			result = jdbcTemplate.update(sql, resumeVo.getR_title(), resumeVo.getR_edu(), resumeVo.getR_career(),
					resumeVo.getR_career_date(), resumeVo.getR_hope_loc(), resumeVo.getR_hope_sct(),
					resumeVo.getR_hope_hrd(), resumeVo.getR_hope_prd(), resumeVo.getR_hope_day(),
					resumeVo.getR_hope_time(), resumeVo.getR_hope_pay(), resumeVo.getR_des(), resumeVo.getR_no());

			System.out.println("값은?" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	public List<ResumeVo> selectList(String r_u_no) {
		String sql = "SELECT * FROM tbl_resume WHERE r_u_no = ? ";
		List<ResumeVo> resumes = new ArrayList<ResumeVo>();

		try {

			RowMapper<ResumeVo> rowMapper = BeanPropertyRowMapper.newInstance(ResumeVo.class);
			resumes = jdbcTemplate.query(sql, rowMapper, r_u_no);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return resumes.size() > 0 ? resumes : null;

	}

	public ResumeVo selectDetail(int r_u_no) {
		String sql = "SELECT * FROM tbl_resume WHERE r_u_no = ?";
		List<ResumeVo> resumeVos = new ArrayList<ResumeVo>();

		try {
			RowMapper<ResumeVo> rowMapper = BeanPropertyRowMapper.newInstance(ResumeVo.class);
			resumeVos = jdbcTemplate.query(sql, rowMapper, r_u_no);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return resumeVos.size() > 0 ? resumeVos.get(0) : null;

	}

	public ResumeVo selecResume(int r_no) {
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
