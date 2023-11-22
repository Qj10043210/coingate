<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$.noConflict();
var QWER = jQuery;
</script>


<style>
@import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap");
@import url("https://cdn.jsdelivr.net/npm/galmuri@latest/dist/galmuri.css");

#Index_LoginDiv {
  font-family: Galmuri9;
  display: flex;
  width: 500px;
  height: 500px;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;
  background: linear-gradient(to bottom, #c0c0c0, #f0f0f0);
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

  
}
.indexLogo{
  text-align: center;
}

.indexLogo a img{
  width: 250px;
}

#Index_LoginDiv .Index_LoginDiv_childs {
  width: 80%;
  height: 10%;
  flex-grow: 0;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  justify-content: space-between;
  
}

#Index_LoginDiv #Index_LoginDiv_input_id, #Index_LoginDiv #Index_LoginDiv_input_pwd {
  background-color : black;
  font-family: Galmuri9; 
  height: 100%;
  width: 100%;
  margin: 0;
  padding: 0;
  border-collapse: collapse;
  box-sizing: border-box;
  color:white;
  font-weight: 500;

}

#Index_LoginDiv #Index_LoginDiv_buttonDiv {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 0;
  padding: 0;
}

#Index_LoginDiv #Index_LoginDiv_buttonDiv #Index_LoginDiv_button_newjoin, #Index_LoginDiv #Index_LoginDiv_buttonDiv #Index_LoginDiv_button_oldjoin {
  height: 100%;
  width: 49%;
}

.login_btn{  
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
.signup_btn{
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
.find_id{
  font-family: Galmuri9;
  font-weight: 700;
  font-size: 15px;
  color: #3464AE;
  line-height: 1.4;
}
.find_pw{
  font-family: Galmuri9;
  font-weight: 700;
  font-size: 15px;
  color: #FF8200;
  line-height: 1.4;
  text-transform: uppercase;
}

#Index_LoginDiv_msg{
	width:400px;
	height: 60px;
	background-color:white;
	color:black;
	text-align:center;
	line-height:60px;
	font-size:20px;
	font-family: Galmuri9;
	opacity:1;
	position : absolute;
	top: 60%;
  	left: 50%;
  transform: translate(-50%, -50%);
  display:none
}
.check_id .chk_text{
	color:#444;
}
</style>

<div id="Index_LoginDiv">
  	<div id="Index_LoginDiv_msgDiv">
  		<h1 class="indexLogo">
  	    	<a href="<c:url value='/member/index' />">
      	    	<img src="<c:url value='/resources/img/UPthumb.png' />"  alt="UPthumb">
        	</a>
		</h1>
	</div>
    <div class="Index_LoginDiv_childs" id="Index_LoginDiv_idDiv">
	    <input type="text" name="Index_LoginDiv_input_id" id="Index_LoginDiv_input_id" placeholder="Username" value="${sessionScope.saveId}">
    </div>
    <div class="Index_LoginDiv_childs" id="Index_LoginDiv_pwdDiv">
        <input type="text" name="Index_LoginDiv_input_pwd" id="Index_LoginDiv_input_pwd" placeholder="Password">
    </div>
    <div class="Index_LoginDiv_childs">
   	    <div class='check_id'>
   	    	<c:if test="${not empty sessionScope.saveId}">
   	    	<input type="checkbox" id="chk_id" checked>
        	<label class="chk_text" for="ex_chk">아이디 저장</label>
        	</c:if>
        	<c:if test="${empty sessionScope.saveId}">
   	    	<input type="checkbox" id="chk_id">
        	<label class="chk_text" for="ex_chk">아이디 저장</label>
        	</c:if>
        </div>
        <!--
         <div class=find_menu>
        	<span class="find_id">아이디</span>
			<span class="find_pw">비밀번호 찾기</span> 
		</div>
		 -->
     </div>
    <div class="Index_LoginDiv_childs" id="Index_LoginDiv_buttonDiv">
        <input id="Index_LoginDiv_button_newjoin" class="login_btn" type="button" value="회원가입">
        <input id="Index_LoginDiv_button_oldjoin" class="signup_btn" type="button" value="로그인">
    </div>
	<div id="Index_LoginDiv_msg">
		틀린 회원정보입니다.
	</div>

</div>
<form name="hiddenLoginSend" action="<c:url value='/client/loginRequest' />" method="POST">
<input type="hidden" name="hiddenInput_Login_id"/>
<input type="hidden" name="hiddenInput_Login_pwd"/>

</form>
<script>
QWER(document).ready(function(){
		QWER(document).on("click", "#Index_LoginDiv_button_newjoin", function(){
			QWER('#MainPage_InfoDiv_LoginDiv').addClass('MainPage_InfoDiv_unview');
     	   QWER('#MainPage_InfoDiv_CreateDiv').removeClass('MainPage_InfoDiv_unview');
		})	
	
		QWER(document).on("click", "#Index_LoginDiv_button_oldjoin", function(){
			console.log("Test")
			let tempC = 0;
			let tempA = QWER('#Index_LoginDiv_input_id').val();
			let tempB = QWER('#Index_LoginDiv_input_pwd').val();
			if(QWER('#chk_id').is(":checked")){
				console.log("iddddd")
				tempC = 1;
			}else{
				tempC = 0;
			}
			console.log(tempC + "asdf")
			if(tempA != "" && tempB != ""){
				loginRequest(tempA, tempB, tempC);
			}
			else if(tempA != ""){
				QWER('#Index_LoginDiv_input_pwd').focus();
				console.log("pwd")
				return;
			}
			else if(tempB != ""){
				QWER('#Index_LoginDiv_input_id').focus();
				console.log("id")
				return;
			}
			else{
				QWER('#Index_LoginDiv_input_id').focus();
				QWER('#Index_LoginDiv_input_pwd').focus();
				console.log("pwd id")
				return;
			}
			
			
		});
	
	function loginRequest(ids, pwds, svi){
		 QWER.ajax({
		        url: "<c:url value='/client/loginRequest' />",
		        type: 'POST',
		        data: { reqId: ids, reqPwd: pwds , reqSv : svi },
		        success: function(data) {
		        	console.log(data.res);
		           if(data.res != "n_o"){
		        	   
		        	   if(data.userInfo[0].userGameON ==0){
		        		   console.log("yesss")
		        		   userInfo_getSomeData(data.userInfo[0]);
		        	   }
		        	   console.log("yess2s")
		        	   QWER('#MainPage_InfoDiv_LoginDiv').addClass('MainPage_InfoDiv_unview');
		        	   QWER('#MainPage_InfoDiv_afterDoneDiv').removeClass('MainPage_InfoDiv_unview');
		        	   
		           }else{
		        	   QWER('#Index_LoginDiv_msg').fadeIn(800);
		        	   QWER('#Index_LoginDiv_msg').fadeOut(2000);
		           }
		        },
		        error: function(errorThrown) {
		            alert(errorThrown);
		        }
		    });
			
			
	}
	
	
	



});
</script>
