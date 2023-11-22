<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$.noConflict();
	var jQ = jQuery;
</script>
<script>
	 
 function modifyAccountForm() {
            let form = document.modify_account_form;
            if (form.a_m_pw.value == '') {
                alert('INPUT ADMIN PW.');
                form.a_m_pw.focus();
            } else if (form.a_m_name.value == '') {
                alert('INPUT ADMIN NAME.');
                form.a_m_name.focus();
            } else if (form.a_m_mail.value == '') {
                alert('INPUT ADMIN MAIL.');
                form.a_m_mail.focus();
            } else if (form.a_m_phone.value == '') {
                alert('INPUT ADMIN PHONE.');
                form.a_m_phone.focus();
            } else {
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
  height: 1000px;
}

.indexLogo{
  text-align: center;
}

.indexLogo a img{
  width: 250px;
}

#Index_CreateDiv .modify_account_form {
  width: 100%;
  height: 600px; 
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
}

#Index_CreateDiv .modify_account_form .input200 {
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

.box-style{
  font-family: Galmuri9;
  width: 400px;
  height: 50px;

}

.email_auth{
  position: relative;
}

.email_auth .a_m_mail_btn{
  position: absolute; right: 5%; top:20%;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 30%;
  height: 30px;
  background-color: #FF8200;
  font-family: Galmuri9;
  font-size: 15px;
  color: #fff;
  line-height: 1.2;
  text-transform: uppercase;
  transition: all 0.4s;
  
}
.signin{ 
  width: 400px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 0;
  padding: 0;
}

.signup {  
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  width: 50%;
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

.cancel{
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  width: 50%;
  height: 50px;
  background-color: #3464AE;
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
	
	
	<div class="modify_account_form">
		<input class="input200" type="text" name="a_m_id" placeholder="아이디" readonly disabled>
		<input class="input200" type="password" name="a_m_pw" placeholder="비밀번호">
		<input class="input200" type="text" name="a_m_name" placeholder="이름">
		<input class="input200" type="email" name="a_m_mail" placeholder="이메일">
        <input class="input200" type="text" name="a_m_phone" placeholder="연락처">
		<div class="signin">
           <input type="button"	class="signup" value="수정" onclick="modifyAccountForm();"> 
           <input type="reset"	class="cancel" value="취소" > 
        </div>
	</div>
</div> 
