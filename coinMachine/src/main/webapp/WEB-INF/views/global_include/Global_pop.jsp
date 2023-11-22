<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$.noConflict();
	var QWER = jQuery;
</script>

<style>
@import
	url("https://cdn.jsdelivr.net/npm/galmuri@latest/dist/galmuri.css");
#Global_popDiv {
	font-family:galmuri;
	color:black;
	position: fixed;
	bottom: 1%;
	right: 1%;
}

#Global_pop_content_name {
	height: 60px;
	width: 80px;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow:hidden;
	text-overflow: ellipsis;
}

#Global_pop_content_name_span {
	font-size : 50px;
	display: block;
}

#Global_pop_button {
	background-color: #E6E6FA;
	border: none;
	padding: 5px;
	height: 80px;
	width: 80px;
	box-shadow: 0 2px 4px darkslategray;
	cursor: pointer;
	transition: all 0.6s ease;
	border-radius: 40%;
}

#Global_pop_button:hover {
	width: 180px;
	height: 240px;
	border-radius: 20px;
}
#Global_pop_button:hover #Global_pop_content_name{
	display: block;
	text-align : center;
	height: 80px;
	width: 180px;
	
}
#Global_pop_button:hover #Global_pop_content_name_span{
font-size : 20px;
} 

#Global_pop_content {
	font-size: 20px;
	transition: all 0.3s ease;
	width: 100%;
	height: 100%;
	opacity: 0;
}

#Global_pop_button:hover #Global_pop_content{
	opacity: 1;
}
#Global_pop_content_balance_span{
overflow:hidden;
	text-overflow: ellipsis;
}
#Global_pop_content_balance_span::after{
content:" ";}
</style>

<div id="Global_popDiv">
	<div id="Global_pop_button">
		<div id="Global_pop_content_name">
			<span id="Global_pop_content_name_span"></span>
		</div>
		<div id="Global_pop_content" class="Global_pop_unview">

			<div id="Global_pop_content_balance">
				<span id="Global_pop_content_balance_span"></span>
			</div>
			<jsp:include page='./Input_Timer.jsp' />
		</div>
	</div>
</div>

<form name="hiddenGPform" action="<c:url value='/client/logOut' />"
	method="post">