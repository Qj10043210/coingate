package com.ajar.coingate.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ajar.coingate.coindata.mainAPIVO;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/client")
public class ClientDataController {
	@Autowired
	private ClientDataService cdsv;
	
	@RequestMapping(value="/logOut", method = {RequestMethod.GET, RequestMethod.POST})
	public String logOut(HttpSession session, HttpServletRequest request) {
		String nextPage = "redirect:/";
//		Model mav = new ModelAndView();
//		mav.setViewName(nextPage);
		HttpSession sessions = request.getSession();
		sessions.removeAttribute("joinedId");
		sessions.removeAttribute("playableQ");
		sessions.removeAttribute("playableTimes");
		return nextPage;
	}
	
	@RequestMapping(value = "/loginRequest", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> loginRequest(@RequestParam("reqId") String reqId, @RequestParam("reqPwd") String reqPwd,@RequestParam("reqSv") int reqSv , HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		String resId = cdsv.loginRequest(reqId, reqPwd);
		
		Map<String, Object> mav = new HashMap<>();
		mav.put("res", resId); //cvo[0] 이 아니다...
		session.setMaxInactiveInterval(60 * 60);
		if(!resId.equals("n_o")) {
			System.out.println(reqSv + "reqSv");
			if(reqSv ==1) {
				session.setAttribute("saveId", reqId);
			}else {
				HttpSession sessions = request.getSession();
				sessions.removeAttribute("saveId");
			}
			 
			 session.setAttribute("joinedId", reqId);
			 session.setAttribute("playableQ", (int) cdsv.GainPlayableQ(reqId));
			 session.setAttribute("playableTimes", (int) cdsv.GainPlayableTimes(reqId));
			 cdsv.loginedTime(resId);
			 List<ClientDataVO> userInfo = cdsv.GainEachMemberData(reqId);
			 mav.put("userInfo", userInfo);
			 
		}
		
		return mav;
	}
	@RequestMapping(value = "/loginRequest2", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String loginRequest2(@RequestParam("reqId") String reqId) {
		String result = cdsv.loginRequest2(reqId);
		return result;
	}
	
	@RequestMapping(value = "/areyouinthere", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> areyouinthere(HttpSession session) {
		Map<String, Object> mav = new HashMap<>();
		 if (session.getAttribute("joinedId") != null) {
	            // Session data is available
	            mav.put("GNid", session.getAttribute("joinedId"));
	            mav.put("GNpq", session.getAttribute("playableQ"));
	            mav.put("GNpt", session.getAttribute("playableTimes"));
	            return mav;
	        } else {
	            // Session data is not available
	        	mav.put("GNid", session.getAttribute(""));
	        	return mav;
	        }
	};
	
	@RequestMapping(value = "/timer", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int getYourTimeLefted(@RequestParam("reqId") String reqId) {
		
		return cdsv.getYourTimeLefted(reqId);
	};
	@RequestMapping(value = "/PostTimer", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void PostTimer(@RequestParam("reqId") String reqId, @RequestParam("newTimes") int reqTi) {
		
		cdsv.PostYourTimeLefted(reqId ,reqTi);
	};
	@RequestMapping(value = "/balance", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public BigDecimal reqBalance(@RequestParam("reqId") String reqId) {
		
		return cdsv.reqBalance(reqId);
	};
	@RequestMapping(value = "/balance2", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public BigDecimal reqBalance2(@RequestParam("reqId") String reqId) {
		
		return cdsv.reqBalance(reqId);
	};
	@RequestMapping(value = "/balanceCoin", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public BigDecimal reqBalanceCoin(@RequestParam("reqId") String reqId, @RequestParam("curCu") String curCu) {
		
		return cdsv.reqBalanceCoin(reqId, curCu);
	};
	
	@RequestMapping(value = "/balanceUpdate", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void balanceUpdate(@RequestParam("reqId") String reqId, @RequestParam("reqBa") BigDecimal rqtAll, @RequestParam("curPr") BigDecimal curPr, @RequestParam("curCu") String curCu,  @RequestParam("tradTy") int whatType, @RequestParam("rqtQu") BigDecimal rqtQua, @RequestParam("rqtPr") BigDecimal rqtPri) {
		cdsv.balanceUpdate(reqId, rqtAll, curPr, curCu, whatType, rqtQua, rqtPri);
		
	};
	
	@RequestMapping(value = "/topMenu", method = {RequestMethod.GET, RequestMethod.POST})

	public String topMenu() {
		return "/members/mypage/Asset";
	}
	@RequestMapping(value = "/gameStart", method = {RequestMethod.GET, RequestMethod.POST})
	public String gameStart(@RequestParam("hiddenIAinput3") String reqSitu, HttpSession session, HttpServletRequest request) {
		request.getSession();
		String reqId = (String) session.getAttribute("joinedId");
		int reqQ = 0;
		if(reqSitu.equals("게임시작")) {
			reqQ = 1;
			cdsv.UpdatePlayableQ(reqId, reqQ);
			session.setAttribute("playableQ", (int) cdsv.GainPlayableQ(reqId));
			return "/index";
		}else if(reqSitu.equals("로그 보기")) {
			return "/members/mypage/Asset";
		}else {
			return "/index";
		}
		
		
	}	
	@RequestMapping(value = "/GAMEOVER", method = {RequestMethod.GET, RequestMethod.POST})
	public String gameOver(HttpSession session, HttpServletRequest request) {
		request.getSession();
		String reqId = (String) session.getAttribute("joinedId");
		int reqQ = 2;
		cdsv.UpdatePlayableQ(reqId, reqQ);
		session.setAttribute("playableQ", (int) cdsv.GainPlayableQ(reqId));
		return "/index";
	}
	@RequestMapping(value = "/getAllCoins", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<ClientTradeVO> getAllCoins(@RequestParam("reqId") String reqId){
		List<ClientTradeVO> cvo = cdsv.getAllCoins(reqId);
		return cvo;
	}
	
	@RequestMapping(value = "/getAllCoinTrades", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<ClientLogDataVO> getAllCoinTrades(@RequestParam("reqId") String reqId){
		List<ClientLogDataVO> cvo = cdsv.getAllCoinTrades(reqId);
		return cvo;
	}

}
