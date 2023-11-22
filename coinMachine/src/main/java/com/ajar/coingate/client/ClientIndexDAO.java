package com.ajar.coingate.client;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.ajar.coingate.admin.member.AdminMemberVo;

@Component
public class ClientIndexDAO {
	 @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
	public String loginRequest(String reqId, String reqPwd) {
		String resId = "n_o";
	    try {
	        String sql = "SELECT user_id FROM coingatesch.user_index_data WHERE user_id = ?";
	        String resultId = jdbcTemplate.queryForObject(sql, String.class, reqId);
	        System.out.println(resultId);
	        if(resultId != null && !resultId.equals("")) {
	        	String sql2 = "SELECT user_pwd FROM coingatesch.user_index_data WHERE user_id = ?";
		        String resultPwd = jdbcTemplate.queryForObject(sql2, String.class, resultId);
		        if(resultPwd.equals(reqPwd)) {
		        	return reqId;
		        }
	        }
	        
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    return resId;
	}
	
	public void loginedTime(String resId) {
		
		String sql = "UPDATE coingatesch.user_index_data SET user_lastJoinedTime = now() WHERE user_id = '"+resId+"'"; 
		try {
			jdbcTemplate.update(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}//loginedTime
	
	public List<ClientDataVO> GainEachMemberData(String reqId){
		try {
		List<ClientDataVO> vos = new ArrayList<>();
		String sql = "SELECT * FROM coingatesch.user_index_data WHERE user_id = ?";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			ClientDataVO dto = new ClientDataVO();
			dto.setUserId(rs.getString("user_id"));
			dto.setUserPwd(rs.getString("user_pwd"));
			dto.setUserEmail(rs.getString("user_email"));
			dto.setUserLevel(rs.getInt("user_level"));
			dto.setUserBalance(rs.getBigDecimal("user_balance"));
			dto.setUserPlayableTime(rs.getInt("user_playableTime"));
			dto.setUserLastJoinedTime(rs.getDate("user_lastJoinedTime"));
			dto.setUserGameON(rs.getInt("user_gameON"));
			return dto;
			
		}, reqId);
		}
		catch (DataAccessException ex) {
			ex.printStackTrace(); // Example: print the exception to the console
			// You can re-throw the exception to propagate it up the call stack if
			// necessary.
			throw ex;
		}
	}

	public int GainPlayableQ(String reqId) {
		String sql = "SELECT user_gameON FROM coingatesch.user_index_data WHERE user_id = ?";
		return (int) jdbcTemplate.queryForObject(sql, int.class, reqId);
	}
	public int GainPlayableTimes(String reqId) {
		String sql = "SELECT user_playableTime FROM coingatesch.user_index_data WHERE user_id = ?";
		return (int) jdbcTemplate.queryForObject(sql, int.class, reqId);
	}

	public void PostYourTimeLefted(String reqId, int reqTi) {
		String sql = "UPDATE coingatesch.user_index_data SET user_playableTime = '"+reqTi+"' WHERE user_id = '"+reqId+"'"; 
		try {
			jdbcTemplate.update(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public BigDecimal reqBalance(String reqId) {
		String sql = "SELECT user_balance FROM coingatesch.user_index_data WHERE user_id = ?";
		return (BigDecimal) jdbcTemplate.queryForObject(sql, BigDecimal.class, reqId);
	}

	public void balanceOnlyUpdate(String reqId, BigDecimal rqtAll, int whatType) {
		if(whatType==0) {
		String sql = "UPDATE coingatesch.user_index_data SET user_balance= user_balance - '"+rqtAll+"' WHERE user_id = '"+reqId+"'"; 
		try {
			jdbcTemplate.update(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}else {
		String sql = "UPDATE coingatesch.user_index_data SET user_balance= user_balance + '"+rqtAll+"' WHERE user_id = '"+reqId+"'"; 
		try {
			jdbcTemplate.update(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
		
	}

	public int createAccount(AdminMemberVo adminMemberVo) {
		int result = 0; //0:존재하는 아이디 1:성공
		String reqId = adminMemberVo.getA_m_id();
		String reqPwd = adminMemberVo.getA_m_pw();
		String reqEmail = adminMemberVo.getA_m_mail();
		System.out.println("making idddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
		System.out.println(reqId + reqPwd + reqEmail);
		String sql = "SELECT COUNT(id) FROM coingatesch.user_index_data WHERE user_id = ?";
		try {
		result = (int) jdbcTemplate.queryForObject(sql, int.class, reqId);
		if(result == 0) {
			String sqlN = "INSERT INTO coingatesch.user_index_data (user_id, user_pwd, user_email) values (?,?,?)";
			jdbcTemplate.update(sqlN, reqId, reqPwd, reqEmail);
			return 1;
		}else { //이미 존재하는 아이디
		return result;}
	}catch (DataAccessException ex) {
			ex.printStackTrace(); // Example: print the exception to the console
			// You can re-throw the exception to propagate it up the call stack if
			// necessary.
			throw ex;
		}
	}

	public String loginRequest2(String reqId) {
		
		int result = 1;
		String sql = "SELECT COUNT(id) FROM coingatesch.user_index_data WHERE user_id = ?";
		try {
			result = (int) jdbcTemplate.queryForObject(sql, int.class, reqId);
			if(result == 0) {
			
			return "yes";
			}else { //이미 존재하는 아이디
			return "no";
		}
	}catch (DataAccessException ex) {
			ex.printStackTrace(); // Example: print the exception to the console
			// You can re-throw the exception to propagate it up the call stack if
			// necessary.
			throw ex;
		}
	}

	public void UpdatePlayableQ(String reqId, int reqQ) {
		String sql = "UPDATE coingatesch.user_index_data SET user_gameON = '"+reqQ+"' WHERE user_id = '"+reqId+"'"; 
		try {
			jdbcTemplate.update(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<ClientDataVO> getRankinglist() {
			try {
			
			String sql = "SELECT * FROM coingatesch.user_index_data  ORDER BY user_balance DESC";
			return jdbcTemplate.query(sql, (rs, rowNum) -> {
				ClientDataVO dto = new ClientDataVO();
				dto.setUserId(rs.getString("user_id"));

				dto.setUserBalance(rs.getBigDecimal("user_balance"));
				
				return dto;
				
			});
			}
			catch (DataAccessException ex) {
				ex.printStackTrace(); // Example: print the exception to the console
				// You can re-throw the exception to propagate it up the call stack if
				// necessary.
				throw ex;
			}
	}

	
}
