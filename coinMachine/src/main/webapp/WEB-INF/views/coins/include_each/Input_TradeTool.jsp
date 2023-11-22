<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
$.noConflict();
var QWER = jQuery;
</script>
  <style>
        #tradeBoxB{
            width: fit-content;
            display: none;
            flex-direction: column;
            align-items: center;
            border: 1px solid black;
        }
        #tradeBoxC{
            width: fit-content;
            display: none;
            flex-direction: column;
            align-items: center;
            border: 1px solid black;
        }
        #tradeBoxB.view{
            display: flex;
        }
        #tradeBoxC.view{
            display: flex;
        }
        .tradeBoxXC{
        	
            position: relative;
        }
         .tradeBoxXC input[type=text]{
        	border : none;
        	outline: none;
            
        }
        .tradeBoxXC input[type=text]:focus{
        	border : none;
           outline: none; 
           background-color:#ddd;
        }
        .tradeBoxXC span{
            display: block;
            position: absolute;
            top: 0;
            right: 3%;
            
        }
        .tradeBoxXC p{
            padding: 0;
            margin: 0;
        }
        .tradeBoxXC input.other{
            position: absolute;
            bottom: 466%;
            right: -156%;
            background-color: beige;
        }
    </style>

    <div id="tradeBoxB" class="view">
        <div id="tradeBoxB1" class="tradeBoxXC">
            <input id="tradeBoxB1_input"  type="text" autocomplete="off" placeholder="0" value='0' onkeypress="return isNumber(event)">
            <span>가격</span>
        </div>
        <div id="tradeBoxB2" class="tradeBoxXC">
            <input id="tradeBoxB2_input" type="text" autocomplete="off" value="0" onkeypress="return isNumber(event)">
            <span>코인 수</span>
        </div>
        <div id="tradeBoxB3" class="tradeBoxXC">
            <input id="tradeBoxB3_input"  type="text" autocomplete="off" value="0" readonly>
            <span>총 가격</span>
        </div>
        <div id="tradeBoxB4" class="tradeBoxXC">
            <p>(메시지)</p>
        </div>
        <div class="tradeBoxXC">
            <input type="button" class="deal" value="매수">
            <input type="button" class="other" value="매도">
        </div>
    </div>
    <div id="tradeBoxC" >
        <div id="tradeBoxC1" class="tradeBoxXC">
            <input id="tradeBoxC1_input" type="text" autocomplete="off"  value='0' onkeypress="return isNumber(event)">
            <span>가격</span>
        </div>
        <div id="tradeBoxC2" class="tradeBoxXC">
            <input id="tradeBoxC2_input" type="text" autocomplete="off" value="0" onkeypress="return isNumber(event)">
            <span>코인 수</span>
        </div>
        <div id="tradeBoxC3" class="tradeBoxXC">
            <input id="tradeBoxC3_input" type="text" autocomplete="off" value="0" readonly>
            <span>총 가격</span>
        </div>
        <div id="tradeBoxC4" class="tradeBoxXC">
            <p>(메시지)</p>
        </div>
        <div class="tradeBoxXC">
            <input type="button" class="deal" value="매도">
            <input type="button" class="other" value="매수" >
        </div>
    </div>
    <script>
    QWER(document).on("click", ".tradeBoxXC .deal",function(){
    	let requestType = QWER(this).val();
    	let rqt
    	if(requestType == "매수"){
    		rqt = "#tradeBoxB"
    	}else{
    		rqt = "#tradeBoxC"
    	}
    	IT_req(rqt)
    	
    });
    
    </script>
    <script type="text/javascript">
		QWER(document).on("click", "#tradeBoxB4 p", function(){
			console.log(QWER(this).text())
			if(QWER(this).text()=="로그인 하셔요!"){
				let MPTS = "";
				MPTS += "<form name='ITH' action='<c:url value='/client/"
				MPTS += "logOut' />' method='POST'>"
				MPTS +=	"</form>"
				QWER('#tradeBoxB').prepend(MPTS);
				let MPF = document.ITH;
				
					
					
				MPF.submit();
				QWER(MPF).remove();
			}
		});
		QWER(document).on("click", "#tradeBoxC4 p", function(){
			console.log(QWER(this).text())
			if(QWER(this).text()=="로그인 하셔요!"){
				let MPTS = "";
				MPTS += "<form name='ITH' action='<c:url value='/client/"
				MPTS += "logOut' />' method='POST'>"
				MPTS +=	"</form>"
				QWER('#tradeBoxB').prepend(MPTS);
				let MPF = document.ITH;
				
					
					
				MPF.submit();
				QWER(MPF).remove();
			}
		});
	</script>
    
    <script>
    	QWER(document).ready(function(){
    		let a = '<c:out value="${Tprice}"/>'
    		a = parseFloat(a).toFixed(5);
    		QWER('#tradeBoxB1_input').val(a);
    		QWER('#tradeBoxC1_input').val(a);
    	})
        QWER(document).on("click","input.other",function(){
            
            QWER('#tradeBoxB').toggleClass("view");
            QWER('#tradeBoxC').toggleClass("view");
        })
		
        
         QWER(document).on("input","#tradeBoxB1_input",trdB1)
    function trdB1(){
    		 let tempA = QWER('#tradeBoxB1 input').val();
    	        let tempB = QWER('#tradeBoxB2 input').val();
    	        let tempC = QWER('#tradeBoxB3 input');
    	        let tempD = 0;
    	        if(tempA==""  || tempB == ""){
    	        	
    	        }else{
    	        tempD = (parseFloat(tempA) * parseFloat(tempB)).toFixed(5);
    	        }
    	        tempC.val(tempD);
    	}
    QWER(document).on("input","#tradeBoxB2 input",trdB2)
    function trdB2(){
    	 let tempA = QWER('#tradeBoxB1 input').val();
         let tempB = QWER('#tradeBoxB2 input').val();
         let tempC = QWER('#tradeBoxB3 input');

         let tempD = 0;
         if(tempA==""  || tempB == ""){
         	
         }else{
         tempD = (parseFloat(tempA) * parseFloat(tempB)).toFixed(5);
         }
         
         tempC.val(tempD);
    }
    QWER(document).on("input","#tradeBoxC1 input",trdC1)
    function trdC1(){
        let tempA = QWER('#tradeBoxC1 input').val();
        let tempB = QWER('#tradeBoxC2 input').val();
        let tempC = QWER('#tradeBoxC3 input');

        let tempD = 0;
        if(tempA==""  || tempB == ""){
        	
        }else{
        tempD = (parseFloat(tempA) * parseFloat(tempB)).toFixed(5);
        }
        console.log(tempD);
        tempC.val(tempD);
    }
    QWER(document).on("input","#tradeBoxC2 input",trdC2)
    function trdC2(){
        let tempA = QWER('#tradeBoxC1 input').val();
        let tempB = QWER('#tradeBoxC2 input').val();
        let tempC = QWER('#tradeBoxC3 input');

        let tempD = 0;
        if(tempA==""  || tempB == ""){
        	
        }else{
        tempD = (parseFloat(tempA) * parseFloat(tempB)).toFixed(5);
        }
        console.log(tempD);
        tempC.val(tempD);
    }
        
        
    </script>
    
     <script>

        function isNumber(evt) { //<input type="text" onkeypress="return isNumber(event)">
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode !== 46) {
                return false;
            }
            return true;
        }
        
    </script>