<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value='/resources/css/mypage/Asset.css' />"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$.noConflict();
	var QWER = jQuery;
</script>
<style>
.article1 .asset_detail {
  align-items: center;
  padding-left: 10px;
  border: 2px solid #777;
  border-radius: 10px;
  display: flex;
  justify-content: space-between;
}
.article1 .asset_detail #assetNameHere{
	flex-grow : 1;
}
.article1 .asset_detail #assetMoneyHere{
	flex-grow : 1;
}
.article1 .asset_detail #assetCoinHere{
	flex-grow : 6;
	display:flex;
	justify-content: end;
	flex-wrap:wrap;
}
.article1 .asset_detail #assetCoinHere .assetCoins{
	display:flex;
	flex-wrap:wrap;
}
.article1 .asset_detail #assetCoinHere .assetCoins .assetCoins_cur{
	flex-basis : 40px;
	flex-grow :0;
	flex-shrink : 0;
}
.article1 .asset_detail #assetCoinHere .assetCoins .assetCoins_cur_num{
	
	width :80px;
	flex-grow :0;
	overflow:hidden;
	text-overflow: ellipsis;
}

#assetNameHere a:visited {
	color: red;
	text-decoration: none;
}

#assetNameHere a:link {
	color: red;
	text-decoration: none;
}
.coin_list tr td:last-child{

		display:flex;
		justify-content : end;
	}

	.coin_list  tr td span{
		display:block;
	}
	

</style>
</head>
<body>

	<jsp:include page="./include/Header.jsp" />

	<section id="section">
		<article class="article1 row">
			<div class="asset_title">
				<h2>자산내역</h2>
			</div>
			<div class="asset_detail">
				<h3 id="assetNameHere"></h3>
				<h2 id="assetMoneyHere"></h2>
				<div id="assetCoinHere"></div>

			</div>
		</article>
		<article class="article2 row">
			<div class="my_title">
				<h3>나의자산</h3>
				<dl class="sum-box">
					<dt>- 총 수익률 : <span id="detailAllPer"></span>%</dt>
					<dt>- 총 거래금액 (KRW) : <span id="detailAlldeal"></span>원</dt>
					<dt>- 총 평가손익 (%) : <span id="detailAllHow"></span></dt>
					<dt>- 주문가능원화 : <span id="detailMoney"></span>원</dt>
				</dl>
			</div>
		</article>
		<article class="article3 row">
			<table class="my_table">
				<colgroup>
					<col width="220px">
					<col width="180px">
					<col width="180px">
					<col width="180px">
					<col width="180px">
					<col width="180px">
					<col width="130px">
					<col width="110px">
				</colgroup>
				<thead>
					<tr>
						<th>코인명</th>
						
						<th class="tx_r">거래개수</th>
						<th class="tx_r">거래금액</th>
						
						<th class="tx_r">평가손익(KRW)%</th>
						<th class="tx_r">기타</th>
					</tr>
				</thead>
				<tbody class="coin_list">
			
				</tbody>
			</table>
		</article>
	</section>

	<jsp:include page="./include/Footer.jsp" />
	<script>
	QWER(document).ready(function(){
		let setAssetIntervalTime = 1000;
		let setAssetInterval = setInterval(AssetNameCheck, setAssetIntervalTime);
		function AssetNameCheck(){
			let a = '${sessionScope.joinedId}';
			if (a == null||a == ""){ //로그인 안 함
				QWER('#assetNameHere').text("");
				let q = "<a href='<c:url value='/member/index' />' > 로그인을 하셔야 합니다. </a>"
				QWER('#assetNameHere').html(q);
			}else{ //로그인 함 
				let q = a + " 님의 자산은 다음과 같습니다."
				QWER('#assetNameHere').text(q);
				clearInterval(setAssetInterval);
				ASMoneyHere(a);
				ASCoinHere(a)
				ASCoinTradesHere(a)
			}
		}
		function ASMoneyHere(a){
			QWER.ajax({
				url: "<c:url value='/client/balance' />",
				type:"get",
				data : {reqId : a},
				success: function(data){
					QWER('#assetMoneyHere').text(data)
				},
				error : function(errorThrown){
					alert(errorThrown.statusText);
				}
				
			});
		};
		function ASCoinHere(a){
			QWER.ajax({
				url: "<c:url value='/client/getAllCoins' />",
				type:"get",
				data : {reqId : a},
				success: function(data){
					
					data.forEach((item)=>{
						let tempQQ = ""
						if(item.currency_num >0){
						tempQQ += "<div class='assetCoins'> <div class='assetCoins_cur'>";
						tempQQ += item.currency;
						tempQQ += "</div><div class='assetCoins_cur_num'>"
						tempQQ += item.currency_num;
						tempQQ += "</div></div>"
						QWER('#assetCoinHere').append(tempQQ);
						}
					})
				},
				error : function(errorThrown){
					alert(errorThrown.statusText);
				}
				
			});
		};
		function ASCoinTradesHere(a){
				QWER.ajax({
					url: "<c:url value='/client/getAllCoinTrades' />",
					type:"get",
					data : {reqId : a},
					success: function(data){
						let def_dataList = {}
						data.forEach((items)=>{
							let q = items.currency;
							if(!def_dataList.hasOwnProperty(q)){ //존재 안 함
								
								def_dataList[q] = {
										ALLCOUNT : parseFloat(items.noOfTrade),
										ALLAMOUNT : parseFloat(items.totalTradeAmount),
										ALLFINAL : 0,
								};
								
								if(items.tradeType == 0){ //매수
									def_dataList[q].ALLFINAL += (parseFloat(items.noOfTrade) *( parseFloat(items.purchasePrice) - parseFloat(items.tradeAmount) ) )
								}else{ //매도
									def_dataList[q].ALLFINAL += (parseFloat(items.noOfTrade) *(  parseFloat(items.tradeAmount) - parseFloat(items.purchasePrice) ) )
								};
							}else{
								
								
								
								def_dataList[q].ALLCOUNT += parseFloat(items.noOfTrade);
								def_dataList[q].ALLAMOUNT += parseFloat(items.totalTradeAmount);
								if(items.tradeType == 0){ //매수
									def_dataList[q].ALLFINAL += (parseFloat(items.noOfTrade) *( parseFloat(items.purchasePrice) - parseFloat(items.tradeAmount) ) )
								}else{ //매도
									def_dataList[q].ALLFINAL += (parseFloat(items.noOfTrade) *(  parseFloat(items.tradeAmount) - parseFloat(items.purchasePrice) ) )
								}
							};
							
							
						});
						for(var key in def_dataList){
								let tempQQ = ""
								if(def_dataList.hasOwnProperty(key)){
									var curName = key;
									var curObject = def_dataList[key];
									console.log(key)
									console.log(def_dataList[key])
									tempQQ += "<tr class='fvtWrap'>";
									tempQQ += "<td><span class='ASTC'>"
									tempQQ += curName;
									tempQQ +="</span></td>";
									tempQQ += "<td><span class='ASTCOUNT'>"
									tempQQ += curObject.ALLCOUNT;
									tempQQ +="</span></td>";
									tempQQ += "<td><span class='ASTAMOUNT'>"
									tempQQ += curObject.ALLAMOUNT;
									tempQQ +="</span></td>";
									tempQQ += "<td><span class='ASTFINAL'>"
									let q =	curObject.ALLFINAL;
									let w = curObject.ALLAMOUNT;
									let e = (q /w) * 100
									tempQQ += e;
									tempQQ +="</span></td>";
									tempQQ +="<td><span class='ASTdeal'>거래하기</span></td></tr>"
									QWER('.coin_list').append(tempQQ);	
									
								}
							
						}
						ASUserBalance()
						
					},
					error : function(errorThrown){
						alert(errorThrown.statusText);
					}
					
				});
			};
			function ASUserBalance(){
				var sumASTCOUNT = 0;
				  var sumASTAMOUNT = 0;
				  var sumASTFINAL = 0;

				  // Loop through each row in the table
				  QWER(".coin_list tr").each(function() {
				    var row = QWER(this);
				    // Parse and accumulate the values for each class
				    var counts = parseFloat(row.find(".ASTCOUNT").text());
				    var amounts = parseFloat(row.find(".ASTAMOUNT").text());
				    var finals = parseFloat(row.find(".ASTFINAL").text());

				    if (!isNaN(counts)) {
				      sumASTCOUNT += counts;
				    }
				    if (!isNaN(amounts)) {
				      sumASTAMOUNT += amounts;
				    }
				    if (!isNaN(finals)) {
				      sumASTFINAL += finals;
				    }
				  });
				  let abcde = QWER('#assetMoneyHere').text();
				  let eee = 50000000 - parseFloat(abcde)
				  if (eee < 0){
					  eee = 50000000 + eee;
					  eee = eee / 50000000 * 100
					  eee = eee.toFixed(5);
				  }else{
					  eee = eee / 50000000 * 100
					  eee = "-" + eee.toFixed(5);
				  }
				  QWER('#detailAllPer').text(eee)
				  QWER('#detailAllHow').text(sumASTFINAL.toFixed(5))
				  QWER('#detailAlldeal').text(sumASTAMOUNT)
				  QWER('#detailMoney').text(abcde)
			}
			QWER(document).on("click", ".ASTdeal", function(){
				let MPT =QWER(this).closest("tr").find(".ASTC").text();
				//console.log(MPT)
				let MPTS = "";
				MPTS += "<form name='htt' action='<c:url value='/data/"
				MPTS += "passToEach' />' method='POST'>"
				MPTS += "<input type='hidden' name='hiddenInput' value='";
				MPTS += MPT
				MPTS += "'/></form>"
				QWER('#section').prepend(MPTS);
				let MPF = document.htt;
				//console.log(MPF)
				
				
				MPF.submit();
				QWER(MPF).remove();

			})
			
			
		})
	</script>
</body>
</html>