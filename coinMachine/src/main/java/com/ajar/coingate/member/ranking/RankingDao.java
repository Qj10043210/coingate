package com.ajar.coingate.member.ranking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class RankingDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
}
