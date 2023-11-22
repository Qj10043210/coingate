<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Price Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
$.noConflict();
var QWER = jQuery;
</script>
    <style>
    	.Graph_hidden{
    		display:block;
    		width:0px;
    		height:0px;
    		opacity:0;
    	}
    </style>
</head>
<body>
	<h1 class="Graph_hidden"><c:out value="${Tcurrency}"/></h1>
	<input id="uniqTitleBox1"class="here Grahph_hidden" type="hidden" value='<c:out value="${Tcurrency}"/>'>
    <div class="Graph_hidden">
        <label for="currencySelect">Select a currency: </label>
        <select id="currencySelect">
            <option value="<c:out value='${Tcurrency}'/>">BTC</option>
            <option value="ETH">ETH</option>
            
        </select>
    </div>
    <canvas id="priceChart" width="400" height="200"></canvas>
    
    <script>
   		var interval = 10000; // 10 seconds
        QWER(document).ready(function() {
            // Define the Chart.js configuration
            var ctx = document.getElementById('priceChart').getContext('2d');
            var priceChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: [], // x-axis labels (created_at)
                    datasets: 
                    //	[{
                     //   label: 'Min Price',
                      //  data: [], // min_price values
                       // borderColor: 'blue',
                        //fill: false
                    //}
                    	[ {
                        label: 'Max Price',
                        data: [], // max_price values
                        borderColor: 'green',
                        fill: false
                    }]
                },
                options: {
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: ' ',
                            },
                            ticks:{
                            	 maxTicksLimit: 1
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Price'
                                
                               
                            },
                           ticks:{
                            	suggestedMin: 0,
                            	suggestedMax: 0,
                            }
                            
                        }
                    },
                  
                
                }
            });
            
			action();
         // Periodically check for the cookie
            var cookieCheckInterval = setInterval(action, interval);
			
            // AJAX request to fetch data for the selected currency
            function action() {
                var selectedCurrency = QWER('.here').val();
                QWER.ajax({
                    url: "<c:url value='/data/GetTablesForGraph' />", // Your controller endpoint
                    type: 'GET',
                    
                    success: function(data) {
                        // Prepare data for the chart
                        var filteredData = data.filter(function(item) {
                            return item.currency === selectedCurrency;
                        });

                       var labels = filteredData.map(function(item) {
                       	//var unix_time = item.createdAt; 
                   		//var b = Date(unix_time);
                   		//var c = b.split(" ")
                  		//var d = c[1]+"-"+ c[2]+" " + c[4]
                   			var d =" ";
                        	return d;
                       });
                  		
                        var minPrices = filteredData.map(function(item) {
                            return item.openingPrice;
                        });
                        var maxPrices = filteredData.map(function(item,index,array) {
                        	 if (index === array.length - 1) {
                        	        QWER('#ABcurrentPrice').text(item.closingPrice)
                        	    }
                        	return item.closingPrice;
                        });
                        var suggestedMinValue = Math.min(...maxPrices) * 0.8;
                        var suggestedMaxValue = Math.max(...maxPrices) * 1.3;
                        // Populate the chart data with the prepared data
                        priceChart.data.labels = labels;
                        //priceChart.data.datasets[0].data = minPrices;
                        priceChart.data.datasets[0].data = maxPrices;
                        priceChart.options.scales.y.ticks.suggestedMin = suggestedMinValue;
                        priceChart.options.scales.y.ticks.suggestedMax = suggestedMaxValue;
                        
                        priceChart.update();
                    },
                    error: function(error) {
                        console.error('Error retrieving data:', error);
                    }
                });
            };
        });
    </script>
</body>
</html>
