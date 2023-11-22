<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"
	integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
.row {
	font-family: Galmuri9;
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 10px;
}

a {
	text-decoration: none;
	color: inherit;
}

#section {
	min-height: 700px;
}

.service_service {
	display: flex;
	justify-content: space-between;
}

.service_contents {
	flex: 1 1 30%;
	border: 2px solid orange;
	border-radius: 10px;
	padding-left: 10px;
	margin: 0px auto;
	width: 1260px;
	height:700px;
	background-color: #f9f9f9;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	
}

.service_contents h3:hover {
	cursor: pointer;
}

.service_contents .answer p {
	margin: 10px;
} /*# sourceMappingURL=service_center.css.map */
form {
	width: 98%;
	margin: 0 auto;
}

input[type="text"] {
	font-family: Galmuri9;
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="button"], input[type="reset"] {
	font-family: Galmuri9;
	width: 49%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-left: 10px;
}

.table_style {
	border: 1;
	width: 1200px;
	margin: 30px;
	border-collapse: collapse
}

.table_style tr:nth-child(1) {
	background: #FF8200;
	border-bottom: none;
}

.table_style tr {
	border-bottom: 1px solid #555;
}

.table_style tr td {
	padding: 5px;
}



.pagination{
	width: 500px;
	display: flex;
	justify-content: space-between;
	list-style: none;

}
</style>
</head>
<body>
	<jsp:include page="./include/Header.jsp" />

	<section id="section">
		<article class="article row">
			<div class="service_service">
				<h2>
					<a href="<c:url value='/member/serviceCenterFAQ' />">자주 묻는 질문</a> / 
					<c:url value='/member/serviceCenterQNA' var='detail_url'>
						<c:param name='pageNum'	value='1'/>	
						<c:param name='amount' value='15'/>	
					</c:url>			
					<a href="${detail_url}">자유게시판</a> 
				</h2>
				<h2>
					<a href="<c:url value='/member/userQuestionForm' />">글쓰기</a>
				</h2>
			</div>
			<div class="service_wrap">
				<div class="service_contents">
					<div class="table_wrap">
						<table class="table_style">
							<colgroup>
								<col width="850px">
								<col width="100px">
								<col width="250px">
							</colgroup>
							<tr>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
							</tr>
							<c:forEach var="article" items="${memberVOS}">
								<tr>
									<td>${article.a_m_class}</td>
									<td>${article.a_m_name}</td>
									<td>${article.a_m_time}</td>
								</tr>
							</c:forEach>
						</table>
					</div>

						<ul class="pagination pagination-sm">
	
							<!-- 2. 이전버튼 활성화 여부 -->
							<c:if test="${pageVO.prev}">
								<li><a
									href="${pageContext.request.contextPath}/member/serviceCenterQNA?pageNum=${pageVO.startPage - 1}&amount=${pageVO.amount}">이전</a>
								</li>
							</c:if>
	
							<!-- 1. 페이지번호 처리 -->
							<c:forEach var="num" begin="${pageVO.startPage }"
								end="${pageVO.endPage}">
								<li class="${pageVO.pageNum eq num ? 'active' : '' }"><a
									href="${pageContext.request.contextPath}/member/serviceCenterQNA?pageNum=${num}&amount=${pageVO.amount}">${num}</a>
								</li>
							</c:forEach>
	
							<!-- 3. 다음버튼 활성화 여부 -->
							<c:if test="${pageVO.next}">
								<li><a
									href="${pageContext.request.contextPath}/member/serviceCenterQNA?pageNum=${pageVO.endPage + 1}&amount=${pageVO.amount}">다음</a>
								</li>
							</c:if>
						</ul>
					</div>
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