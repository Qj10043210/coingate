<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value='/resources/css/mypage/Service_center.css' />"
	rel="stylesheet" type="text/css">

</head>

	
	

<body>

	<jsp:include page="./include/Header.jsp" />

	<section id="section">
		<article class="article row">
			<div class="service_service">
				<h2>
					<a href="<c:url value='/member/serviceCenterFAQ' />">자주 묻는 질문</a> / 
					<a href="<c:url value='/member/serviceCenterQNA' />">자유게시판</a> 
					<a href="<c:url value='/member/serviceCenterQnaDetail' />">임시</a>
				</h2>
				<h2>
					<a href="<c:url value='/member/questionAdd' />">추가</a>
				</h2>
			</div>
			<div class="service_wrap">
				<div class="service_contents">
					<jsp:include page="./include/viewArticle.jsp" />
				</div>
			</div>
		</article>
	</section>

	<jsp:include page="./include/Footer.jsp" />
	<script>
	
	const questions = document.querySelectorAll('.question');

	questions.forEach(question => {
	    const answer = question.querySelector('.answer');

	    // 초기에 답변 숨기기
	    answer.style.display = 'none';

	    question.addEventListener('click', () => {
	        if (answer.style.display === 'none' || answer.style.display === '') {
	            answer.style.display = 'block';
	        } else {
	            answer.style.display = 'none';
	        }
	    });
	});
	</script>

</body>
</html>