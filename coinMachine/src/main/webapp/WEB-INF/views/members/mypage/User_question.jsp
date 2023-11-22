<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value='/resources/css/mypage/Service_center.css' />"
	rel="stylesheet" type="text/css">
	
<script type="text/javascript">

	function userQuestionForm() {
		console.log('userQuestionForm() CALLED!!');
		
		let form = document.user_question_form;
		
		if (form.a_m_class.value == '') {
			alert('분류를 입력하시오.');
			form.a_m_title.focus();	
		
		} else if (form.a_m_title.value == '') {
			alert('내용을 입력하세요.');
			form.a_m_title.focus();	
		
		} else {
			form.submit();
			
		}
	}
</script>
</head>

<body>

	<jsp:include page="./include/Header.jsp" />

	<section id="section">
        <article class="article row">
            <div class="add">
                <h2>자유게시판</h2>
            </div>
            <div class="user_question_form">
                <form action="<c:url value='/member/userQuestioncomfirm' />" name="user_question_form" method="POST">
                    <input type="hidden"	name="a_m_type" 			value="qna"> <br>
                    <input type="text"		name="a_m_class" 			placeholder="분류(ex. 입출금, 거래, 회원가입 등)"> <br>
                    <input type="text"		name="a_m_title" 			placeholder="제목과 내용을 자유롭게 작성하세요."> <br>
                    <input type="button"	value="글쓰기" onclick="userQuestionForm();"> 
                    <input type="reset"		value="취소">
                </form> 
            </div>
        </article>
    </section>


	<jsp:include page="./include/Footer.jsp" />
	
</body>
</html>