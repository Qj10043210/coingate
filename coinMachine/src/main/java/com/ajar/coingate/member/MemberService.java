package com.ajar.coingate.member;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

		
		@Autowired
		MemberDAO mDAO;
		
		

		public void addFAQ(MemberVO question_add_form) {
			
			mDAO.addFAQ(question_add_form);
		}



		public Map<String, List<MemberVO>> dataListFAQ() {
			// TODO Auto-generated method stub
			return mDAO.dataListFAQ();
		}
		public Map<String, Object> serviceCenterQNA(int pageNum, int amount) {
			Map<String, Object> map = new HashMap<>();
			List<MemberVO> qnaList = mDAO.selectQNA(pageNum, amount);
			int totArticles = mDAO.selectTotArticles();
			PageVO pageVO = new PageVO(pageNum, amount, totArticles);
			map.put("qnaList", qnaList);
			map.put("pageVO", pageVO);
			return map;
		}



		public void userQuestion(MemberVO user_question_form) {
			mDAO.userQuestion(user_question_form);
			
		}
		
		
		
	
}
