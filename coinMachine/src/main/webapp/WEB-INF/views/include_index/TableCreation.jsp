<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$.noConflict();
var QWER = jQuery;
</script>  

<script>
function checkCookie() {
	// Check if the cookie exists
	var cookieValue = document.cookie.replace(/(?:(?:^|.*;\s*)yourCookieName\s*\=\s*([^;]*).*$)|^.*$/, "$1");

	if (cookieValue !== "") {
		// The cookie exists, so you can perform actions based on its presence
		//console.log("Your cookie exists with value: " + cookieValue);

	} else {
		var now = new Date();
		now.setTime(now.getTime() + 10000); // 10초( 1000=1) 10~12초 마다 UPDATE;
		var expires = "expires=" + now.toUTCString();
		document.cookie = "yourCookieName=yourCookieValue; " + expires;
		dataCall();
		dataCallAB()
		
	}
}
var interval = 2000; // 2초마다 쿠키 확인
var cookieCheckInterval = setInterval(checkCookie, interval);

// api -> table ((((MAIN))))
			function dataCall() {
			
				const options = { method: 'GET', headers: { accept: 'application/json' } };
				let obj;
				let obj2;
				let obj3;
				fetch('https://api.bithumb.com/public/ticker/ALL_KRW', options)
					.then(response => response.json())
					.then(response => {
						obj = response;
			
						const propertyNames = Object.keys(obj);
			
			
						const propertyValues = Object.values(obj);
			
			
						const obj2 = obj.data
						obj3 = Object.keys(obj2).map((key) => [key, obj2[key]]);
			
			
						for (let i = 0; i < obj3.length - 1; i++) {
							obj3[i][1] = Object.keys(obj3[i][1]).map((key) => [key, obj3[i][1][key]]);
						}
			
			
						test();
					})
					.catch(err => console.error(err));
			
			
				function test() {
					var dataToSend = obj3;
					QWER.ajax({
						url: "<c:url value='/data/postMainAPI' />",
						type: "post",
						contentType: "application/json",
						data: JSON.stringify(dataToSend),
			
			
						success: function (data) {
							//console.log("table got datas");
						},
						error: function (errorThrown) {
							alert(errorThrown.statusText);
						}
					});
				}
			}
//API -> TABLE (((BIDS,ASKS)))
				function dataCallAB() {

			const options = { method: 'GET', headers: { accept: 'application/json' } };
			let obj;
			let obj2;
			let obj3;
			fetch('https://api.bithumb.com/public/orderbook/All_KRW', options)
				.then(response => response.json())
				.then(response => {
					obj = response;
					const propertyNames = Object.keys(obj);
					const propertyValues = Object.values(obj);
					const obj2 = propertyValues[1];
					obj3 = Object.keys(obj2).map((key) => [key, obj2[key]]);
					obj4 = Object.keys(obj2).map((key) => [key, obj2[key]]);
					for (let i = 2; i < obj3.length; i++) {
						obj3[i][1] = Object.keys(obj3[i][1]).map((key) => [key, obj3[i][1][key]]);
						obj4[i][1] = Object.keys(obj4[i][1]).map((key) => [key, obj4[i][1][key]]);
					}
					for (let i = 2; i < obj3.length; i++) {
						for (let j = 0; j < obj3[i][1][1][1].length; j++) {
							obj3[i][1][1][1][j] = Object.entries(obj3[i][1][1][1][j]);
							obj4[i][1][1][1][j] = Object.entries(obj4[i][1][1][1][j]);
						}
						for (let k = 0; k < obj3[i][1][2][1].length; k++) {
							obj3[i][1][2][1][k] = Object.entries(obj3[i][1][2][1][k]);
							obj4[i][1][2][1][k] = Object.entries(obj4[i][1][2][1][k]);
						}
					}
					for (let i = 2; i < obj3.length; i++) {
						for (let j = 0; j < obj3[i][1][1][1].length; j++) {
							obj3[i][1][1][1][j] = obj3[i][1][1][1][j].map((item) => item[1]);
							obj4[i][1][1][1][j] = obj4[i][1][1][1][j].map((item) => item[1]);
							
						}
						for (let k = 0; k < obj3[i][1][2][1].length; k++) {
							obj3[i][1][2][1][k] = obj3[i][1][2][1][k].map((item) => item[1]);
							obj4[i][1][2][1][k] = obj4[i][1][2][1][k].map((item) => item[1]);
							
						}

					} 
					obj3.shift();
					obj3.shift();
					obj4.shift();
					obj4.shift(); //cut timeStamp, currency
					for (let i = 0; i < obj3.length; i++) {
						obj3[i][1].shift();//cut currency
						obj4[i][1].shift();//cut currency
					}
					for (let i = 0; i < obj3.length; i++) {
						obj3[i][1].splice(1, 1); //delete asks
						obj4[i][1].shift(); // delete bids
					}
					test2();
					test3();
				})
				.catch(err => console.error(err));


			function test2() {
				var dataToSend = obj3;
				QWER.ajax({
					url: "<c:url value='/data/postBIDSAPI' />",
					type: "post",
					contentType: "application/json",
					data: JSON.stringify(dataToSend),


					success: function (data) {
						//console.log("table got datas");
					},
					error: function (errorThrown) {
						alert(errorThrown.statusText);
					}
				});
			}
			function test3() {
				var dataToSend2 = obj4;
				QWER.ajax({
					url: "<c:url value='/data/postASKSAPI' />",
					type: "post",
					contentType: "application/json",
					data: JSON.stringify(dataToSend2),


					success: function (data) {
						//console.log("table got datas");
					},
					error: function (errorThrown) {
						alert(errorThrown.statusText);
					}
				});
			}
		}

</script>