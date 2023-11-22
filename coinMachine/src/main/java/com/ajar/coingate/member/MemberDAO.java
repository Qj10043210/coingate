package com.ajar.coingate.member;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;

@Component
public class MemberDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	

	public void addFAQ(MemberVO question_add_form) {
		String sql = "INSERT INTO tbl_admin_faq(";
		sql += "a_m_type, a_m_class, a_m_title, a_m_content, a_m_name, a_m_time) ";
		sql += " VALUES(?, ?, ?, ?, ?, now())";
		
		try {
			Object[] values= {
					question_add_form.getA_m_type(),
					question_add_form.getA_m_class(),
					question_add_form.getA_m_title(),
					question_add_form.getA_m_content(),
					question_add_form.getA_m_name()
					
					
			};
			 jdbcTemplate.update(sql, values);
	            

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Map<String, List<MemberVO>> dataListFAQ() {
		// TODO Auto-generated method stub
		System.out.println("DAO dataListFAQ");
		String sql =  "SELECT * FROM tbl_admin_faq "
				+ "WHERE a_m_type = 'faq' ORDER BY a_m_class ASC";
	    List<MemberVO> dataFAQ = new ArrayList<MemberVO>();
	    Map<String, List<MemberVO>> dataMap = new HashMap<>();
	    try {
	    	//여기서 받아온 데이터를 맵으로 포장해야함 키값=a_m_class의 값, 밸류= 키값이 같은것들의 뭉탱이
	    	RowMapper<MemberVO> rowMapper = BeanPropertyRowMapper.newInstance(MemberVO.class);
	    	dataFAQ = jdbcTemplate.query(sql, rowMapper);
	    	String cls = "";
	    	
	    	for (int i=0; i<dataFAQ.size(); i++) {
	    		MemberVO member = dataFAQ.get(i);
	    		cls = member.getA_m_class();
	    		dataMap.put(cls, packingMap(cls, dataFAQ.get(i), dataMap));
	    	}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    return dataMap.size() > 0 ? dataMap : null;
	    //return dataMap.size() > 0 ? dataMap : null;
	}
	
	public List<MemberVO> packingMap(String cls, MemberVO dataFAQ, Map<String, List<MemberVO>> dataMap){
		List<MemberVO> list = new ArrayList<MemberVO>();
		Object clsValue = dataMap.get(cls);
		if (clsValue != null) {
			if(clsValue instanceof List<?>) {
				List<Object> objList = (List<Object>) clsValue;
				for (Object obj : objList) {
				    if (obj instanceof MemberVO) {
				        list.add((MemberVO) obj);
				    }
				}
			}else {
			    Object obj = dataMap.get(cls);
				list.add((MemberVO) obj);
		    }
		    list.add(dataFAQ);
		} else {
		    // clsValue가 null이거나 Boolean 형식이 아닌 경우에 대한 처리
			list.add(dataFAQ);
		}
		return list;
	}
	public void userQuestion(MemberVO user_question_form) {
		String sql = "INSERT INTO tbl_admin_faq(";
		sql += "a_m_type, a_m_class, a_m_title, a_m_content, a_m_name, a_m_time) ";
		sql += " VALUES(?, ?, ?, ?, ?, now())";
		
		try {
			Object[] values= {
					user_question_form.getA_m_type(),
					user_question_form.getA_m_class(),
					user_question_form.getA_m_title(),
					user_question_form.getA_m_content(),
					user_question_form.getA_m_name()
					
					                            
			};
			 jdbcTemplate.update(sql, values.toString());
	            

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public List<MemberVO> selectQNA(int pageNum, int amount) {
		
		int pageNumber1 = (pageNum-1)*amount;
		int pageNumber2 = pageNum*amount;
		//String sql = "SELECT * FROM tbl_admin_faq";
		String sql = "select B.* from (select @rownum:=@rownum+1 rn, A.* from tbl_admin_faq A, (select @rownum:=0) R) B where rn > ? and rn <=? ";
		List<MemberVO> memberVOS = new ArrayList<MemberVO>();
		try {
			memberVOS = jdbcTemplate.query(sql, new RowMapper<MemberVO>() {
			
				@Override
				public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				
						MemberVO memberVO = new MemberVO();
		
						memberVO.setA_m_no(rs.getInt("a_m_no"));
						memberVO.setA_m_title(rs.getString("a_m_title"));
						memberVO.setA_m_class(rs.getString("a_m_class"));
						memberVO.setA_m_content(rs.getString("a_m_content"));
						memberVO.setA_m_name(rs.getString("a_m_name"));
						memberVO.setA_m_time(rs.getString("a_m_time"));
						return memberVO;
				}
			}, pageNumber1, pageNumber2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberVOS.size() > 0 ? memberVOS : null;
	}
	
	public int selectTotArticles() {
		int result = 0;
		try {
			String sql = "select count(a_m_no) from tbl_admin_faq";
			result = jdbcTemplate.queryForObject(sql, Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}			
		return result;

	}
}



