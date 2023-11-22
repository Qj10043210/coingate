package com.ajar.coingate.coindata;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Date;

import com.ajar.coingate.coindata.external.*;

@Component
public class askbidAPIDAO {
	 @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
	 @Autowired
		EXCoinNamesList cndl;
	 
	public void saveAsksBidsData(List<askbidAPIVO> callingDataList, String checking) {
		List<String> cndls = cndl.getCoinNameDefaultList();
		if(checking.equals("B")) {
			for (String theName : cndls) {
				for (askbidAPIVO callingData : callingDataList) {
					if (theName.equals(callingData.getCurrency())) {
						String sql = "INSERT INTO coingatesch.bids_data" +
								"(currency, bids_price, bids_quant, created_at)" +
								"VALUES(?,?,?,?)";
						Object[] values = {
								callingData.getCurrency(),
								callingData.getBids_Price(),
								callingData.getBids_Quant(),
								callingData.getCreated_At()
						};
						jdbcTemplate.update(sql, values);
					}
				}
			}
		}else {
			for (String theName : cndls) {
				for (askbidAPIVO callingData : callingDataList) {
					if (theName.equals(callingData.getCurrency())) {
						String sql = "INSERT INTO coingatesch.asks_data" +
								"(currency, asks_price, asks_quant, created_at)" +
								"VALUES(?,?,?,?)";
						Object[] values = {
								callingData.getCurrency(),
								callingData.getAsks_Price(),
								callingData.getAsks_Quant(),
								callingData.getCreated_At()
						};
						jdbcTemplate.update(sql, values);
					}
				}
			}
		}
		
	}

	public List<askbidAPIVO> listDataCalling(String whatYou) {
		try {

			String sql3 = "SELECT created_at FROM (SELECT * FROM coingatesch." +
					whatYou +
					"_data ORDER BY id DESC LIMIT 1) subquery ORDER BY id ASC";
			Date theCurrentDate = (Date) jdbcTemplate.queryForObject(sql3, Date.class);
			String sql = "SELECT * FROM " + whatYou + "_data WHERE created_at = '" + theCurrentDate + "'";
			if (whatYou.equals("bids")) {
				return jdbcTemplate.query(sql, (rs, rowNum) -> {
					askbidAPIVO dto = new askbidAPIVO();
					dto.setCurrency(rs.getString("currency"));
					dto.setBids_Price(rs.getBigDecimal("bids_Price"));
					dto.setBids_Quant(rs.getBigDecimal("bids_Quant"));
					dto.setCreated_At(rs.getDate("created_at"));
					return dto;
				});
			} else {
				return jdbcTemplate.query(sql, (rs, rowNum) -> {
					askbidAPIVO dto = new askbidAPIVO();
					dto.setCurrency(rs.getString("currency"));
					dto.setAsks_Price(rs.getBigDecimal("asks_Price"));
					dto.setAsks_Quant(rs.getBigDecimal("asks_Quant"));
					dto.setCreated_At(rs.getDate("created_at"));
					return dto;
				});
			}

		} catch (DataAccessException ex) {
			ex.printStackTrace(); // Example: print the exception to the console
			// You can re-throw the exception to propagate it up the call stack if
			// necessary.
			throw ex;
		}
	}
	
	
	
}
