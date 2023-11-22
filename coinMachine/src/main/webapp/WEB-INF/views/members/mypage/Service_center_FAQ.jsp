<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ajar.coingate.member.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
@import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap");
@import url("https://cdn.jsdelivr.net/npm/galmuri@latest/dist/galmuri.css");

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

.chevron {
	display: flex;
	justify-content: space-between;
	width: 1360px;
}

.chevron i {
	font-size: 80px;
	line-height: 800%;
}

.total_wrap {
	overflow: hidden;
	width: 1260px;
	hight: 700px;
}

.flex_wrap {
	display: flex;
	flex-shrink: 0;
}

.service_wrap {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	margin-bottom: 30px;
	width: 1260px;
	hight: 700px;
}

.service_contents {
	flex: 0 1 30.6%;
	border: 2px solid orange;
	border-radius: 10px;
	padding-left: 10px;
	margin: 10px;
	width: 300px;
	height: 300px;
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
</style>
<body>
<c:set var="dataFAQvar" value="${dataFAQ}" />

<%
    Map<String, List<MemberVO>> dataMap = (Map<String, List<MemberVO>>) pageContext.getAttribute("dataFAQvar");
    int clsLength = dataMap.size();
    pageContext.setAttribute("clsLength", clsLength);
    int pageLength = (clsLength/6)+1;
    pageContext.setAttribute("pageLength", pageLength);
%>

	<jsp:include page="./include/Header.jsp" />

	<section id="section">
		<article class="article row">
			<div class="service_service">
				<h2>
					<a href="<c:url value='/member/serviceCenterFAQ' />">자주 묻는 질문</a>  /
					<a href="<c:url value='/member/serviceCenterQNA' />">질의응답게시판</a> 
					<a href="<c:url value='/member/serviceCenterQnaDetail' />">임시</a>
				</h2>
				<h2>
					<a href="<c:url value='/member/questionAdd' />">추가</a>
				</h2>
			</div>
			<div class="chevron">
				<i class="fa-solid fa-chevron-left"></i>
				<div class="total_wrap green">
					<div class="flex_wrap red" style="width: ${pageLength}00%;">
					<%
					int count = 0;
					for(int i=0; i<pageLength; i++){ 
					    String nthKey ="";
					    List<MemberVO> nthValue = new ArrayList<>();
					%>
						<div class="service_wrap yellow">
						<%for(int j=0; j<6; j++){
							int searchMap = 0;
							for (Map.Entry<String, List<MemberVO>> entry : dataMap.entrySet()) {
							    if (searchMap == count) {
							        nthKey = entry.getKey();
							        pageContext.setAttribute("nthKey", nthKey);
							        nthValue = entry.getValue();
							        pageContext.setAttribute("nthValue", nthValue);
							        // N번째 키-값 쌍을 찾았습니다.
							        break;
							    }
							    searchMap++;
							}
						%>
							<div class="service_contents black">
								<h2>${nthKey}</h2>
							<%
							int qCount = 1;
							for(MemberVO item : nthValue){ 
								pageContext.setAttribute("qCount", qCount);
								String title = item.getA_m_title();
								pageContext.setAttribute("title", title);
								String content = item.getA_m_content();
								pageContext.setAttribute("content", content);
								qCount++;
							%>
								<div class="question">
									<h3>질문 ${qCount}. ${title}</h3>
									<div class="answer">
										<p>${content}</p>
									</div>
								</div>
							<%}
							count++;%>
							</div>
						<%if(count==clsLength){
							break;
						    }
						}
						%>
						</div>
					<%} 
					count=0;%>
					</div>
				</div>
				<i class="fa-solid fa-chevron-right"></i>
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

	<script>
	var QWER = jQuery;
	QWER(document).ready(function() {
    let count = 0;
        const carousel = QWER('.flex_wrap');
        QWER('.fa-chevron-right').on('click', function() {
            if (count < ${pageLength-1}) {
                const offset = -1260 * (count + 1);
                //carousel.css('transform', 'translateX(' + offset + '%)');
                carousel.css({'transform': 'translateX(' + offset + 'px)', 'transition': 'transform 1s ease'});
                count++;
            }
        });

        QWER('.fa-chevron-left').on('click', function() {
            if (count > 0) {
                const offset = -1260 * (count - 1);
                //carousel.css('transform', 'translateX(' + offset + '%)');
                carousel.css({'transform': 'translateX(' + offset + 'px)', 'transition': 'transform 1s ease'});
                count--;
            }
        });
    });
</script>

</body>
</html>