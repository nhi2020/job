<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<h2><strong>오늘의 추천 기업</strong></h2>
	<div class="row">
		<div class="col-sm-3">
			<div class="fakeimg">Fake Image ${sessionScope.user.id}</div>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg">Fake Image</div>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg">Fake Image</div>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg">Fake Image</div>
		</div>
		<hr class="d-sm-none">
	</div>
	<h2><strong>기업 리뷰</strong></h2>
	<div class="row">
		<div class="col-sm-5">
      		<h5>TITLE HEADING</h5>
      	</div>
      	<div class="col-sm-5">
      		<h5>TITLE HEADING</h5>
      	</div>
	</div>
</div>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>