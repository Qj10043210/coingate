package com.ajar.coingate.member.asset;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.ajar.coingate.coindata.mainAPIVO;
import com.ajar.coingate.member.history.HistoryVo;

import org.springframework.jdbc.core.RowMapper;

@Component
public class AssetDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<AssetVo> selectAllAssets() {
		String sql = "SELECT * FROM coingatesch.asset_detail";
			
		List<AssetVo> assetVos = new ArrayList<>();
		try {
			RowMapper<AssetVo> rowMapper = BeanPropertyRowMapper.newInstance(AssetVo.class);
			assetVos = jdbcTemplate.query(sql, rowMapper);
			System.out.println(assetVos);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(assetVos);
	return assetVos.size() > 0 ?  assetVos :null;
	}
	

}
