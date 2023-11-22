<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$.noConflict();
var QWER = jQuery;
</script>
<style>

</style>
</head>
<body>
<input type="hidden" name="hiddenInputCall" value='<c:out value="${Tcurrency}"/>'>
<div id="AsksListHere">
</div>
<div id="BidsListHere">
</div>
<h1 id="ABcurrentPrice">

</h1>



<script>
var interval = 10500;
QWER(document).ready(function(){
	action();
	var fuckInterval = setInterval(action, interval);
	function action(){
		var selectedCurrency = QWER('input[name=hiddenInputCall]').val();
		QWER.ajax({
			url: "<c:url value='/data/GetAsksBids' />", 
            type: 'GET',
            success: function(data) {
            	let bids = data.bids;
            	let asks = data.asks;
            	var filteredBidsData = bids.filter(function(item){
            		return item.currency == selectedCurrency;
            	});
            	var filteredAsksData = asks.filter(function(item){
            		return item.currency == selectedCurrency;
            	});
            	var bidsPrice = filteredBidsData.map(function(item){
            		return item.bids_Price;
            	});
            	var asksPrice = filteredAsksData.map(function(item){
            		return item.asks_Price;
            	});
            	var bidsQuant = filteredBidsData.map(function(item){
            		return item.bids_Quant;
            	});
            	var asksQuant = filteredAsksData.map(function(item){
            		return item.asks_Quant;
            	});
            	iEmptyList();
            	iMakeListA(filteredAsksData);
            	iMakeListB(filteredBidsData);
            	
            	
            },
            error : function(error){
            	console.error('Error retrieving data:', error);
            }
		});
	}
	function iEmptyList(){
		var hereYourAre1 = QWER("#AsksListHere");
		var hereYourAre2 = QWER("#BidsListHere");
		
		hereYourAre1.empty();
		hereYourAre2.empty();
		
		
	};
	
	function iMakeListA(lists){
		var hereYourAre = QWER("#AsksListHere");
		let hereText = "";
		lists.forEach((item)=>{
			if(item.bids_Price != null){//case:bids
				hereText += "<div class='flex'><div class='bids price'>"+item.bids_Price+"</div><div class='bids quant'>"+item.bids_Quant+"</div></div>"
			}
			else{//case:asks
				hereText += "<div class='flex'><div class='asks price'>"+item.asks_Price+"</div><div class='asks quant'>"+item.asks_Quant+"</div></div>"
			}
		})
		hereYourAre.append(hereText);
	};
	function iMakeListB(lists){
		var hereYourAre = QWER("#BidsListHere");
		let hereText = "";
		lists.forEach((item)=>{
			if(item.bids_Price != null){//case:bids
				hereText += "<div class='flex'><div class='bids price'>"+item.bids_Price+"</div><div class='bids quant'>"+item.bids_Quant+"</div></div>"
			}
			else{//case:asks
				hereText += "<div class='flex'><div class='asks price'>"+item.asks_Price+"</div><div class='asks quant'>"+item.asks_Quant+"</div></div>"
			}
		})
		hereYourAre.append(hereText);
	};
	QWER(document).on("click", ".flex .bids.price", function(){
		console.log(QWER(this).text())
		QWER('#tradeBoxC1_input').val(QWER(this).text());
		 QWER('#tradeBoxC').addClass("view");
         QWER('#tradeBoxB').removeClass("view");
         QWER('#tradeBoxC1_input').focus();
         trdB1()
	});
	QWER(document).on("click", ".flex .asks.price", function(){
		QWER('#tradeBoxB1_input').val(QWER(this).text());
		QWER('#tradeBoxC').removeClass("view");
        QWER('#tradeBoxB').addClass("view");
        QWER('#tradeBoxB1_input').focus();
        trdB2()
	});
	QWER(document).on("click", ".flex .bids.quant", function(){
		console.log(QWER(this).text())
		QWER('#tradeBoxC2_input').val(QWER(this).text());
		 QWER('#tradeBoxC').addClass("view");
         QWER('#tradeBoxB').removeClass("view");
         QWER('#tradeBoxC2_input').focus();
         trdC1()
	});
	QWER(document).on("click", ".flex .asks.quant", function(){
		QWER('#tradeBoxB2_input').val(QWER(this).text());
		QWER('#tradeBoxC').removeClass("view");
        QWER('#tradeBoxB').addClass("view");
        QWER('#tradeBoxB2_input').focus();
        trdC2()
	});
}); 
</script>

</body>
</html>