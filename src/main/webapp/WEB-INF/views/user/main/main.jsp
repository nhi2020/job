<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
<!-- 폰트 어썸 -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
	<h2><strong><!-- <i class="far fa-edit" style="color: green;"></i> --><i class="fas fa-edit" style="color: green;"></i> 기업 리뷰</strong></h2>
	<div class="jumbotron">
		<div class="row">
      	<c:forEach var="frm" items="${list2}">
			<div class="col-sm-3">
				<h4><span class="badge badge-success">${frm.company}&nbsp;</span><span class="badge badge-light">${frm.id}</span></h4>
				${frm.review}
			</div>
		</c:forEach>
			<hr class="d-sm-none">
		</div>
	</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</div>
</body>
</html>