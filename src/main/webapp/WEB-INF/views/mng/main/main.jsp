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
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container" style="margin-top: 30px">
		<div class="text-center">
			<div class="px-3 py-5 bg-primary text-white" id="cardlink1"><h3 align="center">  기업정보 관리  </h3></div>
			<div class="px-3 py-5 bg-warning text-white" id="cardlink2"><h3 align="center">  회원정보 관리  </h3></div>
			<div class="px-3 py-5 bg-info text-white" id="cardlink3"><h3 align="center">  리뷰정보 관리  </h3></div>
		</div>
	</div>
<br>
<br>
<br>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>