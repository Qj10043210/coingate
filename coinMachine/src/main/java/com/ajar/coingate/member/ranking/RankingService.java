package com.ajar.coingate.member.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ajar.coingate.client.ClientDataVO;
import com.ajar.coingate.client.ClientIndexDAO;


@Service
public class RankingService {
	
	@Autowired
	ClientIndexDAO cidao;
	public List<ClientDataVO> setRankinglist(){
		return cidao.getRankinglist();
	}
}