package com.ajar.coingate.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.ResponseEntity;
//a href="/member/afsdsaf"
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService mSer;
	
	@RequestMapping(value = {"/index"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Locale locale, Model model) {
	return "/index";
}
	@RequestMapping(value = {"/asset"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String asset(Locale locale, Model model) {
	return "/members/mypage/Asset";
	}
	
	@RequestMapping(value = {"/tradeHistory"}, method = {RequestMethod.GET,RequestMethod.POST})
		public String tradeHistory(Locale locale, Model model) {
		return "/members/mypage/Trade_history";
	}
	@RequestMapping(value = {"/ranking"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String ranking(Locale locale, Model model) {
		return "/members/mypage/Ranking";
	}
//	@RequestMapping(value = {"/serviceCenterFAQ"}, method = {RequestMethod.GET,RequestMethod.POST})
//	public String serviceCenterFAQ(Locale locale, Model model) {
//	Map<String, Object> dataMap = mSer.dataListFAQ();
//	if(dataMap == null) {
//		
//		return "/members/mypage/Question_add";
//	}else {
//		for (Map.Entry<String, Object> entry : dataMap.entrySet()) {
//		    System.out.println(entry.getKey() + ": " + entry.getValue()); 
//		}
//	
//		model.addAttribute("dataFAQ", dataMap);
//		return "/members/mypage/Service_center_FAQ";}
//		//even just put index, servelt will find index.jsp
//	}
//	@RequestMapping(value = {"/serviceCenterQNA"}, method = {RequestMethod.GET,RequestMethod.POST})
//	public String serviceCenterQNA(Locale locale, Model model) {
//		//we go main page(index)
//		
//		return "/members/mypage/Service_center_QNA";
//		//even just put index, servelt will find index.jsp
//	}
	
	@RequestMapping(value = {"/serviceCenterQnaDetail"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String serviceCenterQnaDetail(Locale locale, Model model) {
		//we go main page(index)
		
		return "/members/mypage/Service_center_QNA_detail";
		//even just put index, servelt will find index.jsp
	}
	@RequestMapping(value = {"/questionAdd"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String questionAdd(Locale locale, Model model) {
		//we go main page(index)
		
		return "/members/mypage/Question_add";
		//even just put index, servelt will find index.jsp
	}
	
	@PostMapping("/addFAQ")
	public String addFAQ(@ModelAttribute MemberVO question_add_form, HttpSession session) {
		System.out.println("controller addFAQ");
		String nextPage = "redirect:/member/serviceCenterFAQ";
		
		//String name = String.valueOf(session.getAttribute("user_id"));
		String name = "temp";
		question_add_form.setA_m_name(name);
		mSer.addFAQ(question_add_form);
		return nextPage;
	}
	
	@RequestMapping(value = "/serviceCenterQNA", method = {RequestMethod.GET,RequestMethod.POST})
	public String serviceCenterQNA(@RequestParam("pageNum") int pageNum, @RequestParam("amount") int amount, Model model) {
		
		String nextPage = "/members/mypage/Service_center_QNA";
		
		Map<String, Object> map = mSer.serviceCenterQNA(pageNum, amount);
		model.addAttribute("memberVOS", map.get("qnaList"));
		model.addAttribute("pageVO", map.get("pageVO"));
		return nextPage;
	}
	
	@PostMapping("/userQuestioncomfirm")
	public String userQuestion(@ModelAttribute MemberVO user_question_form, HttpSession session) {
		//String name = String.valueOf(session.getAttribute("user_id"));
		String name = "qna";
		user_question_form.setA_m_name(name);
		mSer.userQuestion(user_question_form);
		return "redirect:/member/serviceCenterQNA?pageNum=1&amp;amount=15";
	}
	@RequestMapping(value = {"/serviceCenterFAQ"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String serviceCenterFAQ(Locale locale, Model model) {
		//we go main page(index)
		Map<String, List<MemberVO>> dataMap = mSer.dataListFAQ();
		System.out.println("dataMap:");
		if(dataMap == null || dataMap.isEmpty()) {
			List<MemberVO> list = new ArrayList();
			MemberVO mvo = new MemberVO();
			dataMap = new HashMap<>();
			mvo.setA_m_no(1);
			mvo.setA_m_title("데이터가 없습니다");
			mvo.setA_m_class("데이터가 없습니다");
			mvo.setA_m_content("데이터가 없습니다");
			mvo.setA_m_name("데이터가 없습니다");
			mvo.setA_m_type("데이터가 없습니다");
			list.add(mvo);
			dataMap.put("데이터가 없습니다", list);
		}
		for (Map.Entry<String, List<MemberVO>> entry : dataMap.entrySet()) {
		    System.out.println(entry.getKey() + ": " + entry.getValue()); 
		}
		System.out.println(dataMap.size());
		model.addAttribute("dataFAQ", dataMap);
		return "/members/mypage/Service_center_FAQ";
		//even just put index, servelt will find index.jsp
	}
	
	
}
