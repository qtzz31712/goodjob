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
		return jobVos.size() > 0 ? jobVos : null;
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

		int result = -1;
		result = sqlSession.insert("mapper.job.createJobForm", jobVo);
		return result;
	}

	public int updateJobAccount(JobVo jobVo) {
		int result = -1;
		result = sqlSession.update("mapper.job.updateJobAccount", jobVo);
		return result;
	}

	public JobVo selectCom(int rec_no) {

		List<JobVo> jobVos = new ArrayList<JobVo>();
		jobVos = sqlSession.selectList("mapper.job.selectCom", rec_no);
		return jobVos.size() > 0 ? jobVos.get(0) : null;

	}

	public int deleteJob(int rec_no) {
		
		int result = -1;
		result = sqlSession.delete("mapper.job.deleteJob", rec_no);
		return result;
	}

	public JobVo selectDetail(int rec_no) {
		List<JobVo> jobVos = new ArrayList<JobVo>();
		jobVos = sqlSession.selectList("mapper.job.selectDetail", rec_no);
		return jobVos.size() > 0 ? jobVos.get(0) : null;

	}

	public int finishJob(int rec_no) {
		int result = -1;
		result = sqlSession.update("mapper.job.finishJob", rec_no);
		return result;
	}

	public List<JobVo> selectList(String rec_c_no) {
		List<JobVo> jobVos = new ArrayList<JobVo>();
jobVos = sqlSession.selectList("mapper.job.selectList", rec_c_no);
		return jobVos.size() > 0 ? jobVos : null;
	}
}
