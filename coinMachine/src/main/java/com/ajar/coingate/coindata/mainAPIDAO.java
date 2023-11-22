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
public class mainAPIDAO {
	 @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
	 @Autowired
		EXCoinNamesList cndl;
	 
	public void saveCoinDataList(List<mainAPIVO> coinDataList) {
		List<String> cndls = cndl.getCoinNameDefaultList();
		for (String theName : cndls) {

			for (mainAPIVO coinsData : coinDataList) {
				if (theName.equals(coinsData.getCurrency())) {
					// Use a SQL query to insert data into the database
					String sql = "INSERT INTO coingatesch.coin_main_api_data " +
							"(currency, opening_price, closing_price, min_price, max_price, " +
							"units_traded, acc_trade_value, prev_closing_price, units_traded_24H, " +
							"acc_trade_value_24H, fluctuate_24H, fluctuate_rate_24H, date, created_at) " +
							"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

				
					Object[] values = {
							coinsData.getCurrency(),
							coinsData.getOpeningPrice(),
							coinsData.getClosingPrice(),
							coinsData.getMinPrice(),
							coinsData.getMaxPrice(),
							coinsData.getUnitsTraded(),
							coinsData.getAccTradeValue(),
							coinsData.getPrevClosingPrice(),
							coinsData.getUnitsTraded24H(),
							coinsData.getAccTradeValue24H(),
							coinsData.getFluctuate24H(),
							coinsData.getFluctuateRate24H(),
							coinsData.getDate(),
							coinsData.getCreatedAt()
					};

					// Execute the insert query
					jdbcTemplate.update(sql, values);
				}
			}
		}
		
	}//saveCoinDataList

	public void saveAsksBidsData(List<askbidAPIVO> callingDataList, String checking) {
		List<String> cndls = cndl.getCoinNameDefaultList();
		if(checking.equals("B")) {
			for (String theName : cndls) {
				for (askbidAPIVO callingData : callingDataList) {
					if (theName.equals(callingData.getCurrency())) {
						String sql = "INSERT INTO coindata.bids_data" +
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
						String sql = "INSERT INTO coindata.asks_data" +
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

	public List<mainAPIVO> GetMainApitoTable() {
		try {

			List<mainAPIVO> vos = new ArrayList<>();
			String sql = "SELECT * FROM (SELECT * FROM coingatesch.coin_main_api_data ORDER BY id DESC LIMIT 98) subquery ORDER BY id ASC";
			return jdbcTemplate.query(sql, (rs, rowNum) -> {
				mainAPIVO dto = new mainAPIVO();
				dto.setCurrency(rs.getString("currency"));
				dto.setOpeningPrice(rs.getBigDecimal("opening_price"));
				dto.setClosingPrice(rs.getBigDecimal("closing_price"));
				dto.setMinPrice(rs.getBigDecimal("min_price"));
				dto.setMaxPrice(rs.getBigDecimal("max_price"));
				dto.setUnitsTraded(rs.getBigDecimal("units_traded"));
				dto.setAccTradeValue(rs.getBigDecimal("acc_trade_value"));
				dto.setPrevClosingPrice(rs.getBigDecimal("prev_closing_price"));
				dto.setUnitsTraded24H(rs.getBigDecimal("units_traded_24H"));
				dto.setAccTradeValue24H(rs.getBigDecimal("acc_trade_value_24H"));
				dto.setFluctuate24H(rs.getBigDecimal("fluctuate_24H"));
				dto.setFluctuateRate24H(rs.getBigDecimal("fluctuate_rate_24H"));
				dto.setCreatedAt(rs.getDate("created_at"));
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

	public BigDecimal currentPrices(String currency) {
		String sql = "SELECT closing_price FROM (SELECT * FROM coingatesch.coin_main_api_data ORDER BY id DESC LIMIT 98)  subquery  WHERE currency= '"
				+ currency + "' ORDER BY id ASC";
		return jdbcTemplate.queryForObject(sql, BigDecimal.class);
	}

	public List<mainAPIVO> GetMainApitoTableEACH(String situation, String situ) {
		
		
		try {

			List<mainAPIVO> vos = new ArrayList<>();
			String sql = "SELECT * FROM (SELECT * FROM coingatesch.coin_main_api_data ORDER BY id DESC LIMIT 98) subquery ORDER BY "+situation +" "+situ;
			return jdbcTemplate.query(sql, (rs, rowNum) -> {
				mainAPIVO dto = new mainAPIVO();
				dto.setCurrency(rs.getString("currency"));
				dto.setOpeningPrice(rs.getBigDecimal("opening_price"));
				dto.setClosingPrice(rs.getBigDecimal("closing_price"));
				dto.setMinPrice(rs.getBigDecimal("min_price"));
				dto.setMaxPrice(rs.getBigDecimal("max_price"));
				dto.setUnitsTraded(rs.getBigDecimal("units_traded"));
				dto.setAccTradeValue(rs.getBigDecimal("acc_trade_value"));
				dto.setPrevClosingPrice(rs.getBigDecimal("prev_closing_price"));
				dto.setUnitsTraded24H(rs.getBigDecimal("units_traded_24H"));
				dto.setAccTradeValue24H(rs.getBigDecimal("acc_trade_value_24H"));
				dto.setFluctuate24H(rs.getBigDecimal("fluctuate_24H"));
				dto.setFluctuateRate24H(rs.getBigDecimal("fluctuate_rate_24H"));
				dto.setCreatedAt(rs.getDate("created_at"));
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

	public List<mainAPIVO> GetTablesForGraph() {
		// TODO Auto-generated method stub

		try {

			List<mainAPIVO> vos = new ArrayList<>();
			String sql = "SELECT * FROM coingatesch.coin_main_api_data subquery ORDER BY id ASC";

			return jdbcTemplate.query(sql, (rs, rowNum) -> {
				mainAPIVO dto = new mainAPIVO();
				dto.setCurrency(rs.getString("currency"));
				dto.setOpeningPrice(rs.getBigDecimal("opening_price"));
				dto.setClosingPrice(rs.getBigDecimal("closing_price"));
				dto.setMinPrice(rs.getBigDecimal("min_price"));
				dto.setMaxPrice(rs.getBigDecimal("max_price"));
				dto.setUnitsTraded(rs.getBigDecimal("units_traded"));
				dto.setAccTradeValue(rs.getBigDecimal("acc_trade_value"));
				dto.setPrevClosingPrice(rs.getBigDecimal("prev_closing_price"));
				dto.setUnitsTraded24H(rs.getBigDecimal("units_traded_24H"));
				dto.setAccTradeValue24H(rs.getBigDecimal("acc_trade_value_24H"));
				dto.setFluctuate24H(rs.getBigDecimal("fluctuate_24H"));
				dto.setFluctuateRate24H(rs.getBigDecimal("fluctuate_rate_24H"));
				dto.setCreatedAt(rs.getDate("created_at"));
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

	public BigDecimal ExactPrice(String preCur) { //원래 client 쪽인데 잘못 씀;;
		String sql = "SELECT closing_price FROM (SELECT * FROM coingatesch.coin_main_api_data ORDER BY id DESC LIMIT 98)  subquery  WHERE currency= ? ORDER BY id ASC";
		return jdbcTemplate.queryForObject(sql, BigDecimal.class, preCur);
	}
	
	
	
}
