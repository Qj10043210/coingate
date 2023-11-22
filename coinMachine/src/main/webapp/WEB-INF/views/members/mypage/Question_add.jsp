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

	function questionAddForm() {
		console.log('questionAddForm() CALLED!!');
		
		let form = document.question_add_form;
		
		if (form.a_m_title.value == '') {
			alert('제목을 입력하시오.');
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
                <h2>FAQ 추가 폼</h2>
            </div>
            <div class="question_add_form">
                <form action="<c:url value='/member/addFAQ' />" name="question_add_form" method="POST">
                    <input type="hidden"	name="a_m_type" 			value="faq"> <br>
                    <input type="text"		name="a_m_class" 			placeholder="분류"> <br>
                    <input type="text"		name="a_m_title" 			placeholder="제목"> <br>
                    <input type="text"		name="a_m_content"			placeholder="답변"> <br>
                    <input type="button"	value="추가" onclick="questionAddForm();"> 
                    <input type="reset"		value="취소">
                </form> 
            </div>
        </article>
    </section>


	<jsp:include page="./include/Footer.jsp" />
	
</body>
</html>