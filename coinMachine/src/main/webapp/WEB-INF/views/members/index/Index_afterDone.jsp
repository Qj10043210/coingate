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

#Index_afterDoneDiv{
  font-family: Galmuri9;
  width: 500px;
  height: 500px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: linear-gradient(to bottom, #c0c0c0, #f0f0f0);
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

#Index_afterDoneDiv .wrap_login_com{
  width: 80%;
  height: 80%;
  
  text-align: center;
}
#Index_afterDoneDiv .wrap_login_com .username{
	color:#FF8200;
	text-align: left;
}
#Index_afterDoneDiv .wrap_login_com .username::after{
	content:" 님";
}
#Index_afterDoneDiv .assets_held{
  width: 100%;
  height: 50%; 
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
}

.assets_held .assets_held_child{
  	text-align: center;
  	color:#000;
  
}
.assets_held_child_money_input{
	background-color:transparent;
	border : none;
	text-align:center;
	font-size : 16px;
	font-family: Galmuri9;
	
}
.assets_held .assets_held_child:nth-child(2)::after{
	content:" 원";
}
.assets_held .assets_held_child:nth-child(3)::before{
	content:"총 수익률 :";
}
.assets_held .assets_held_child:nth-child(3).assetUP::after{
	content:" ▲";
	color : red;
}
.assets_held .assets_held_child:nth-child(3).assetDO::after{
	content:" ▼";
	color : blue;
}
.assets_held .assets_held_child:nth-child(3).assetSA::after{
	content:" ";
	color : black;
}
.form-btn{
  font-family: Galmuri9;
}

</style>
<div id="Index_afterDoneDiv">
	<div class="wrap_login_com">
		<div class="username">
			<span class="user_name"> </span>
		</div>
		<div class="assets_held">
			<div class="assets_held_child">
				총 보유자산
			</div>
			<div class="assets_held_child assets_held_child_money" >
				<input class="assets_held_child_money_input" type="text" readonly>
			</div>
			<div class="assets_held_child assets_held_child_ratio">
				
			</div>
		</div>
		<div class="login_com_btn">
			<input class="trading-form-btn form-btn" type="button">
				
			<!-- <input class="modify-form-btn form-btn" type="button" value="정보변경">  -->
			<input class="logout-form-btn form-btn" type="button" value="로그아웃">
				
			
		</div>
	</div>
</div> 

<form name = "hiddenIAform" action="<c:url value='/client/logOut' />" method="post">
        
</form>
<form name = "hiddenIAform2" action="<c:url value='/client/topMenu' />" method="post">
        
</form>
<form name = "hiddenIAform3" action="<c:url value='/client/gameStart' />" method="post">
        <input type="hidden" name="hiddenIAinput3">
</form>

