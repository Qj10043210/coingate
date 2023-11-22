<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jQuery.com/jQuery-latest.min.js"></script>


<style>
@import
	url("https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap")
	;

@import
	url("https://cdn.jsdelivr.net/npm/galmuri@latest/dist/galmuri.css");

#Index_CreateDiv {
	font-family: Galmuri9;
	
	width: 500px;
	height: 500px;
	
	background: linear-gradient(to bottom, #c0c0c0, #f0f0f0);
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}
#Index_CreateDiv #section_wrap{
	display: flex;
	width:100%;
	height:100%;
	flex-direction: column;
	justify-content: start;
	align-items: center;
	gap : 1%;
}

.indexLogo {
	text-align: center;
}

.indexLogo a img {
	width: 250px;
}

.create_account_form {
	width: 80%;
	height: 10%;
	flex-grow: 0;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	align-items: center;
	justify-content: space-between;
}

.create_account_form .input200 {
	height: 100%;
	width: 49%;
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

.cancel {
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
	<div id="section_wrap" class="row">
		<h1 class="indexLogo">
			<a href="<c:url value='/member/index' />"> <img
				src="<c:url value='/resources/img/UPthumb.png' />" alt="UPthumb">
			</a>
		</h1>
		<form class="create_account_form" name="create_account_form" method="post" action="<c:url value='/admin/member/createAccountConfirm' />">
			<input class="input200" type="text" name="a_m_id" placeholder="아이디">
			<input class="input200" type="password" name="a_m_pw"
				placeholder="비밀번호"> <input class="input200" type="password"
				name="a_m_pw_again" placeholder="비밀번호 확인"> 
			<div class="mail_check wrap">
				<div class="email_auth">
					<input type="email" name="a_m_mail" placeholder="이메일" id="a_m_mail"
						class="box-style">
					<button type="button" name="a_m_mail_btn" id="a_m_mail_btn">인증번호
						받기</button>
					<p id="emailcheck"></p>
				</div>
				<div class="email_auth_checking">
					<input type="text" name="a_m_mail_input_auth"
						placeholder="인증번호를 입력하세요" id="a_m_mail_input_auth"
						class="box-style">
					<p id="authcheck"></p>
				</div>
			</div>
			
			<div class="signin">
				<button type="button" class="signup" onclick="createAccountForm();">가입하기</button>
				<button class="cancel" type="reset">취소</button>
			</div>
		</form>
	</div>
</div>

<script>
$.noConflict();
var QWER = jQuery;	
var alreadyId = true;
var code = "";
let createdabc = "";
</script>

<script>
	var alreadyId = true;
	let createdabc = "";
	function createAccountForm() {
		let form = document.create_account_form;
		let inputCode = QWER("#a_m_mail_input_auth").val();
		if (form.a_m_id.value == '') {
			alert('아이디를 입력하세요.');
			form.a_m_id.focus();
		}
		else if(alreadyId){
			alert('중복된 아이디입니다.');
			form.a_m_id.focus();
		}
		 else if (form.a_m_pw.value == '') {
			alert('비밀번호를 입력하세요.');
			form.a_m_pw.focus();
		} else if (form.a_m_pw_again.value == '') {
			alert('비밀번호확인란을 입력하세요.');
			form.a_m_pw_again.focus();
		} else if (form.a_m_pw.value != form.a_m_pw_again.value) {
			alert('비밀번호가 일치하지않습니다.');
			form.a_m_pw.focus();
		} else if (form.a_m_mail.value == '') {
			alert('이메일을 입력하세요.');
			form.a_m_mail.focus();
		} else if (form.a_m_mail_input_auth.value == '') {
			alert('인증번호를 입력하세요.');
			form.a_m_mail.focus();
		} else if (inputCode != code) {
			alert('인증번호가 맞지않습니다.');
			form.a_m_mail.focus();
		} else {
			form.submit();
		}

	}
	QWER("#a_m_mail_btn").on("click", function(){ 
		   let mail = QWER("#a_m_mail").val()
		   console.log("메일 확인"+mail);
		   QWER.ajax({
			   url : "${pageContext.request.contextPath}/admin/member/inputAuthSend/"+mail+"/",
			   type : "GET",
			   headers: {
				    Accept: "application/json"
				},
			   success : function(result){
				   console.log("result: " + result.result);
				   let result2 = result.result
				   QWER("#emailcheck").text("인증번호가 전송되었습니다.")
				   code = result2;
			   },
			   error : function(err){
				   console.log(err);
			   }
		   })
	  	 })
	  	 
	QWER("#a_m_mail_input_auth").on("blur", function(){
		let inputCode = QWER("#a_m_mail_input_auth").val();
	  	if ( inputCode == code ) {
	  	QWER("#authcheck").text("인증이 완료되었습니다.").css('color', 'blue')
	  	} else {
	  	QWER("#authcheck").text("인증번호가 맞지않습니다.").css('color', 'red')
	  	}
	  		
	    })
	QWER(document).on("focusout",'input[name=a_m_id]', function(){
		createdabc = QWER(this).val(); 
		QWER.ajax({
		        url: "<c:url value='/client/loginRequest2' />",
		        type: 'POST',
		        data: { reqId : createdabc},
		        success: function(data) {
		        	if(data == "yes"){
		        		alreadyId = false;
		        	}else{
		        		alert('중복된 아이디입니다.');
		    			
		        	}
		        },
		        error: function(errorThrown) {
		            alert(errorThrown);
		        }
		    });
		        
	})	
</script>
<script>
QWER(document).ready(function() {
	QWER('#genderSelect').change(function() {
			var selectedValue = $(this).val();
			if (selectedvalue === 'M') {
				QWER(this).css('color', 'blue');
			} else if (selectedvalue === 'W') {
				QWER(this).css('color', 'orange');
			} else {
				QWER(this).css('color', '');
			}
		});
	});
</script>