<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="dataUrl" value='<c:url value="/data/passToEach" />' />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$.noConflict();
	var QWER = jQuery;
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap")
	;

@import
	url("https://cdn.jsdelivr.net/npm/galmuri@latest/dist/galmuri.css");

.MainPage_td_unview {
	display: none;
}

#MainPage_Body {
	font-family: Galmuri9;
	background: black;
	color: white;
	height: 100vh;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#mainPage_Body .MainPage_table {
	
}

#mainPage_Body .MainPage_table {
	font-size:1.2em;
	
}


#MainPage_mainDiv {
	display: flex;
	height:100%;
	position:relative;
}

#MainPage_tableLeftDiv {
	flex-grow: 2.2;
	display: flex;
	justify-content: center;
	overflow: scroll;
	scroll-behavior: smooth;
}

#MainPage_tableLeftDiv::-webkit-scrollbar {
	width: 0px;
}

#MainPage_tableRightDiv {
	flex-grow: 2.2;
	display: flex;
	justify-content: center;
	overflow: scroll;
	scroll-behavior: smooth;
}

#MainPage_tableRightDiv::-webkit-scrollbar {
	width: 0px;
}

#MainPage_middleDiv {
	flex-grow: 0.8;
	display: flex;
	justify-content: center;
	
}
#MainPage_time_show{
	position: absolute;
  top: 5%;
  left: 50%;
  transform: translate(-50%, -50%);
  display:flex;
  flex-direction : column;
  align-items: center;
} 
#MainPage_time_show #MainPage_time_show_p1{color:yellow;} 
#MainPage_time_show #MainPage_time_show_p2{
	
}

@keyframes animate_index_blink { 
            0% { 
                opacity: 1; 
            } 
  
            50% { 
                opacity: 0.1; 
            } 
  
            100% { 
                opacity: 1; 
            } 
}
.MainPage_table{
padding-top : 0.6em;
}
.MainPage_table tr td{
	padding-left:0.2em;
	padding-right:0.2em;

}
.MainPage_table tr td:nth-child(3){
	padding-left : 0.3em;
	padding-right : 0.3em;
	color: #ffa07a;
}
.MainPage_table .MPTDR_U{color:rgb(241,50,50);}  
.MainPage_table .MPTDR_U::before{color:red; content:"▲+"}  
.MainPage_table .MPTDR_N{color:rgb(240,240,240);}  
.MainPage_table .MPTDR_N::before{color:white; content:"　　"}  
.MainPage_table .MPTDR_D{color:rgb(50,50,241);}  
.MainPage_table .MPTDR_D::before{color:blue; content:"▼"}  
</style>
<!-- animation : animate_index_blink 1s linear infinite; -->
</head>
<body id="MainPage_Body">
	<div id="MainPage_mainDiv">
		<div id="MainPage_tableLeftDiv">
			<table id="MainPage_tableLeft" class="MainPage_table">
				<tbody></tbody>
			</table>
		</div>
		<div id="MainPage_middleDiv">
			<jsp:include page="./include_index/Input_Main_Info.jsp" />
		</div>
		<div id="MainPage_tableRightDiv">
			<table id="MainPage_tableRight" class="MainPage_table">
				<tbody></tbody>
			</table>
		</div>
		<div id="MainPage_time_show">
			<p id="MainPage_time_show_p1">최근 갱신 시각 </p>
			<p id="MainPage_time_show_p2"></p>
		</div>
	</div>

	<jsp:include page="./include_index/TableCreation.jsp" />
	<jsp:include page="./include_index/Input_Recent_Main.jsp" />
	<jsp:include page="./include_index/Include_userInfo.jsp" />
	<jsp:include page="./global_include/Global_pop.jsp" />




	<script type="text/javascript">
		QWER(document)
				.on(
						"click",
						"#MainPage_tableLeft tbody tr",
						function() {
							let MPT = QWER(this).children("td").eq(0).text();
							let MPTS = "";
							MPTS += "<form name='ht' action='<c:url value='/data/"
	MPTS += "passToEach' />' method='POST'>"
							MPTS += "<input type='hidden' name='hiddenInput' value='";
	MPTS += MPT
	MPTS += "'/></form>"
							QWER('#MainPage_Body').prepend(MPTS);
							let MPF = document.ht;
							console.log(MPF)

							MPF.submit();
							QWER(MPF).remove();
						});

		QWER(document)
				.on(
						"click",
						"#MainPage_tableRight tbody tr",
						function() {
							let MPT = QWER(this).children("td").eq(0).text();
							let MPTS = "";
							MPTS += "<form name='ht' action='<c:url value='/data/"
	MPTS += "passToEach' />' method='POST'>"
							MPTS += "<input type='hidden' name='hiddenInput' value='";
	MPTS += MPT
	MPTS += "'/></form>"
							QWER('#MainPage_Body').prepend(MPTS);
							let MPF = document.ht;
							console.log(MPF)

							MPF.submit();
							QWER(MPF).remove();
						});
	</script>
</body>
</html>