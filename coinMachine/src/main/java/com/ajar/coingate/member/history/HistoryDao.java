package com.ajar.coingate.member.history;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.ajar.coingate.admin.member.AdminMemberVo;
import com.ajar.coingate.member.asset.AssetVo;

import org.springframework.jdbc.core.RowMapper;


@Component
public class HistoryDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	
		
	// 매수, 매도 별 리스트
	public List<HistoryVo> getTradeType(int tradeType) {
		String sql = "SELECT * FROM coingatesch.user_trade_data WHERE trade_type = ? ";
		List<HistoryVo> historys = new ArrayList<>();
		try {
			RowMapper<HistoryVo> rowMapper = BeanPropertyRowMapper.newInstance(HistoryVo.class);
			historys = jdbcTemplate.query(sql, rowMapper, tradeType);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return historys.size() > 0 ?  historys :null;
	}
	
	// 코인 검색
	public List<HistoryVo> getCurrencyType(String currency) {
		String sql = "SELECT * FROM coingatesch.user_trade_data WHERE currency = ? ";
		List<HistoryVo> historys = new ArrayList<>();
		try {
			RowMapper<HistoryVo> rowMapper = BeanPropertyRowMapper.newInstance(HistoryVo.class);
			historys = jdbcTemplate.query(sql, rowMapper, currency);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return historys.size() > 0 ?  historys :null;
	
	}
	
	// 기본 리스트 불러오기
	public List<HistoryVo> getTradelist(String reqId) {
		
		String sql = "SELECT * FROM coingatesch.user_trade_data WHERE user_id = ?";
		
		List<HistoryVo> HistoryVos = new ArrayList<>();
		try {
			RowMapper<HistoryVo> rowMapper = BeanPropertyRowMapper.newInstance(HistoryVo.class);
			HistoryVos = jdbcTemplate.query(sql, rowMapper, reqId);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return HistoryVos.size() > 0 ?  HistoryVos :null;
		}
}

