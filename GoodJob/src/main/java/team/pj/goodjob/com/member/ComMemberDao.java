package team.pj.goodjob.com.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import team.pj.goodjob.user.member.UserMemberVo;




@Component
public class ComMemberDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	public boolean isComMember(String c_id) {
		System.out.println("[UserMemberDao] isComMember()");
		
		String sql =  "SELECT COUNT(*) FROM tbl_com "
					+ "WHERE c_id = ?";
		
		int result = jdbcTemplate.queryForObject(sql, Integer.class, c_id);
		
		return result > 0 ? true : false;
		
	}

	public int insertComAccount(ComMemberVo comMemberVo) {
		String sql = "INSERT INTO tbl_com(";
		sql += "c_id, ";
		sql += "c_pw, ";
		sql += "c_comname, ";
		sql += "c_rn, ";
		sql += "c_email, ";
		sql += "c_addr, ";
		sql += "c_comph, ";
		sql += "c_hrname, ";
		sql += "c_ceo_name)"; 
		sql += " VALUES(?, ?, ?, ?, ?, ?,?,?,? )";
		
		int result = -1;
		
		try {
			
			result = jdbcTemplate.update(sql, 
											 comMemberVo.getC_id(), 
											 passwordEncoder.encode(comMemberVo.getC_pw()), 
											// ComMemberVo.getC_pw(), 
											 comMemberVo.getC_comname(), 
											 comMemberVo.getC_rn(), 
											 comMemberVo.getC_email(), 
											 comMemberVo.getC_addr(), 
											 comMemberVo.getC_comph(),
											 comMemberVo.getC_hrname(), 
											 comMemberVo.getC_ceo_name()
											
											 
											);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return result;
		
	}
	public ComMemberVo selectCom(ComMemberVo comMemberVo) {
		
		String sql =  "SELECT * FROM tbl_com "
					+ "WHERE c_id = ?";
		
		List<ComMemberVo> comMemberVos = new ArrayList<ComMemberVo>();
		
		try {
			RowMapper<ComMemberVo> rowMapper = BeanPropertyRowMapper.newInstance(ComMemberVo.class);
			comMemberVos = jdbcTemplate.query(sql, rowMapper, comMemberVo.getC_id());
			
			if (!passwordEncoder.matches(comMemberVo.getC_pw(), comMemberVos.get(0).getC_pw()))
				comMemberVos.clear();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return comMemberVos.size() > 0 ? comMemberVos.get(0) : null;
		
	}
	public int updateComAccount(ComMemberVo comMemberVo) {
		System.out.println("[ComMemberDao] updateComAccount()");
		
		String sql =  "UPDATE tbl_com SET "
					+ "c_pw = ?, "
					+ "c_comname = ?, "
					+ "c_email = ?, "
					+ "c_addr = ?, "
					+ "c_comph =?, "
					+ "c_hrname = ?, "
					+ "c_ceo_name = ? "
							
					+ "WHERE c_no = ?";
		
		int result = -1;
		
		try {
			
			result = jdbcTemplate.update(sql, 
										 passwordEncoder.encode(comMemberVo.getC_pw()),
										 comMemberVo.getC_comname(), 
										 comMemberVo.getC_email(), 
										 comMemberVo.getC_addr(), 
										 comMemberVo.getC_comph(), 
										 comMemberVo.getC_hrname(), 
										 comMemberVo.getC_ceo_name(), 
										 
										 comMemberVo.getC_no());
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
				
		return result;
	}
	
	public ComMemberVo selectCom(int c_no) {
		System.out.println("[UserMemberDao] selectUser()");
		
		String sql =  "SELECT * FROM tbl_com "
					+ "WHERE c_no = ?";
		
		List<ComMemberVo> comMemberVos = new ArrayList<ComMemberVo>();
		
		try {
			
			comMemberVos = jdbcTemplate.query(sql, new RowMapper<ComMemberVo>() {
				
				@Override
				public ComMemberVo mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					ComMemberVo comMemberVo = new ComMemberVo();
					
					comMemberVo.setC_no(rs.getInt("c_no"));
					comMemberVo.setC_id(rs.getString("c_id"));
					comMemberVo.setC_pw(rs.getString("c_pw"));
					comMemberVo.setC_comname(rs.getString("c_comname"));
					comMemberVo.setC_rn(rs.getString("c_rn"));
					comMemberVo.setC_email(rs.getString("c_email"));
					comMemberVo.setC_addr(rs.getString("c_addr"));
					comMemberVo.setC_comph(rs.getString("c_comph"));
					comMemberVo.setC_hrname(rs.getString("c_hrname"));
					comMemberVo.setC_ceo_name(rs.getString("c_ceo_name"));
					
				
				
					
					return comMemberVo;
					
				}
				
			}, c_no);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return comMemberVos.size() > 0 ? comMemberVos.get(0) : null;
		
	}
	
	public ComMemberVo selectCom(String c_id, String c_comname, String c_email) {
		System.out.println("[ComMemberDao] selectCom()");
		
		String sql =  "SELECT * FROM tbl_com "
					+ "WHERE c_id = ? AND c_comname = ? AND c_email = ?";
	
		List<ComMemberVo> comMemberVos = new ArrayList<ComMemberVo>();
		
		try {
			
			comMemberVos = jdbcTemplate.query(sql, new RowMapper<ComMemberVo>() {
				
				@Override
				public ComMemberVo mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					ComMemberVo comMemberVo = new ComMemberVo();
										
					
					comMemberVo.setC_no(rs.getInt("c_no"));
					comMemberVo.setC_id(rs.getString("c_id"));
					comMemberVo.setC_pw(rs.getString("c_pw"));
					comMemberVo.setC_comname(rs.getString("c_comname"));
					comMemberVo.setC_rn(rs.getString("c_rn"));
					comMemberVo.setC_email(rs.getString("c_email"));
					comMemberVo.setC_addr(rs.getString("c_addr"));
					comMemberVo.setC_comph(rs.getString("c_comph"));
					comMemberVo.setC_hrname(rs.getString("c_hrname"));
					comMemberVo.setC_ceo_name(rs.getString("c_ceo_name"));
					
					
					return comMemberVo;
					
				}
				
			}, c_id, c_comname, c_email);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return comMemberVos.size() > 0 ? comMemberVos.get(0) : null;
		
	}
	
	public int updatePassword(String c_id, String newPassword) {
		System.out.println("[UserMemberDao] updatePassword()");
		
		String sql =  "UPDATE tbl_com SET "
					+ "c_pw = ? "
					+ "WHERE c_id = ?";
		
		int result = -1;
		
		try {
			
			result = jdbcTemplate.update(sql, passwordEncoder.encode(newPassword), c_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		return result;
	}
	
}
