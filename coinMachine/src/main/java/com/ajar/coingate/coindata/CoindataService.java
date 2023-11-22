package com.ajar.coingate.coindata;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CoindataService {
	//DAO
		@Autowired
		private mainAPIDAO madao;
		@Autowired
		private askbidAPIDAO aadao;
	public void saveCoinDataList(List<mainAPIVO> coinDataList) {
		madao.saveCoinDataList(coinDataList);
		
	}
	public void saveAsksBidsData(List<askbidAPIVO> callingDataList, String checking) {
		aadao.saveAsksBidsData(callingDataList, checking);
		
	}
	public List<mainAPIVO> GetMainApitoTable() {
		return madao.GetMainApitoTable();
	}
	public BigDecimal currentPrices(String currency) {
		return madao.currentPrices(currency);
	}
	public List<mainAPIVO> GetMainApitoTableEACH(String situation, String situ) {
		return madao.GetMainApitoTableEACH(situation, situ);
	}
	public List<mainAPIVO> GetTablesForGraph() {
		return madao.GetTablesForGraph();
	}
	public List<askbidAPIVO> listDataCalling(String whatyou) {
		return aadao.listDataCalling(whatyou);
	}
	public BigDecimal GetExactPrice(String preCur) {
		return madao.ExactPrice(preCur);
	}


}
