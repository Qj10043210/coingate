package com.ajar.coingate.member.history;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ajar.coingate.admin.member.AdminMemberVo;

import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequestMapping("/member/history")
public class HistoryController {
	
	@Autowired
	HistoryService historyService;
	

	// 매수, 매도 별 리스트
	@ResponseBody
	@RequestMapping(value ="/selectTradeType/{tradeType}", method = {RequestMethod.POST, RequestMethod.GET})
	public Map<String, Object> selectTradeType(@PathVariable("tradeType") int tradeType){
		List<HistoryVo> historyVos = historyService.selectTradeType(tradeType);
		Map<String, Object> map = new HashMap<>();
		map.put("trade", historyVos);
		return map;
		
			
	}
	// 코인 검색
	@ResponseBody
	@RequestMapping(value = "/searchCurrencyConfirm/{currency}", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> searchCurrencyConfirm(@PathVariable("currency") String currency) {
		List<HistoryVo> historyVos = historyService.searchCurrencyConfirm(currency);
		Map<String, Object> map = new HashMap<>();
		map.put("currencys", historyVos);
		return map;
		
	}
	// 기본 리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "/tradelist", method = {RequestMethod.GET, RequestMethod.POST})
	public List<HistoryVo> tradelist(HttpSession session, Model model, HttpServletRequest request){
		request.getSession();
		String reqId = (String) session.getAttribute("joinedId");
		List<HistoryVo> historyVos = 
				historyService.setTradelist(reqId);
		model.addAttribute("historyVos", historyVos);
		return historyVos;
	}
}

