<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value='/resources/css/mypage/Ranking.css' />"
	rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>

	<jsp:include page="./include/Header.jsp" />

<section id="section">
        <article class="article row">
            <div class="ranking">
                <h2>거래량 순위</h2>
            </div>
            <table class="total_rank">
                <colgroup>
                    <col width="100px">
                    <col width="200px">
                    <col width="800px">
                    <col width="260px">
                </colgroup>
                <thead>
                    <tr class="head">
                        <th class="tx_c">순위</th>
                        <th class="tx_c">아이디</th>
                        <th class="tx_c">원화환산가</th>
                        <th class="tx_c">기타</th>
                    </tr>
                </thead>
                <tbody class = "ranking_body">
                    
                </tbody>
            </table>
        </article>
    </section>

	<jsp:include page="./include/Footer.jsp" />

<script>
$.noConflict();
var QWER = jQuery;

QWER(document).ready(function(){
	QWER.ajax({
		url: "${pageContext.request.contextPath}/member/ranking/rankinglist",
		method : "get",
		contentType : 'application/json; charset=utf-8',
		success: function(rdata){
			console.log(rdata)
			var table = QWER(".ranking_body");
			rdata.forEach(function(item, index){
					table.append("<tr><td>" + (parseInt(index) + 1) + "</td><td class='tx_c'>" + item.userId + "</td><td class='tx_c'>" + item.userBalance + "</td>"+"<td></td>")
						})
		}
	})
})
</script>
</body>
</html>