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
	
	
	// �ż�, �ŵ� �� ����Ʈ
	public List<HistoryVo> selectTradeType(int tradeType){
		return historyDao.getTradeType(tradeType);
	}
	
	// ���� �˻�
	public List<HistoryVo> searchCurrencyConfirm(String currency){
		return historyDao.getCurrencyType(currency);
	}
	
	// �⺻ ����Ʈ �ҷ�����
	public List<HistoryVo> setTradelist(String reqId){
		return historyDao.getTradelist(reqId);
	}
}
