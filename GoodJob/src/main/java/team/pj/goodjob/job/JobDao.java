package team.pj.goodjob.job;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Component;
import team.pj.goodjob.job.JobVo;

@Component

public class JobDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<JobVo> selectAllJob() throws DataAccessException {
		// TODO Auto-generated method stub
		List<JobVo> jobVos = null;
		jobVos = sqlSession.selectList("mapper.job.selectAllJob");
		return jobVos;
	}

	public List<JobVo> selectRecentJob() throws DataAccessException {
		// TODO Auto-generated method stub
		List<JobVo> jobVos = null;
		jobVos = sqlSession.selectList("mapper.job.selectRecentJob");
		return jobVos;
	}
	
	public List<JobVo> selectFilteredJob(JobVo jobVo) throws DataAccessException {
		// TODO Auto-generated method stub
		List<JobVo> jobVos = null;
		jobVos = sqlSession.selectList("mapper.job.selectFilteredJob", jobVo);
		return jobVos;
	}

	public int createJobForm(JobVo jobVo) {

		String sql = "INSERT INTO tbl_job(";
		sql += " rec_title, ";
		sql += " rec_due, ";
		sql += " rec_num, ";
		sql += " rec_edu, ";
		sql += " rec_age, ";
		sql += " rec_gender, ";
		sql += " rec_loc, ";
		sql += " rec_pay, ";
		sql += " rec_prd, ";
		sql += " rec_day, ";
		sql += " rec_time, ";
		sql += " rec_sct, ";
		sql += " rec_hrd, ";
		sql += " rec_bnf, ";
		sql += " rec_c_no ) ";
		sql += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		int result = -1;

		try {
			result = jdbcTemplate.update(sql, jobVo.getRec_title(), jobVo.getRec_due(), jobVo.getRec_num(),
					jobVo.getRec_edu(), jobVo.getRec_age(), jobVo.getRec_gender(), jobVo.getRec_loc(),
					jobVo.getRec_pay(), jobVo.getRec_prd(), jobVo.getRec_day(), jobVo.getRec_time(), jobVo.getRec_sct(),
					jobVo.getRec_hrd(), jobVo.getRec_bnf(), jobVo.getRec_c_no());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<JobVo> selectAllList() {
		String sql = "SELECT * FROM tbl_job " + "ORDER BY rec_no DESC ";
		List<JobVo> jobs = new ArrayList<JobVo>();

		try {

			RowMapper<JobVo> rowMapper = BeanPropertyRowMapper.newInstance(JobVo.class);
			jobs = jdbcTemplate.query(sql, rowMapper);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return jobs.size() > 0 ? jobs : null;

	}

	public int updateJobAccount(JobVo jobVo) {
		System.out.println(jobVo.getRec_no() + "찍혀야해");

		String sql = "UPDATE tbl_job SET " + "rec_title = ?, " + "rec_due = ?, " + "rec_num = ?, " + "rec_edu = ?, "
				+ "rec_age = ?, " + "rec_gender = ?, " + "rec_loc = ?, " + "rec_pay = ?, " + "rec_prd = ?, "
				+ "rec_day = ?, " + "rec_time = ?, " + "rec_sct = ?, " + "rec_hrd = ?, " + "rec_bnf = ? "
				+ "WHERE rec_no = ? ";

		int result = -1;

		try {
			result = jdbcTemplate.update(sql, jobVo.getRec_title(), jobVo.getRec_due(), jobVo.getRec_num(),
					jobVo.getRec_edu(), jobVo.getRec_age(), jobVo.getRec_gender(), jobVo.getRec_loc(),
					jobVo.getRec_pay(), jobVo.getRec_prd(), jobVo.getRec_day(), jobVo.getRec_time(), jobVo.getRec_sct(),
					jobVo.getRec_hrd(), jobVo.getRec_bnf(), jobVo.getRec_no());
			System.out.println("값은?" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public JobVo selectCom(int rec_no) {
		System.out.println("[JobDao] selectcom()");

		String sql = "SELECT * FROM tbl_job " + "WHERE rec_no = ?";

		List<JobVo> jobVos = new ArrayList<JobVo>();

		try {
			RowMapper<JobVo> rowMapper = BeanPropertyRowMapper.newInstance(JobVo.class);
			jobVos = jdbcTemplate.query(sql, rowMapper, rec_no);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return jobVos.size() > 0 ? jobVos.get(0) : null;

	}

	public int deleteJob(int rec_no) {
		String sql = "DELETE FROM tbl_job " + "WHERE rec_no = ?";
		System.out.println("DAO?");
		int result = -1;
		System.out.println(result + "값은?");
		try {
			result = jdbcTemplate.update(sql, rec_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}

	public JobVo selectDetail(int rec_no) {
		String sql = "SELECT * FROM tbl_job WHERE rec_no = ?";
		List<JobVo> jobVos = new ArrayList<JobVo>();

		try {
			RowMapper<JobVo> rowMapper = BeanPropertyRowMapper.newInstance(JobVo.class);
			jobVos = jdbcTemplate.query(sql, rowMapper, rec_no);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return jobVos.size() > 0 ? jobVos.get(0) : null;

	}

	public int finishJob(int rec_no) {
		String sql1 = "UPDATE tbl_job SET rec_approval=1, rec_due='마감' WHERE rec_no=?";

		int result = -1;
		try {
			result = jdbcTemplate.update(sql1, rec_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<JobVo> selectList(String rec_c_no) {
		String sql = "SELECT * FROM tbl_job WHERE rec_c_no = ?";
		List<JobVo> jobVos = new ArrayList<JobVo>();

		try {
			RowMapper<JobVo> rowMapper = BeanPropertyRowMapper.newInstance(JobVo.class);
			jobVos = jdbcTemplate.query(sql, rowMapper, rec_c_no);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return jobVos.size() > 0 ? jobVos : null;

	}
}
