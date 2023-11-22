<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$.noConflict();
var QWER = jQuery;
</script>  
<style>
#Input_Timer{
display : block;
}
#Input_Timer.Input_Timer_unview{
display : none;
}
#Input_Timer_clock_unview{
display:block;
width:0.1px;
height:0.1px;
opacity:0;
}
</style>
<div id="Input_Timer" class="Input_Timer_unview">
	<span id="Input_Timer_msg"></span>
	<span id="Input_Timer_clock"></span>
	<span id="Input_Timer_clock_unview"></span>
</div>

<jsp:include page="./MEGAMIND.jsp" />