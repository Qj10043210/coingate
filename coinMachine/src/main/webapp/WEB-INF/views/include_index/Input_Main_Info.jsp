<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$.noConflict();
	var QWER = jQuery;
</script>
<style>
.MainPage_InfoDiv_unview {
	display: block;
	width: 0px;
	height: 0px;
	opacity: 0;
	position: fixed;
	bottom: -100%;
	right: -100%;
}

#MainPage_InfoDiv {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

input[type=button] {
	cursor: pointer;
	position: relative;
	z-index: 3;
}
</style>




<c:choose>

	<c:when test="${empty sessionScope.joinedId}">

		<c:choose>
			<c:when test="${sessionScope.createdId == 'wrong' }">
				<div id="MainPage_InfoDiv">
					<div id="MainPage_InfoDiv_LoginDiv" class="MainPage_InfoDiv_unview">
						<jsp:include page="../members/index/Index_Login.jsp" />
					</div>
					<div id="MainPage_InfoDiv_CreateDiv">
						<jsp:include page="../members/index/Index_Create.jsp" />
					</div>
					<div id="MainPage_InfoDiv_afterDoneDiv"
						class="MainPage_InfoDiv_unview">
						<jsp:include page="../members/index/Index_afterDone.jsp" />
					</div>
					<div id="MainPage_InfoDiv_ModifyDiv"
						class="MainPage_InfoDiv_unview">
						<jsp:include page="../members/index/Index_modify.jsp" />
					</div>
					<div id="MainPage_InfoDiv_FindpwDiv"
						class="MainPage_InfoDiv_unview">
						<jsp:include page="../members/index/Index_findpw.jsp" />
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="MainPage_InfoDiv">
					<div id="MainPage_InfoDiv_LoginDiv">
						<jsp:include page="../members/index/Index_Login.jsp" />
					</div>
					<div id="MainPage_InfoDiv_CreateDiv"
						class="MainPage_InfoDiv_unview">
						<jsp:include page="../members/index/Index_Create.jsp" />
					</div>
					<div id="MainPage_InfoDiv_afterDoneDiv"
						class="MainPage_InfoDiv_unview">
						<jsp:include page="../members/index/Index_afterDone.jsp" />
					</div>
					<div id="MainPage_InfoDiv_ModifyDiv"
						class="MainPage_InfoDiv_unview">
						<jsp:include page="../members/index/Index_modify.jsp" />
					</div>
					<div id="MainPage_InfoDiv_FindpwDiv"
						class="MainPage_InfoDiv_unview">
						<jsp:include page="../members/index/Index_findpw.jsp" />
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</c:when>
	<c:when test="${not empty sessionScope.joinedId}">
		<div id="MainPage_InfoDiv">
			<div id="MainPage_InfoDiv_LoginDiv" class="MainPage_InfoDiv_unview">
				<jsp:include page="../members/index/Index_Login.jsp" />
			</div>
			<div id="MainPage_InfoDiv_CreateDiv" class="MainPage_InfoDiv_unview">
				<jsp:include page="../members/index/Index_Create.jsp" />
			</div>
			<div id="MainPage_InfoDiv_afterDoneDiv">
				<jsp:include page="../members/index/Index_afterDone.jsp" />
			</div>
			<div id="MainPage_InfoDiv_ModifyDiv" class="MainPage_InfoDiv_unview">
				<jsp:include page="../members/index/Index_modify.jsp" />
			</div>
			<div id="MainPage_InfoDiv_FindpwDiv" class="MainPage_InfoDiv_unview">
				<jsp:include page="../members/index/Index_findpw.jsp" />
			</div>
		</div>
	</c:when>

</c:choose>

<script>
	
</script>