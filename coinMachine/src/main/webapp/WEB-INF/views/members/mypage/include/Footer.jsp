<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value='/resources/css/mypage/include/Footer.css' />"
	rel="stylesheet" type="text/css">

<footer id="footer">
    <div class="footer row">
        <h1 class="indexLogo">
       	    <a href="<c:url value='/member/index' />">
       	    
       	    <img src="<c:url value='/resources/img/UPthumb.png' />"  alt="UPthumb">
            </a>
        </h1>  
        <div class="footer_main">
            Copyright ©Green five bulldozers Corp. All Rights Reserved.
        </div>
    </div>
</footer>
<jsp:include page="../../../global_include/Global_pop.jsp" />