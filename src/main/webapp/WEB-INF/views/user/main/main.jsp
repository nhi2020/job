<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<h2><strong><i class="far fa-thumbs-up" style="color: green;"></i> 오늘의 추천 기업</strong></h2>
	<div class="jumbotron">
		<div class="row">
		<c:forEach var="name" items="${list}">
			<div class="col-sm-3">
				<h4><span class="badge badge-success">${name.company}&nbsp;</span><span class="badge badge-light">${name.field}</span></h4>
				<div class="fakeimg"><img src="/resources/images/upload/biz/${name.storedfilename }" class="rounded" width="250" height="200"/></div>
			</div>
		</c:forEach>
			<hr class="d-sm-none">
		</div>
	</div>
	<h2><strong><i class="fas fa-edit" style="color: green;"></i> 기업 리뷰</strong></h2>
	<div class="jumbotron">
		<div class="row">
      	<c:forEach var="frm" items="${list2}">
			<div class="col-sm-3">
				<h4><span class="badge badge-success">${frm.company}&nbsp;</span><span class="badge badge-light">${frm.reg_date}</span></h4>
				${frm.review}
			</div>
		</c:forEach>
			<hr class="d-sm-none">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>