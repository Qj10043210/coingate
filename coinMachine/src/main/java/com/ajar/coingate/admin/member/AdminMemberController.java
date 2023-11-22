package com.ajar.coingate.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ajar.coingate.client.*;
@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	AdminMemberService adminMemberService;
	
	@Autowired
	ClientDataService cdsv;
	
	@ResponseBody
	@RequestMapping(value = "/idCheck/{amid}", method = {RequestMethod.POST, RequestMethod.GET})
	public Map<String, Boolean> idCheck(@PathVariable("amid") String a_m_id) {
		//String id = map.get("a_m_id");
		Map<String, Boolean> resultMap = new HashMap<String, Boolean>();
		boolean isMember = adminMemberService.idCheck(a_m_id);
		resultMap.put("result", isMember);
		return resultMap;
	}
	
	
//	@RequestMapping(value = "/createAccountForm", method = RequestMethod.GET)
	@GetMapping("/createAccountForm")
	public String createAccountForm() {
		//System.out.println("[AdminMemberController] createAccountForm()");
		String nextPage = "admin/member/create_account_form";
		return nextPage;	
	}
	
//	@PostMapping("/createAccountConfirm")
//	public String createAccountConfirm(AdminMemberVo adminMemberVo){
//		String nextPage = "/index";
//		int result = adminMemberService.createAccountConfirm(adminMemberVo);
//		if (result <= 0) {
//			nextPage = "/index";
//		}
//		
//		return nextPage;
//	}
//	
	@PostMapping("/createAccountConfirm")
	public String createAccountConfirm(AdminMemberVo adminMemberVo, HttpSession session){
		String nextPage = "/index";
		int result = cdsv.createAccount(adminMemberVo);
		System.out.println("ddddddddddddddddddddddddddddddddddddddddddddddddddddd");
		System.out.println(adminMemberVo);
		session.setMaxInactiveInterval(1 * 60);
		if(result == 0) {
			session.setAttribute("createdId", "wrong");
		}else {
			session.setAttribute("createdId", "good");
		}
		return nextPage;
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		String nextPage = "admin/member/login_form";
		return nextPage;
	}
	
	@PostMapping("/loginConfirm")
	public String loginConfirm(AdminMemberVo adminMemberVo, HttpSession session) {
		String nextPage = "admin/member/login_ok";
		AdminMemberVo loginedAdminMemberVo = adminMemberService.loginConfirm(adminMemberVo);
		if (loginedAdminMemberVo==null) {
			nextPage = "admin/member/login_ng";
		} else {
			session.setAttribute("loginedAdminMemberVo", loginedAdminMemberVo);
			session.setMaxInactiveInterval(60 * 30);   
		}
		return nextPage;
	}
	
	@GetMapping("/logoutConfirm")
	public String logoutConfirm(HttpSession session) {
		String nextPage = "redirect:/admin";
		session.invalidate();
		return nextPage;
	}
	
//	관리자 목록
//	@GetMapping("/listupAdmin")
//	public ModelAndView listupAdmin() {
//		String nextPage = "admin/member/listup_admins";
//		List<AdminMemberVo> adminMemberVos = adminMemberService.listupAdmin();
//		
//		ModelAndView modelAndView = new ModelAndView();	
//		modelAndView.setViewName(nextPage);
//		modelAndView.addObject("adminMemberVos", adminMemberVos);
//		
//		return modelAndView;
//	}
	
//	관리자 승인
//	@GetMapping("/setAdminApproval")
//	public String setAdminApproval(@RequestParam("a_m_no") int a_m_no){
//		String nextPage = "redirect:/admin/member/listupAdmin";
//		
//		adminMemberService.setAdminApproval(a_m_no);
//		
//		return nextPage;
//	}
	
	@GetMapping("/modifyAccountForm")
	public String modifyAccountForm(HttpSession session) {
		String nextPage = "admin/member/modify_account_form";
		
		AdminMemberVo loginedAdminMemberVo = 
				(AdminMemberVo) session.getAttribute("loginedAdminMemberVo");
		if (loginedAdminMemberVo == null) {
			nextPage = "redirect:/admin/member/loginForm";
		}
		return nextPage;
				
	}
	@PostMapping("/modifyAccountConfirm")
	public String modifyAccountConfirm(AdminMemberVo adminMemberVo, HttpSession session) {
		String nextPage = "admin/member/modify_account_ok";
		
		int result = adminMemberService.modifyAccountConfirm(adminMemberVo);
		
		if (result > 0) {
			AdminMemberVo loginedAdminMemberVo = adminMemberService.getLoginedAdminMemberVo(adminMemberVo.getA_m_no());
			
			session.setAttribute("loginedAdminMemberVo", loginedAdminMemberVo);
			session.setMaxInactiveInterval(60*30);
		} else {
			nextPage = "admin/member/modify_account_ng";
		} 
		return nextPage;
	}
	
	@GetMapping("/findPasswordForm")
	public String findPasswordForm() {
		String nextPage = "admin/member/find_password_form";
		return nextPage;
	}
	
	
	@PostMapping("/findPasswordConfirm")
	public String findPasswordConfirm(AdminMemberVo adminMemberVo, HttpSession session) {
		String nextPage = "/index";
		int result = adminMemberService.findPasswordConfirm(adminMemberVo);
		if (result <=0) { 
			nextPage = "/index";
			session.setAttribute("emailC", "정보가 잘못되었습니다.");
			session.setMaxInactiveInterval(60*30);
		}else {
		session.setAttribute("emailC", "이메일이 전송되었습니다.");
		session.setMaxInactiveInterval(60*30);}
		return nextPage;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/inputAuthSend/{mail}/", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, String> inputAuthSend(@PathVariable("mail") String a_m_mail) {
		Map<String, String> resultMap = new HashMap<String, String>();
		
		String isAuthNum = adminMemberService.inputAuthSend(a_m_mail);
		resultMap.put("result", isAuthNum);
		
		return resultMap;
		
	}
	@RequestMapping(value = {"/tradeHistory"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String tradeHistory(Model model) {
		//we go main page(index)
	return "/members/mypage/Trade_history";
		//even just put index, servelt will find index.jsp
	}
	
}