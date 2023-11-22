<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$.noConflict();
	var jQ = jQuery;
</script>
<script>
	 
 function findpwAccountForm() {
            
            if (QWER('input[name=a_m_id]').val()==""||QWER('input[name=a_m_id]').val()==null) {
                
            	QWER('input[name=a_m_id]').focus();
            } else if (QWER('input[name=a_m_mail]').val()==""||QWER('input[name=a_m_mail]').val()==null) {
                
            	QWER('input[name=a_m_mail]').focus();
            }else {
                form.submit();
            }
            
        }
    </script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap");
@import url("https://cdn.jsdelivr.net/npm/galmuri@latest/dist/galmuri.css");

#Index_CreateDiv{
  font-family: Galmuri9;
  width: 500px;
  height: 500px;
}

.indexLogo{
  text-align: center;
}

.indexLogo a img{
  width: 250px;
}

#Index_CreateDiv .findpw_account_form {
  width: 100%;
  height: 400px; 
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
}

#Index_CreateDiv .findpw_account_form .input200 {
  font-family: Galmuri9;
  width: 80%;
  height: 50px;
  flex-grow: 0;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  display: flex;
  align-items: center;
}

.find{ 
  width: 400px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 0;
  padding: 0;
}

.findpw {  
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  width: 100%;
  height: 50px;
  background-color: #FF8200;
  border-radius: 20px;
  font-family: Galmuri9;
  font-size: 15px;
  color: #fff;
  line-height: 1.2;
  text-transform: uppercase;
  transition: all 0.4s;
}

</style>
 
    
<div id="Index_CreateDiv">
	<h1 class="indexLogo">
    	<a href="<c:url value='/member/index' />">
   	    	<img src="<c:url value='/resources/img/UPthumb.png' />"  alt="UPthumb">
       	</a>
	</h1>
	
	
	<form class="findpw_account_form" method="post" action="<c:url value='/admin/member/findPasswordConfirm' />">
		<input class="input200" type="text" name="a_m_id" placeholder="아이디">
		
		<input class="input200" type="text" name="a_m_mail" placeholder="이메일">
		<div class="find">
           <input type="button"	class="findpw" value="이메일전송" onclick="findpwAccountForm();"> 
        </div>
	</form>
</div> 
