package com.ajar.coingate.member.ranking;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ajar.coingate.client.ClientDataVO;
import com.ajar.coingate.member.history.HistoryVo;

@Controller
@RequestMapping("/member/ranking")
public class RankingController {
	@Autowired
	RankingService rankingService;
	
	@ResponseBody
	@RequestMapping(value = "/rankinglist", method = {RequestMethod.GET, RequestMethod.POST})
	public List<ClientDataVO> tradelist(HttpSession session, Model model){
		List<ClientDataVO> ranKingVos =  rankingService.setRankinglist();
		System.out.println(ranKingVos);
		return ranKingVos;
	}
}
