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

import com.ajar.coingate.coindata.mainAPIVO;

@Component
public class ClientLogDataDAO {
	
	 @Autowired
	 private JdbcTemplate jdbcTemplate;
	
	public void balanceUpdate(String reqId, BigDecimal rqtAll, BigDecimal curPr, String curCu, int whatType, BigDecimal rqtQua, BigDecimal rqtPri) {
									//�� �̸�, �Ѿ�, ��� ���� ����, ���� �̸�, �ŷ�Ÿ��, ���ΰ���, ���� �Է��� ����  
		
		String sql = "INSERT INTO coingatesch.user_trade_data" +
					"(user_id,trade_type, currency, purchase_price, no_of_trade, trade_amount, trade_time, total_trade_amount)"+
					//�ŷ� Ÿ��(0�ż� 1�ŵ�), ��������, ��� ���� ����, ���� ����, ���� �Է��� ����, �ŷ��ð�,  �ŷ� �� �ݾ�//
					"Values(?,?, ?, ?, ?, ?, now(),?)";
		Object[] values = {
			reqId, whatType, curCu, curPr, rqtQua, rqtPri, rqtAll	
		};
		jdbcTemplate.update(sql, values);
	};
	
	public List<ClientLogDataVO> getAllCoinTrades(String reqId){
		String sql = "SELECT * FROM coingatesch.user_trade_data WHERE user_id = ? ORDER BY id";
		List<ClientLogDataVO> vos = new ArrayList<>();
	try {	
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			ClientLogDataVO dto = new ClientLogDataVO();
			dto.setTradeType(rs.getInt("trade_type"));
			dto.setCurrency(rs.getString("currency"));
			dto.setPurchasePrice(rs.getBigDecimal("purchase_price"));
			dto.setNoOfTrade(rs.getBigDecimal("no_of_trade"));
			dto.setTradeAmount(rs.getBigDecimal("trade_amount"));
			dto.setTotalTradeAmount(rs.getBigDecimal("total_trade_amount"));
			dto.setTradeTime(rs.getDate("trade_time"));
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

}
