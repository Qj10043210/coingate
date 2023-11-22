<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$.noConflict();
var QWER = jQuery;
</script>

<script>
QWER(document).ready(checkCookie());
//Set the time interval in milliseconds (e.g., 1 minute = 60,000 milliseconds)
var interval = 8000; // 8 seconds

// Periodically check for the cookie
var cookieCheckInterval = setInterval(checkCookie, interval);
function checkCookie(){
	var sampleData = null;
	QWER.ajax({
        url: "<c:url value='/data/GetMainApi' />",
        type: "get",
        
        
        
        success: function(data) {
        	var tableLeftBody = QWER("#MainPage_tableLeft tbody");
        	var tableRightBody = QWER("#MainPage_tableRight tbody");
	        	tableLeftBody.empty();
	        	tableRightBody.empty();
        	if (Array.isArray(data)) {
        	data.forEach(function (item, index, array){
        		
        		if(index<50){
	        		var row = "<tr>";
	        		row += "<td>"+item.currency+ "</td>";
	                row += "<td  class='MainPage_td_unview'>" + item.openingPrice + "</td>";
	                row += "<td>" + item.closingPrice + "</td>";
	                row += "<td  class='MainPage_td_unview'>" + item.minPrice + "</td>";
	        		row += "<td  class='MainPage_td_unview'>" + item.maxPrice + "</td>";
	        		row += "<td  class='MainPage_td_unview'>" + item.unitsTraded + "</td>";
	        		row += "<td  class='MainPage_td_unview'>" + item.accTradeValue + "</td>";
	        		row += "<td  class='MainPage_td_unview'>" + item.prevClosingPrice + "</td>";
	        		row += "<td>" + item.unitsTraded24H + "</td>";
	        		row += "<td  class='MainPage_td_unview'>" + item.accTradeValue24H + "</td>";
	        		row += "<td  class='MainPage_td_unview'>" + item.fluctuate24H + "</td>";
	        		if(item.fluctuateRate24H > 0){
	        			row += "<td class='MPTDR_U'>" + item.fluctuateRate24H + "</td>";	
	        		}else if(item.fluctuateRate24H <0){
	        			row += "<td class='MPTDR_D'>" + item.fluctuateRate24H + "</td>";
	        		}else{
	        			row += "<td class='MPTDR_N'>" + item.fluctuateRate24H + "</td>";
	        		}	        		
	        		var unix_time = item.createdAt; 
	        		var b = Date(unix_time);
	        		var c = b.split(" ")
	        		var d = c[1]+"-"+ c[2]+" " + c[4]
	        		row += "<td class='MainPage_td_unview'>" + d+ "</td>";
	        		row += "</tr>";
	        		tableLeftBody.append(row);
        		}
        		else{
        			var row = "<tr>";
            		row += "<td>"+item.currency+ "</td>";
                    row += "<td  class='MainPage_td_unview'>" + item.openingPrice + "</td>";
                    row += "<td>" + item.closingPrice + "</td>";
                    row += "<td  class='MainPage_td_unview'>" + item.minPrice + "</td>";
            		row += "<td  class='MainPage_td_unview'>" + item.maxPrice + "</td>";
            		row += "<td  class='MainPage_td_unview'>" + item.unitsTraded + "</td>";
            		row += "<td  class='MainPage_td_unview'>" + item.accTradeValue + "</td>";
            		row += "<td  class='MainPage_td_unview'>" + item.prevClosingPrice + "</td>";
            		row += "<td>" + item.unitsTraded24H + "</td>";
            		row += "<td  class='MainPage_td_unview'>" + item.accTradeValue24H + "</td>";
            		row += "<td  class='MainPage_td_unview'>" + item.fluctuate24H + "</td>";
            		if(item.fluctuateRate24H > 0){
	        			row += "<td class='MPTDR_U'>" + item.fluctuateRate24H + "</td>";	
	        		}else if(item.fluctuateRate24H <0){
	        			row += "<td class='MPTDR_D'>" + item.fluctuateRate24H + "</td>";
	        		}else{
	        			row += "<td class='MPTDR_N'>" + item.fluctuateRate24H + "</td>";
	        		}
            		var unix_time = item.createdAt; 
            		var b = Date(unix_time);
            		var c = b.split(" ")
            		var d = c[1]+"-"+ c[2]+" " + c[4]
            		row += "<td class='MainPage_td_unview'>" + d+ "</td>";
            		row += "</tr>";
            		tableRightBody.append(row);
            		if (index === array.length - 1) {
            	        QWER('#MainPage_time_show_p2').text(d)
            	    }
        		}
        		//if(QWER('#uniqTitleBox1')!=null&&QWER('#uniqTitleBox1').val()==(item.currency)){
            	//	
            	//	QWER('#currentPrice').text(item.closingPrice);	
            	//}
        	});
        	
        	 }
        },
        error: function(errorThrown) {
            alert(errorThrown.statusText);
        }
    });
	
}


</script>