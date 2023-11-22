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
				<h2>고객센터</h2>
				<h2>
					<a href="<c:url value='/member/questionAdd' />">추가</a>
				</h2>
			</div>
			<div class="service_wrap">
				<div class="service_contents">
					<h2>0.Upthump</h2>
					<div class="question">
						<h3>질문 1. Upthump은 거래소 인가요?</h3>
						<div class="answer">
							<p>Upthump은 게임장이며, 코인거래소와 다릅니다.</p>
						</div>
					</div>
					<div class="question">
						<h3>질문 2. Upthump은 무엇을 하는 곳인가요?</h3>
						<div class="answer">
							<p>Upthump에서는 코인 거래는 가능하지만 입출금은 할 수 없습니다. 게임중 발생한 손익은 순위표와 합께
								경품을 차등 지급할 예정입니다.</p>
						</div>
					</div>
				</div>
				<div class="service_contents">
					<h2>1.회원가입</h2>
					<div class="question">
						<h3>질문 1. 회원가입 하는 방법 설명해주세요.</h3>
						<div class="answer">
							<p>회원가입은 로그인 버튼옆에 회원가입 버튼을 클릭하여 아이디, 비밀번호 등 정보를 입력하여 회원가입하시면
								됩니다.</p>
						</div>
					</div>
					<div class="question">
						<h3>질문 2</h3>
						<div class="answer">
							<p>답변 2의 내용입니다.</p>
						</div>
					</div>
				</div>
				<div class="service_contents">
					<h2>2.입출금</h2>
					<div class="question">
						<h3>질문 1. 입출금은 어떻게 하나요?</h3>
						<div class="answer">
							<p>Upthump에서는 코인 입출금이 되지 않습니다.</p>
						</div>
					</div>
				</div>
				<div class="service_contents">
					<h2>3.거래</h2>
					<div class="question">
						<h3>질문 1</h3>
						<div class="answer">
							<p>답변 1의 내용입니다.</p>
						</div>
					</div>
					<div class="question">
						<h3>질문 2</h3>
						<div class="answer">
							<p>답변 2의 내용입니다.</p>
						</div>
					</div>
				</div>
				<div class="service_contents">
					<h2>4.순위표</h2>
					<div class="question">
						<h3>질문 1. 1등인데 상품은 무엇인가요?</h3>
						<div class="answer">
							<p>우승 상품은 매번 다를 예정이며, 공지를 통하여 안내드릴예정입니다.</p>
						</div>
					</div>
				</div>
				<div class="service_contents">
					<h2>1대1 문의</h2>
					<div class="question">
						<h3>질문 1.</h3>
						<div class="answer">
							<p>답변 1의 내용입니다.</p>
						</div>
					</div>
					<div class="question">
						<h3>질문 2</h3>
						<div class="answer">
							<p>답변 2의 내용입니다.</p>
						</div>
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