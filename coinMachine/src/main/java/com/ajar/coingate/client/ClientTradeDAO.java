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

@Component
public class ClientTradeDAO {
	@Autowired
	 private JdbcTemplate jdbcTemplate;

	public void updateCoin(String reqId, BigDecimal rqtQua, int whatType, String curCu) {
		int doyou = doyouhavethiscoin(reqId, curCu);
		
		if(whatType == 0) {//매수
			if(doyou>0) {//코인있음
				String sqlR = "UPDATE coingatesch.asset_detail SET currency_num = currency_num + ?  WHERE (user_id = ? AND currency = ?)";
				jdbcTemplate.update(sqlR, rqtQua, reqId, curCu);
			}else { //코인 없음
				String sqlN = "INSERT INTO coingatesch.asset_detail (user_id, currency, currency_num) values (?,?,?)";
				jdbcTemplate.update(sqlN, reqId, curCu, rqtQua);
			}
			
			
		}else { //매도
			String sqlS = "UPDATE coingatesch.asset_detail SET currency_num = currency_num - ?  WHERE (user_id = ? AND currency = ?)";
			jdbcTemplate.update(sqlS, rqtQua, reqId, curCu);
		}
		
	}
	
	public int doyouhavethiscoin(String reqId, String curCu) {
		String sql = "SELECT COUNT(id) FROM coingatesch.asset_detail WHERE user_id = ? AND currency = ?";
		return jdbcTemplate.queryForObject(sql, int.class, reqId, curCu);
	}

	public BigDecimal reqBalanceCoin(String reqId, String curCu) {
		int doyou = doyouhavethiscoin(reqId, curCu);
		if(doyou==0) {
			
			return null;
		}else {
			String sql = "SELECT currency_num FROM coingatesch.asset_detail WHERE user_id = ? AND currency = ?";
			return jdbcTemplate.queryForObject(sql, BigDecimal.class, reqId, curCu);
			
		}
		
	}

	public List<ClientTradeVO> getAllCoins(String reqId) {
		String sql = "SELECT * FROM coingatesch.asset_detail WHERE user_id = ?";
		try {
			return jdbcTemplate.query(sql, (rs, rowNum) -> {
				ClientTradeVO dto = new ClientTradeVO();
				
				dto.setCurrency(rs.getString("currency"));
				dto.setCurrency_num(rs.getBigDecimal("currency_num"));
				
				return dto;
				
			}, reqId);
	}catch (DataAccessException ex) {
			ex.printStackTrace(); // Example: print the exception to the console
			// You can re-throw the exception to propagate it up the call stack if
			// necessary.
			throw ex;
		}
	}
}
