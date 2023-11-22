<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$.noConflict();
	var QWER = jQuery;
</script>
<!-- Global_nameChecker 00 -->
<script>
	const GNList = [];
	var GNinterval = 500;
	var GNcheckInterval = setInterval(Global_Name_function_ajax_requet, GNinterval);
 	function Global_Name_function_ajax_requet(){
 		let a = '${sessionScope.joinedId}';
 		if (a == null||a == ""){
 			
 			
 			QWER.ajax({
 				url: "<c:url value='/client/areyouinthere' />",
 				type : "get",
 				success: function(data){
 					if(data.GNid== null||data.GNid == ""){
 						
 					}else{
						GNList.push(data.GNid);
						GNList.push(data.GNpq);
						GNList.push(data.GNpt);
						console.log(GNList)
						ITstart(); //최초선언
						IA_Start(); //최초선언
						clearInterval(GNcheckInterval);
 					}
 				},
 				error : function(errorThrown){
 					alert(errorThrown.statusText);
 				}
 			})
 		}else{
 			
 			GNList.push('${sessionScope.joinedId}');
			GNList.push('${sessionScope.playableQ}');
			GNList.push('${sessionScope.playableTimes}');
 			ITstart(); //최초선언
 			IA_Start(); //최초선언
 			clearInterval(GNcheckInterval);
 		}
 	}
 	
 </script>
 <!-- Global_nameChecker 11 -->
 
 <!-- Input_Timer 00 -->
 
<script>
let ITinterval_b = false;
let ITinterval_b2 = false;
let ITinterval_t = 500;
let ITinterval_i = setInterval(ITinterval_f, ITinterval_t);
function ITstart(){
	
	ITinterval_b = true;
	
	
}
function ITinterval_f(){
	if(ITinterval_b==true){
		
	if(GNList.length>0&&GNList[1]==1){ // GNQ가 1일 경우만 timer 동작
		Input_timer_function_ajax()
		
		clearInterval(ITinterval_i);//GNList 받음
	}
	}
};
function updateTimer(){
	let remainingTime =parseInt(QWER("#Input_Timer_clock_unview").text());
	var minutes = Math.floor(remainingTime / 60000);
    var seconds = ((remainingTime % 60000) / 1000).toFixed(0);
    document.getElementById("Input_Timer_clock").textContent = (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
    if (remainingTime > 0) {
        remainingTime -= 1000;
        QWER("#Input_Timer_clock_unview").text(remainingTime);
        Input_timer_function_ajax_post();
        setTimeout(updateTimer, 1000);
    }else{
    	Input_timer_function_ajax()
    }
};


function Input_timer_function_ajax(){
	let a = GNList[0];
	if(a!=null&&a!==""){
	QWER("#Global_pop_content_name_span").text(a);
	QWER.ajax({
		url: "<c:url value='/client/timer' />",
		type:"post",
		data : {reqId : a},
		success: function(data){
			ITinterval_b2 = true;
			
			if (data > 0){
				let datas = parseInt(data);
				QWER("#Input_Timer_clock_unview").text(datas);
				QWER("#Input_Timer_msg").text("남은 시간");
				
			}else{
				QWER("#Input_Timer_clock").text(0);
				QWER("#Input_Timer_clock_unview").text(0);
				QWER("#Input_Timer_msg").text("게임 종료");
				GNList.splice(1,1,2) //GPQ 초기화 (2로) 
				GP_gameover();
				
			}
			QWER('#Input_Timer').removeClass('Input_Timer_unview');
			updateTimer();
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		}
		
	});
	}
	
};
function Input_timer_function_ajax_post(){
	let a = GNList[0];
	let b = parseInt(QWER('#Input_Timer_clock_unview').text());
	QWER.ajax({
		url: "<c:url value='/client/PostTimer' />",
		type:"post",
		data : {reqId : a, newTimes : b},
		success: function(data){
			
				
			
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		}
		})
	
};


</script>
 <!-- Input_Timer 11 -->
 
 <!-- Index_afterDone 00 -->
 <script>
var IAinterval = 500;
var IAname = "";
var IApq = 0;
var IApt = 0;
var IAbalance = 0;
var IAdefault = 50000000;
	function IA_Start(){
		//var IAcheckInterval = setInterval(IA_Request, IAinterval);
		IA_Request();
	}
	
	function IA_Request(){
		let a = '${sessionScope.joinedId}';
		if(a == null||a == ""){ //session에서 받아온 게 아직 없을 때(LIST는 있음)
			IAname = GNList[0];
			IApq = GNList[1];
			IApt = GNList[2];
			console.log("list")
			IA_ajax_get(IAname)
			
		}else{ //받아온 게 있음 (굳이 LIST 안 씀)
			IAname = '${sessionScope.joinedId}';
			IApq = '${sessionScope.playableQ}';
			IApt = '${sessionScope.playableTimes}';
			console.log("session")
			IA_ajax_get(IAname)	
		}
		
	};
	
	function IA_ajax_get(){
		let a = IAname;
		console.log("sdfasdf"+IAname)
		QWER.ajax({
			url: "<c:url value='/client/balance' />",
			type:"get",
			data : {reqId : a},
			success: function(data){
				
				IAbalance= data;
				IA_putData();
			},
			error : function(errorThrown){
				alert(errorThrown.statusText);
			}
			
		});
	};
	function IA_putData(){
		QWER('.user_name').text(IAname);
		QWER('.assets_held_child_money_input').val(IAbalance);
		if(IApq==0){
		QWER('.trading-form-btn').val("게임시작")
		}else if (IApq==1){
			QWER('.trading-form-btn').val("게임중")	
		}else{
			QWER('.trading-form-btn').val("로그 보기")
		}
		IA_detectMoney()
	}
	QWER(document).on("input", '.assets_held_child_money_input', IA_detectMoney);
	function IA_detectMoney(){
		let IATEMP = QWER('.assets_held_child_money_input').val()-IAdefault;  
		IATEMP = IATEMP/IAdefault * 100;
		IATEMP = IATEMP.toFixed(2);
		let IATEMP2 = "";
		if(QWER('.assets_held_child_money_input').val() > IAdefault){
			IATEMP2 += "+";
			IATEMP2 += IATEMP;
			IATEMP2 += " %";
			QWER('.assets_held_child_ratio').text(IATEMP2)
			QWER('.assets_held_child_ratio').addClass('assetUP');
			QWER('.assets_held_child_ratio').removeClass('assetDO');
			QWER('.assets_held_child_ratio').removeClass('assetSA');
			
		}else if(QWER('.assets_held_child_money_input').val() < IAdefault){
			IATEMP2 += "";
			IATEMP2 += IATEMP;
			IATEMP2 += " %";
			QWER('.assets_held_child_ratio').text(IATEMP2)
			QWER('.assets_held_child_ratio').removeClass('assetUP');
			QWER('.assets_held_child_ratio').addClass('assetDO');
			QWER('.assets_held_child_ratio').removeClass('assetSA');
		}else{
			IATEMP2 += " ";
			IATEMP2 += IATEMP;
			IATEMP2 += " %";
			QWER('.assets_held_child_ratio').text(IATEMP2)
			QWER('.assets_held_child_ratio').removeClass('assetUP');
			QWER('.assets_held_child_ratio').removeClass('assetDO');
			QWER('.assets_held_child_ratio').addClass('assetSA');
		}
	}
	
	QWER(document).on("click",".logout-form-btn",IA_logout);
	function IA_logout(){
		GNList.splice(0, GNList.length);
		let a = document.hiddenIAform;
		a.submit();
	}
	QWER(document).on("click", '.username', function(){
		let a = document.hiddenIAform2;
		a.submit();
	});
	QWER(document).on("click", '.trading-form-btn', function(){
		let a = document.hiddenIAform3;
		QWER('input[name=hiddenIAinput3]').val(QWER(this).val())
		a.submit()
	})
</script> 
 <!-- Index_afterDone 11 -->
 <!-- Each_Detail 00 -->

 
 <!-- Each_Detail 11 -->
 
 <!-- index 00 -->

 <!-- index 11 -->
 
 <!-- Global_pop 00 -->
 <script>
 let GPIntervalTimes = 1000; //1초에 한 번 돈 체크
 let GPInterval = setInterval(unction_Global_pop_balance_check, GPIntervalTimes);
 function unction_Global_pop_balance_check(){ //이름 생길 때 호출/
	 
	 if(QWER('#Global_pop_content_name_span').text() != ""&& QWER('#Global_pop_content_name_span').text() != null){
	 	
		 unction_Global_pop_ajax_get_balance();
	 }
 }
 function unction_Global_pop_ajax_get_balance(){
	 let a = QWER('#Global_pop_content_name_span').text()
	 
	 QWER.ajax({
		 url : "<c:url value='/client/balance2' />",
		 type : 'get',
		 data : {reqId : a},
		 success : function(data){
			 QWER('#Global_pop_content_balance_span').text(data)
		 },
		 error : function(error){
         	console.error('Error retrieving data:', error);
         }
		 
	 })
 }
 function GP_gameover(){
	  	let TTT = "";
	  	TTT += "<form name = 'hiddenGPform2' action='<c:url value='/client/";
		TTT +=	"GAMEOVER' />' method='post'>";
	  	TTT +=	"</form>";
		
		QWER('#Global_popDiv').prepend(TTT);
		let a = document.hiddenGPform2;
		a.submit()
		QWER(a).remove();
	}
 QWER(document).on("click",'#Global_pop_content_name_span',GP_nameClick);
 function GP_nameClick(){
	  	let TTT = "";
	  	TTT += "<form name = 'hiddenGPform2' action='<c:url value='/client/";
		TTT +=	"topMenu' />' method='post'>";
	  	TTT +=	"</form>";
		
		QWER('#Global_popDiv').prepend(TTT);
		let a = document.hiddenGPform2;
		a.submit()
		QWER(a).remove();
	}
 
 </script>
 <!-- Global_pop 11 -->
 
 <!-- Input_trade 00 -->
 <script>
 function IT_req(rqt){
 	let rqtTyp = (rqt == "#tradeBoxB") ? true : false; //true=매수 false = 매도
 	let rqtAllo = rqt + "3_input";
 	let rqtAll = QWER(rqtAllo).val();
 	let rqtPrio = rqt + "1_input";
 	let rqtPri = QWER(rqtPrio).val();
 	let rqtQuao = rqt + "2_input";
 	let rqtQua = QWER(rqtQuao).val();
 	let rqtMsg = rqt + "4 p"
 	let preCur = QWER("#EachPage_MiddleSide_TitleDiv div").text();
 	preCur = preCur.trim();
 	let preNam = QWER("#Global_pop_content_name_span").text();
 	if((preNam != null && preNam != "")){
 		
 	
	    	if(
	    		rqtTyp ==true  && 
	    		(rqtAll != 0 && rqtAll != null && rqtAll != "") 
	    		){//매수
	    		console.log("매수 시도")
	    		IT_tryToGotPrice(rqtTyp, rqtPri, preCur, rqtMsg, rqtAll, preNam, rqtQua);
	    	}
	    	else if(
	        		rqtTyp ==false  && 
	        		(rqtAll != 0 && rqtAll != null && rqtAll != "") 
	        		){//매도
	    		console.log("매도 시도")
	    		IT_tryToGotPrice(rqtTyp, rqtPri, preCur, rqtMsg, rqtAll, preNam, rqtQua);
	    		
	    	}else{
	    		QWER(rqtMsg).text("거래 실패!")
	    	}
 	}else{
 		QWER(rqtMsg).text("로그인 하셔요!")
 	}
 }
 function IT_tryToGotPrice(rqtTyp, rqtPri, preCu, rqtMsg, rqtAll, preNam, rqtQua){
	 console.log(preCu)
	 QWER.ajax({
		 url : "<c:url value='/data/GetExactPrice' />",
		 type : 'get',
		 data : {preCur : preCu},
		 success : function(data){
			 if(rqtPri<data){ //현재 가격 > 요청 가격
				 if(rqtTyp){//매수 실패
					 QWER(rqtMsg).text("매수 실패!")
				 }else{//매도 성공. 내 돈과 비교 들어감
					 IT_tryToSell(preCu, rqtMsg, rqtAll,preNam, data, rqtQua, rqtPri) 
				 }
			 }else{
				 if(rqtTyp){//매수 성공. 내 돈과 비교 들어감
					IT_tryTobuy(preCu, rqtMsg, rqtAll,preNam, data, rqtQua, rqtPri)	
				 }else{//매도 실패
					 QWER(rqtMsg).text("매도 실패!") //코인 체크는 매도 성공때 해도 됨
				 }
			 }
			
		 },
		 error : function(error){
         	console.error('Error retrieving data:', error);
         }
		 
	 })
	 
 }
 function IT_tryTobuy(preCu, rqtMsg, rqtAll,preNam, cpri, rqtQua, rqtPri){
	 QWER.ajax({
		 url : "<c:url value='/client/balance2' />",
		 type : 'get',
		 data : {reqId : preNam},
		 success : function(data){
			 if(data>=rqtAll){//돈 있음 거래 성공
				 IT_updateBalanceBuy(preNam, rqtAll, rqtMsg, cpri, preCu, rqtQua, rqtPri);
			 }else{ //돈 없음 거래 실패
				 QWER(rqtMsg).text("잔고 부족!")
			 }
		 },
		 error : function(error){
         	console.error('Error retrieving data:', error);
         }
		 
	 })
 };
 function IT_tryToSell(preCu, rqtMsg, rqtAll,preNam, cpri, rqtQua, rqtPri){
	 QWER.ajax({
		 url : "<c:url value='/client/balanceCoin' />",
		 type : 'get',
		 data : {reqId : preNam, curCu : preCu},
		 success : function(data){
			 if(data!=null && data>=rqtQua){//코인 있음 거래 성공
				 IT_updateBalanceSell(preNam, rqtAll, rqtMsg, cpri, preCu, rqtQua, rqtPri);
			 }else{ //코인 없음 거래 실패
				 QWER(rqtMsg).text("코인 부족!")
			 }
		 },
		 error : function(error){
         	console.error('Error retrieving data:', error);
         }
		 
	 })
 };
 
 
 function IT_updateBalanceBuy(preNam, rqtAll, rqtMsg, cpri, preCu, rqtQua, rqtPri){
	 let aaa = 0;
	 QWER.ajax({
		 url : "<c:url value='/client/balanceUpdate' />",
		 type : 'post',
		 data : {reqId : preNam, reqBa : rqtAll, curPr : cpri, curCu : preCu, tradTy : aaa, rqtQu : rqtQua, rqtPr : rqtPri},
		 success : function(data){
			QWER(rqtMsg).text("매수 성공!");
		 },
		 error : function(error){
         	console.error('Error retrieving data:', error);
         }
		 
	 })
 };
 function IT_updateBalanceSell(preNam, rqtAll, rqtMsg, cpri, preCu, rqtQua, rqtPri){
	 let aaa = 1;
	 QWER.ajax({
		 url : "<c:url value='/client/balanceUpdate' />",
		 type : 'post',
		 data : {reqId : preNam, reqBa : rqtAll, curPr : cpri, curCu : preCu, tradTy : aaa, rqtQu : rqtQua, rqtPr : rqtPri},
		 success : function(data){
			QWER(rqtMsg).text("매도 성공!");
		 },
		 error : function(error){
         	console.error('Error retrieving data:', error);
         }
		 
	 })
 }
  
 </script>
 <!-- Input_trade 11 -->
 