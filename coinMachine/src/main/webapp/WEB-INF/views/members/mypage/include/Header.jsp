<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value='/resources/css/mypage/include/Header.css' />"
	rel="stylesheet" type="text/css">

<header id="header">
    <div class="header row">
        <h1 class="indexLogo">
    	    <a href="<c:url value='/member/index' />">
        	    <img src="<c:url value='/resources/img/UPthumb.png' />"  alt="UPthumb">
            </a>
        </h1>
        <dl class="header_menu">
            <dt>
            <a href="#">
                <b></b>
            </a>
            </dt>
            <dt>
    	        <a href="<c:url value='/member/asset' />">
                <b>자산내역</b>
        	    </a>
            </dt>
            <dt>
	            <a href="<c:url value='/member/tradeHistory' />">
                <b>거래내역</b>
                </a>
            </dt>
            <dt>
  	            <a href="<c:url value='/member/ranking' />">
                <b>순위</b>
                </a>
                </dt>
            <dt>
  	            <a href="<c:url value='/member/serviceCenterFAQ' />">
                <b>고객센터</b>
	            </a>
            </dt>
        </dl>
        </div>
</header>