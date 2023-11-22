package com.ajar.coingate.client;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ajar.coingate.admin.member.AdminMemberVo;

@Service
public class ClientDataService {
	@Autowired
	private  ClientIndexDAO cidao;
	
	@Autowired
	private ClientLogDataDAO clddao;
	
	@Autowired
	private ClientTradeDAO ctdao;
	
	

	public String loginRequest(String reqId, String reqPwd) {
		return cidao.loginRequest(reqId, reqPwd);
	}
	public String loginRequest2(String reqId) {
		return cidao.loginRequest2(reqId);
	}

	public void loginedTime(String resId) {
		cidao.loginedTime(resId);
	}
	public List<ClientDataVO> GainEachMemberData(String reqId){
		return cidao.GainEachMemberData(reqId);
	}

	public int GainPlayableQ(String reqId) {
		return cidao.GainPlayableQ(reqId);
	}
	public void UpdatePlayableQ(String reqId, int reqQ) {
		cidao.UpdatePlayableQ(reqId, reqQ);
	}
	public int GainPlayableTimes(String reqId) {
		return cidao.GainPlayableTimes(reqId);
	}

	public int getYourTimeLefted(String reqId) {
		
		return cidao.GainPlayableTimes(reqId);
	}

	public void PostYourTimeLefted(String reqId, int reqTi) {
		cidao.PostYourTimeLefted(reqId, reqTi);
	}

	public BigDecimal reqBalance(String reqId) {
		return cidao.reqBalance(reqId);
	}
	public BigDecimal reqBalanceCoin(String reqId, String curCu) {
		return ctdao.reqBalanceCoin(reqId, curCu);
	}
	

	public void balanceUpdate(String reqId, BigDecimal rqtAll, BigDecimal curPr, String curCu, int whatType, BigDecimal rqtQua, BigDecimal rqtPri) {
		clddao.balanceUpdate(reqId, rqtAll, curPr, curCu, whatType, rqtQua, rqtPri);
		cidao.balanceOnlyUpdate(reqId, rqtAll, whatType);
		ctdao.updateCoin(reqId, rqtQua, whatType, curCu);
		
	}

	public  int createAccount(AdminMemberVo adminMemberVo) {
		return cidao.createAccount(adminMemberVo);
		
	}
	public List<ClientTradeVO> getAllCoins(String reqId) {
		return ctdao.getAllCoins(reqId);
	}
	public List<ClientLogDataVO> getAllCoinTrades(String reqId){
		return clddao.getAllCoinTrades(reqId);
	}
	
	
}
