<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value='/resources/css/mypage/Trade_history.css' />"
	rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


</head>
<body>

	<jsp:include page="./include/Header.jsp" />

<section id="section">
        <article class="article row">
            <div class="trading">
                <h2>거래내역</h2>
            </div>
            <div class="dropdown_wrap">
                <div class="dropdown">
                    <div class="dropbtn" id="dropdownbtn_1">매수/매도 <i class="fa-solid fa-chevron-down"></i></div>
                    <div class="dropdown-content" id="dropdownContent1">
                        <a href="" id = "buyOption">매수</a>
                        <a href="" id = "sellOption">매도</a>
                </div>
                </div>
                <div class="dropdown">
                <form action="" name="search_Currency_form" class="currency_type">
                    <input type="text" name="C_name" placeholder="코인 이름을 입력하세요.">
                    <input type="button" value="검색" id = "searchbtn">
                </form>
                
                </div>
            </div>
            </div>
            <table class="trade_history">
                <colgroup>
                    <col width="100px">
                    <col width="240px">
                    <col width="240px">
                    <col width="240px">
                    <col width="240px">
                    <col width="300px">
                </colgroup>
                <thead>
                    <tr class="head">
                        <th class="tx_c">구분</th>
                        <th class="tx_c">페어</th>
                        <th class="tx_c">평균거래단가</th>
                        <th class="tx_c">거래수량</th>
                        <th class="tx_c">거래금액</th>                        
                        <th class="tx_c">체결시간</th>
                    </tr>
                </thead>
                
                <tbody class = "trade_list">
                </tbody>
            </table>
        </article>
    </section>

	<jsp:include page="./include/Footer.jsp" />
<script>
$.noConflict();
var QWER = jQuery;
var tradeTypeText
	// 매수/매도 토글
	QWER(document).ready(function(){
		QWER("#dropdownbtn_1").click(function(){
			QWER("#dropdownContent1").toggle();
		})
		QWER("#buyOption").click(function(){
			QWER("#dropdownbtn_1").text("매수");
			QWER("#dropdownContent1").hide();
			return false;
		})
		QWER("#sellOption").click(function() {
		     QWER("#dropdownbtn_1").text("매도");
		     QWER("#dropdownContent1").hide();
		     return false;
		});
		QWER(document).on("click", function(event) {
	        if (!event.target.matches('#dropdownbtn_1')) {
	            QWER("#dropdownContent1").hide();
	        }
	    });
	});
	
	// 매수, 매도 각각 리스트화
	QWER(document).ready(function(){
		
		QWER("#buyOption").click(function(){
			loadTrades(0);	
		});
		QWER("#sellOption").click(function(){
			loadTrades(1);
		});
		
		function loadTrades(tradeType) {
			QWER.ajax({
				url: "${pageContext.request.contextPath}/member/history/selectTradeType/"+tradeType,	
				method : "get",
				// data : { tradeType: tradeType },
				//dataType : "json",
				contentType : 'application/json; charset=utf-8',
				success: function(data) {
					var table = QWER(".trade_list");
		        	table.empty(); // 테이블 비우기
		        	QWER.each(data.trade, function(index, trade) {
		        		tradeTypeText = tradeType;
		            	//console.log(tradeTypeText);
		            	if(tradeTypeText == 0){
		            		table.append("<tr><td>" + "매수" + "</td><td class='tx_c'>" + trade.currency + "</td><td class='tx_c'>" + trade.purchase_price + "</td><td class='tx_c'>" + trade.no_of_trade + "</td><td class='tx_c'>" + trade.trade_amount + "</td><td class='tx_c'>" + trade.trade_time + "</td></tr>");
		            	} else {
		            		table.append("<tr><td>" + "매도" + "</td><td class='tx_c'>" + trade.currency + "</td><td class='tx_c'>" + trade.purchase_price + "</td><td class='tx_c'>" + trade.no_of_trade + "</td><td class='tx_c'>" + trade.trade_amount + "</td><td class='tx_c'>" + trade.trade_time + "</td></tr>");
		            	}
		        	});
		    	}
			});
		}
	});
	
	// 코인 이름 검색 
	QWER("#searchbtn").on("click", function(){
		let currency = QWER("input[name=C_name]").val();
				QWER.ajax({
					url: "${pageContext.request.contextPath}/member/history/searchCurrencyConfirm/"+currency,
					method : "get",
					contentType : 'application/json; charset=utf-8',
					success: function(result) {	
					//	console.log(result.currencys);
						var table = QWER(".trade_list");
						table.empty();
						QWER.each(result.currencys, function(index, currency){
							tradeTypeText = currency.trade_type;
							if(tradeTypeText == 0){
								table.append("<tr><td>" + "매수" + "</td><td class='tx_c'>" + currency.currency + "</td><td class='tx_c'>" + currency.purchase_price + "</td><td class='tx_c'>" + currency.no_of_trade + "</td><td class='tx_c'>" + currency.trade_amount + "</td><td class='tx_c'>" + currency.trade_time + "</td></tr>");
							} else {
								table.append("<tr><td>" + "매도" + "</td><td class='tx_c'>" + currency.currency + "</td><td class='tx_c'>" + currency.purchase_price + "</td><td class='tx_c'>" + currency.no_of_trade + "</td><td class='tx_c'>" + currency.trade_amount + "</td><td class='tx_c'>" + currency.trade_time + "</td></tr>");
							}
						})
		
					}
				})
			
	})
	
	// 기본 리스트
	QWER(document).ready(function(){
		QWER.ajax({
			url: "${pageContext.request.contextPath}/member/history/tradelist",
			method : "get",
			contentType : 'application/json; charset=utf-8',
			success: function(rdata){
				console.log(rdata.historyVos);
				var table = QWER(".trade_list");
				rdata.forEach(function(item, index){
					tradeTypeText = item.trade_type;
					if(tradeTypeText == 0){
						table.append("<tr><td>" + "매수" + "</td><td class='tx_c'>" + item.currency + "</td><td class='tx_c'>" + item.purchase_price + "</td><td class='tx_c'>" + item.no_of_trade + "</td><td class='tx_c'>" + item.trade_amount + "</td><td class='tx_c'>" + item.trade_time + "</td></tr>");
					} else {
						table.append("<tr><td>" + "매도" + "</td><td class='tx_c'>" + item.currency + "</td><td class='tx_c'>" + item.purchase_price + "</td><td class='tx_c'>" + item.no_of_trade + "</td><td class='tx_c'>" + item.trade_amount + "</td><td class='tx_c'>" + item.trade_time + "</td></tr>");
					}
				})
			}
		})
	})
	
</script>
</body>
</html>