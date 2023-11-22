<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Market</title>
<link href="<c:url value='/resources/css/coins/Each_Detail.css' />" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$.noConflict();
var QWER = jQuery;
</script>  
 <style>
       
	.sort_option{
	display:block;
    		width:0px;
    		height:0px;
    		opacity:0;
	}

	#AsksAndBids{
	position:relative;
}
	
	#ABcurrentPrice{
	position:absolute;
	padding : 3%;
	top:-20%;
	right:-81%;
	border: 2px solid #aaa;
	border-radius : 15px;
	background-color : rgba(240,240,240,0.4);
}
#EachPage_RightSideDiv{
display:flex;
flex-direction:column;
justify-content : end;
padding-bottom : 4%;
}
    </style>
</head>

<body id="EachPage_Body">
<jsp:include page="../members/mypage/include/Header.jsp" />
			<input type="radio" name="sort_option" value="ASC" checked id="sort_option_asc" class="sort_option">
			<input type="radio" name="sort_option" value="DESC" id="sort_option_desc" class="sort_option">
			<div id="EachPage_mainDiv" class="flex">
				<div id="EachPage_LeftSideDiv">
					<div id="EachPage_LeftSide_TableDiv">
						<!-- <table id="EachPage_tableLeft" class="MainPage_table"> -->
						<table id="EachPage_tableHead" class="MainPage_table">
							<thead>
								<tr>
									<th>이름 <input type="radio" name="arrange_option" value="currency"></th>
									<th>가격 <input type="radio" name="arrange_option" value="closing_price"></th>
									<th>거래량 <input type="radio" name="arrange_option" value="units_traded_24H"> </th>
									<th>등락 <input type="radio" name="arrange_option" value="fluctuate_rate_24H"> </th>
								</tr>
							</thead>
						</table>
						<div id="coinlist">
							<table id="EachPage_tableLeft" class="MainPage_table">
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
				<div id="EachPage_MiddleSideDiv">
					<div id="EachPage_MiddleSide_TitleDiv" class="flex">
						<div>
							<c:out value="${Tcurrency}" />
						</div>
						<div id="nowP"></div>
					</div>
					<div id="EachPage_MiddleSide_GraphDiv">
						<jsp:include page="./include_each/Input_Graph.jsp" />
					</div>
					<div id="bottom" class="flex">
						<div id="EachPage_MiddleSide_AskBidDiv" class="flex">
							<div id="orderBox">
								<div id="saleOrder">매도주문</div>
								<div id="buyOrder">매수주문</div>
							</div>
							<div id="orderList">
								<div class="flex">
									<div>가격</div>
									<div>수량</div>
								</div>
								<div id="AsksAndBids">
									<jsp:include page="./include_each/Input_AskBid.jsp" />
								</div>
							</div>
						</div>
						<div id="EachPage_RightSideDiv">
							<jsp:include page="./include_each/Input_TradeTool.jsp" />
						</div>
					</div>
				</div>
			</div>
	
	

	
<jsp:include page="./include_each/Input_Recent_Main_EACH.jsp" />
<jsp:include page="../include_index/TableCreation.jsp" />



 <script type="text/javascript">
QWER(document).on("click", "#EachPage_tableLeft tbody tr", function(){
	let MPT =QWER(this).children("td").eq(0).text();
	let MPTS = "";
	MPTS += "<form name='ht' action='<c:url value='/data/"
	MPTS += "passToEach' />' method='POST'>"
	MPTS += "<input type='hidden' name='hiddenInput' value='";
	MPTS += MPT
	MPTS += "'/></form>"
	QWER('#EachPage_Body').prepend(MPTS);
	let MPF = document.ht;
	console.log(MPF)
	
	
	MPF.submit();
	QWER(MPF).remove();
	});

</script>
<jsp:include page="../members/mypage/include/Footer.jsp" />
</body>
</html>