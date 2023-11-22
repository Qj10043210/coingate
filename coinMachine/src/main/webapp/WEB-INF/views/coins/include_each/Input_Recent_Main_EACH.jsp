<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$.noConflict();
var QWER = jQuery;
</script>


<script>

const Buttons = QWER('#EachPage_tableHead input[name=arrange_option]');
const ButtonsSort = QWER('#EachPage_Body input[name=sort_option]'); 
var option = "id";
var sortOption = "asc";
var oldOption = "id";
QWER(document).ready(function(){
Buttons.change(function(){
    changeEvent(QWER(this));
    
    
});

function changeEvent(inputValue){
    if (inputValue.is(':checked')) {
        option = inputValue.val();
        oldOption = inputValue.val();
        sortOption = ButtonsSort.filter(':checked').val(); 
        
        IRMES();
    }
}

Buttons.click(function(){
    option = QWER(this).val();
    
    if(oldOption == option){
        //드디어 찾은 이 순간
        if(QWER('#sort_option_asc').is(':checked')){
			QWER('#sort_option_asc').prop("checked",false);
			QWER('#sort_option_desc').prop("checked",true);
            changeEvent(QWER(this));
		}else{
			QWER('#sort_option_asc').prop("checked",true);
			QWER('#sort_option_desc').prop("checked",false);
            changeEvent(QWER(this));
		}
    }else{
        //change somthing
        QWER('#sort_option_asc').prop("checked",true);
		QWER('#sort_option_desc').prop("checked",false);
    }
        
    
    
})
IRMES()
//Set the time interval in milliseconds (e.g., 1 minute = 60,000 milliseconds)
var interval = 8000; // 8 seconds

// Periodically check for the cookie
var IRME = setInterval(IRMES, interval);
function IRMES(){
	var sampleData = null;
	
	
	QWER.ajax({
        url: "<c:url value='/data/GetMainApiEachSituation' />",
        type: "post",
        
        data : {situation: option, situ : sortOption},
        
        success: function(data) {
        	var tableBody = QWER("#EachPage_tableLeft tbody");
	        	tableBody.empty();
	        	
        	if (Array.isArray(data)) {
        	data.forEach(function (item, index){
        			var row = ""
        			if (item.fluctuateRate24H > 0) {
						row = "<tr class='up'>";
						//setTable(item, index, nowPrice)
					} else if (item.fluctuateRate24H < 0) {
						row = "<tr class='down'>";
						//setTable(item, index, nowPrice)
					} else if (item.fluctuateRate24H == 0) {
						row = "<tr>";
						//setTable(item, index, nowPrice)
					}
	        		row += "<td>"+item.currency+ "</td>";
	                //row += "<td  class='MainPage_td_unview'>" + item.openingPrice + "</td>";
	                row += "<td>" + item.closingPrice + "</td>";
	                //row += "<td  class='MainPage_td_unview'>" + item.minPrice + "</td>";
	        		//row += "<td  class='MainPage_td_unview'>" + item.maxPrice + "</td>";
	        		//row += "<td  class='MainPage_td_unview'>" + item.unitsTraded + "</td>";
	        		//row += "<td  class='MainPage_td_unview'>" + item.accTradeValue + "</td>";
	        		//row += "<td  class='MainPage_td_unview'>" + item.prevClosingPrice + "</td>";
	        		row += "<td>" + item.unitsTraded24H + "</td>";
	        		//row += "<td  class='MainPage_td_unview'>" + item.accTradeValue24H + "</td>";
	        		//row += "<td  class='MainPage_td_unview'>" + item.fluctuate24H + "</td>";
	        		row += "<td>" + item.fluctuateRate24H + "</td>";
	        		var unix_time = item.createdAt; 
	        		var b = Date(unix_time);
	        		var c = b.split(" ")
	        		var d = c[1]+"-"+ c[2]+" " + c[4]
	        		//row += "<td>" + d+ "</td>";
	        		row += "</tr>";
	        		tableBody.append(row);
        		
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

});
</script>