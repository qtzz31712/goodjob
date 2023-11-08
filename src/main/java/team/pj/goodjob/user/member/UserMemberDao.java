package team.pj.goodjob.user.member;


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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;



@Component
public class UserMemberDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/*
	 * public boolean isUserMember(String u_id) {
	 * System.out.println("[UserMemberDao] isUserMember()");
	 * 
	 * String sql = "SELECT COUNT(*) FROM tbl_user " + "WHERE u_id = ?";
	 * 
	 * int result = jdbcTemplate.queryForObject(sql, Integer.class, u_id);
	 * 
	 * return result > 0 ? true : false;
	 * 
	 * }
	 */
	public boolean isUserMember(String a_m_id) throws DataAccessException { 
		int result = 0;
		result = sqlSession.selectOne("mapper.userMember.idCheck", a_m_id);
		return result > 0 ? true : false;
	}	
	
	
	/*
	 * public int insertUserAccount(UserMemberVo userMemberVo) { String sql =
	 * "INSERT INTO tbl_user("; sql += "u_id, "; sql += "u_pw, "; sql += "u_name, ";
	 * sql += "u_rn, "; sql += "u_email, "; sql += "u_addr, "; sql += "u_ph, "; sql
	 * += "u_bd, "; sql += "u_gender, "; sql += "u_focus_com)"; sql +=
	 * " VALUES(?, ?, ?, ?, ?, ?,?,?,?,? )";
	 * 
	 * int result = -1;
	 * 
	 * try {
	 * 
	 * result = jdbcTemplate.update(sql, userMemberVo.getU_id(),
	 * passwordEncoder.encode(userMemberVo.getU_pw()), // userMemberVo.getU_pw(),
	 * userMemberVo.getU_name(), userMemberVo.getU_rn(), userMemberVo.getU_email(),
	 * userMemberVo.getU_addr(), userMemberVo.getU_ph(), userMemberVo.getU_bd(),
	 * userMemberVo.getU_gender(), userMemberVo.getU_focus_com()
	 * 
	 * );
	 * 
	 * } catch (Exception e) { e.printStackTrace();
	 * 
	 * }
	 * 
	 * return result;
	 * 
	 * }
	 */
	
	
	
	public int insertUserAccount(UserMemberVo userMemberVo) throws DataAccessException { 
		int result = -1;
		userMemberVo.setU_pw(passwordEncoder.encode( userMemberVo.getU_pw()));
		result = sqlSession.insert("mapper.userMember.insertUserAccount", userMemberVo);
		return result;
	}
	
	
	public UserMemberVo selectUser(UserMemberVo userMemberVo) {
		
		String sql =  "SELECT * FROM tbl_user "
					+ "WHERE u_id = ?";
		
		List<UserMemberVo> userMemberVos = new ArrayList<UserMemberVo>();
		
		try {
			RowMapper<UserMemberVo> rowMapper = BeanPropertyRowMapper.newInstance(UserMemberVo.class);
			userMemberVos = jdbcTemplate.query(sql, rowMapper, userMemberVo.getU_id());
			
			if (!passwordEncoder.matches(userMemberVo.getU_pw(), userMemberVos.get(0).getU_pw()))
				userMemberVos.clear();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return userMemberVos.size() > 0 ? userMemberVos.get(0) : null;
		
	}
	
	public int updateUserAccount(UserMemberVo userMemberVo) {
		System.out.println("[UserMemberDao] updateUserAccount()");
		
		String sql =  "UPDATE tbl_user SET "
					+ "u_pw = ?, "
					+ "u_name = ?, "
					+ "u_email = ?, "
					+ "u_addr = ?, "
					+ "u_ph = ?, "
					+ "u_bd =?, "
					+ "u_gender = ?, "
					+ "u_focus_com = ?"
							
					+ "WHERE u_no = ?";
		
		int result = -1;
		
		try {
			
			result = jdbcTemplate.update(sql, 
										 passwordEncoder.encode(userMemberVo.getU_pw()),
										 userMemberVo.getU_name(), 
										 userMemberVo.getU_email(), 
										 userMemberVo.getU_addr(), 
										 userMemberVo.getU_ph(), 
										 userMemberVo.getU_bd(), 
										 userMemberVo.getU_gender(), 
										 userMemberVo.getU_focus_com(), 
										 userMemberVo.getU_no());
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
				
		return result;
	}
	
	public UserMemberVo selectUser(int u_no) {
		System.out.println("[UserMemberDao] selectUser()");
		
		String sql =  "SELECT * FROM tbl_user "
					+ "WHERE u_no = ?";
		
		List<UserMemberVo> userMemberVos = new ArrayList<UserMemberVo>();
		
		try {
			
			userMemberVos = jdbcTemplate.query(sql, new RowMapper<UserMemberVo>() {
				
				@Override
				public UserMemberVo mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					UserMemberVo userMemberVo = new UserMemberVo();
					
					userMemberVo.setU_no(rs.getInt("u_no"));
					userMemberVo.setU_id(rs.getString("u_id"));
					userMemberVo.setU_pw(rs.getString("u_pw"));
					userMemberVo.setU_name(rs.getString("u_name"));
					userMemberVo.setU_rn(rs.getString("u_rn"));
					userMemberVo.setU_email(rs.getString("u_email"));
					userMemberVo.setU_addr(rs.getString("u_addr"));
					userMemberVo.setU_ph(rs.getString("u_ph"));
					userMemberVo.setU_bd(rs.getString("u_bd"));
					userMemberVo.setU_gender(rs.getString("u_gender"));
					userMemberVo.setU_focus_com(rs.getString("u_focus_com"));
				
				
					
					return userMemberVo;
					
				}
				
			}, u_no);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return userMemberVos.size() > 0 ? userMemberVos.get(0) : null;
		
	}
	
	public UserMemberVo selectUser(String u_id, String u_name, String u_email) {
		System.out.println("[UserMemberDao] selectUser()");
		
		String sql =  "SELECT * FROM tbl_user "
					+ "WHERE u_id = ? AND u_name = ? AND u_email = ?";
	
		List<UserMemberVo> userMemberVos = new ArrayList<UserMemberVo>();
		
		try {
			
			userMemberVos = jdbcTemplate.query(sql, new RowMapper<UserMemberVo>() {
				
				@Override
				public UserMemberVo mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					UserMemberVo userMemberVo = new UserMemberVo();
					
					userMemberVo.setU_no(rs.getInt("u_no"));
					userMemberVo.setU_id(rs.getString("u_id"));
					userMemberVo.setU_pw(rs.getString("u_pw"));
					userMemberVo.setU_name(rs.getString("u_name"));
					userMemberVo.setU_rn(rs.getString("u_rn"));
					userMemberVo.setU_email(rs.getString("u_email"));
					userMemberVo.setU_addr(rs.getString("u_addr"));
					userMemberVo.setU_ph(rs.getString("u_ph"));
					userMemberVo.setU_bd(rs.getString("u_bd"));
					userMemberVo.setU_gender(rs.getString("u_gender"));
					userMemberVo.setU_focus_com(rs.getString("u_focus_com"));
					
					return userMemberVo;
					
				}
				
			}, u_id, u_name, u_email);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return userMemberVos.size() > 0 ? userMemberVos.get(0) : null;
		
	}
	
	public int updatePassword(String u_id, String newPassword) {
		System.out.println("[UserMemberDao] updatePassword()");
		
		String sql =  "UPDATE tbl_user SET "
					+ "u_pw = ? "
					+ "WHERE u_id = ?";
		
		int result = -1;
		
		try {
			
			result = jdbcTemplate.update(sql, passwordEncoder.encode(newPassword), u_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		return result;
	}
	
}

