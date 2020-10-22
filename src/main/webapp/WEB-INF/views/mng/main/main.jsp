<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#cardlink1').click(function() {
		location.href='/mng/biz/bizSelectList.do';
	});
	$('#cardlink2').click(function() {
		location.href='/mng/member/memSelectList.do';
	});
	$('#cardlink3').click(function() {
		location.href='/mng/review/reviewSelectList.do';
	});
	
});


</script>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.user.id eq 'admin'}">
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container" style="margin-top: 30px">
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h2 class="display-4">관리자 페이지</h2>
				<p class="lead">관리자님 환영합니다.</p>
			</div>
		</div>
		<div class="text-center row">
			<div class="col-xl-4 btn-primary text-white btn align-items-center" id="cardlink1"><h3>  기업정보 관리  </h3></div>
			<div class="col-xl-4 btn-warning text-white btn" id="cardlink2"><h3 align="center">  회원정보 관리  </h3></div>
			<div class="col-xl-4 btn-info text-white btn" id="cardlink3"><h3 align="center">  리뷰정보 관리  </h3></div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</c:when>
<c:otherwise>
<%
   response.sendRedirect("/user/main/main.do");
%>
</c:otherwise>
	</c:choose>
</body>
</html>