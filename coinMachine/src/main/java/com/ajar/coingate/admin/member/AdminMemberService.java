package com.ajar.coingate.admin.member;

import java.security.SecureRandom;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
@Component
@Service

public class AdminMemberService {
	
	final static public int ADMIN_ACCOUNT_ALREADY_EXIST = 0;
	final static public int ADMIN_ACCOUNT_CREATE_SUCCESS = 1;
	final static public int ADMIN_ACCOUNT_CREATE_FAIL = -1;
	
	@Autowired
	AdminMemberDao adminMemberDao;
	
	@Autowired
	JavaMailSenderImpl javaMailSenderImpl;
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber; 
	
	public boolean idCheck(String userid) {
	    return adminMemberDao.isAdminMember(userid);
	   }
	
	public int createAccountConfirm(AdminMemberVo adminMemberVo){
		boolean isMember = adminMemberDao.isAdminMember(adminMemberVo.getA_m_id());
		if (!isMember) {
			int result = adminMemberDao.insertAdminAccount(adminMemberVo);
			if (result>0) {
				return ADMIN_ACCOUNT_CREATE_SUCCESS;
			} else {
				return ADMIN_ACCOUNT_CREATE_FAIL;
			}
		} else {
			return ADMIN_ACCOUNT_ALREADY_EXIST;
		}
	}
	
	
	public AdminMemberVo loginConfirm(AdminMemberVo adminMemberVo) {
		AdminMemberVo loginedAdminMemberVo = adminMemberDao.selectAdmin(adminMemberVo);
		return loginedAdminMemberVo;
	}
	
//	관리자 목록
//	public List<AdminMemberVo> listupAdmin(){
//		return adminMemberDao.selectAdmins();
//	}
	
//	관리자 승인	
//	public void setAdminApproval(int a_m_no) {
//		int result = adminMemberDao.updateAdminAccount(a_m_no);
//	}
	
	public int modifyAccountConfirm(AdminMemberVo adminMemberVo) {
		return adminMemberDao.updateAdminAccount(adminMemberVo);
	}
	
	public AdminMemberVo getLoginedAdminMemberVo(int a_m_no) {
		return adminMemberDao.selectAdmin(a_m_no);
	}
	
	public int findPasswordConfirm(AdminMemberVo adminMemberVo) {
		AdminMemberVo selectedAdminMemberVo = adminMemberDao.selectAdmin(adminMemberVo.getA_m_id(), 
																		 adminMemberVo.getA_m_name(), 
																		 adminMemberVo.getA_m_mail());
		int result = 0;
		if (selectedAdminMemberVo != null) {
			String newPassword = createNewPassword();
			result = adminMemberDao.updatePassword(adminMemberVo.getA_m_id(), newPassword);
			if (result > 0)
				sendNewPasswordByMail(adminMemberVo.getA_m_mail(), newPassword);
		}
		return result;
		}
	private String createNewPassword() {
		char[] chars = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
				'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
				'u', 'v', 'w', 'x', 'y', 'z'
				};
		StringBuffer stringBuffer = new StringBuffer();
		SecureRandom secureRandom = new SecureRandom();
		secureRandom.setSeed(new Date().getTime());
		
		int index = 0;
		int length = chars.length;
		for (int i = 0; i < 8; i++) {
			index = secureRandom.nextInt(length);
		
			if (index % 2 == 0) 
				stringBuffer.append(String.valueOf(chars[index]).toUpperCase());
			else
				stringBuffer.append(String.valueOf(chars[index]).toLowerCase());
		
		}
		
		return stringBuffer.toString();
	}
	
	
	private void sendNewPasswordByMail(String toMailAddr, String newPassword) {
		final MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMessageHelper.setTo(toMailAddr);
				mimeMessageHelper.setSubject("[업썸] 새 비밀번호 안내입니다.");
				mimeMessageHelper.setText("새 비밀번호 : " + newPassword, true);
			}
		};
		javaMailSenderImpl.send(mimeMessagePreparator);
	}

	
	public String inputAuthSend(String a_m_mail) {
		
		Random random = new Random();
	    int checkNum = random.nextInt(888888) + 111111;
		
	    String setFrom = "j.mongs28@gmail.com";
        String toMail = a_m_mail;
        String title = "회원가입 인증 이메일입니다.";
        String content = 
                "Upthumb을 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            javaMailSenderImpl.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
	    String num = Integer.toString(checkNum);
	    
	    return num;
	   }

}
		


