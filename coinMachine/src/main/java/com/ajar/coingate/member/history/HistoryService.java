package com.ajar.coingate.member.history;

import java.util.List;

import com.ajar.coingate.admin.member.AdminMemberVo;
import com.ajar.coingate.member.history.HistoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class HistoryService {
	
	@Autowired
	HistoryDao historyDao;
	
	
	// 매수, 매도 별 리스트
	public List<HistoryVo> selectTradeType(int tradeType){
		return historyDao.getTradeType(tradeType);
	}
	
	// 코인 검색
	public List<HistoryVo> searchCurrencyConfirm(String currency){
		return historyDao.getCurrencyType(currency);
	}
	
	// 기본 리스트 불러오기
	public List<HistoryVo> setTradelist(String reqId){
		return historyDao.getTradelist(reqId);
	}
}
