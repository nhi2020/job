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
	<%-- <c:if test="${!empty sessionScope.user.id}">
		<div class="row">
			<div class="col-sm-3">
				${sessionScope.user.name}님 환영합니다.
			</div>
		</div>
	</c:if>
	<c:if test="${!empty sessionScope.b_user.bsmno}">
		<div class="row">
			<div class="col-sm-3">
				${sessionScope.b_user.company}님 환영합니다.
			</div>
		</div>
	</c:if> --%>
	<h2><strong>오늘의 추천 기업</strong></h2>
	<div class="row">
		<div class="col-sm-3">
			<div class="fakeimg"><img src="/resources/images/upload/biz/img_chania.jpg" class="img-thumbnail" /></div>
			<p class="font-weight-bold">(주)싱아&nbsp;<span class="font-weight-normal"><span class="font-weight-normal">IT서비스</span></span></p>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg"><img src="/resources/images/upload/biz/20191012230041_uxazviga.jpg" class="img-thumbnail" width="304" height="236"/></div>
			<p class="font-weight-bold">(주)싱아&nbsp;<span class="font-weight-normal">IT서비스</span></p>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg"><img src="/resources/images/upload/biz/img_chania.jpg" class="img-thumbnail" width="304" height="236"/></div>
			<p class="font-weight-bold">(주)싱아&nbsp;<span class="font-weight-normal">IT서비스</span></p>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg"><img src="/resources/images/upload/biz/img_chania.jpg" class="img-thumbnail" width="304" height="236"/></div>
			<p class="font-weight-bold">(주)싱아&nbsp;<span class="font-weight-normal">IT서비스</span></p>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg"><img src="/resources/images/upload/biz/img_chania.jpg" class="img-thumbnail" width="304" height="236"/></div>
			<p class="font-weight-bold">(주)싱아&nbsp;<span class="font-weight-normal">IT서비스</span></p>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg"><img src="/resources/images/upload/biz/img_chania.jpg" class="img-thumbnail" width="304" height="236"/></div>
			<p class="font-weight-bold">(주)싱아&nbsp;<span class="font-weight-normal">IT서비스</span></p>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg"><img src="/resources/images/upload/biz/img_chania.jpg" class="img-thumbnail" width="304" height="236"/></div>
			<p class="font-weight-bold">(주)싱아&nbsp;<span class="font-weight-normal">IT서비스</span></p>
		</div>
		<div class="col-sm-3">
			<div class="fakeimg"><img src="/resources/images/upload/biz/img_chania.jpg" class="img-thumbnail" width="304" height="236"/></div>
			<p class="font-weight-bold">(주)싱아&nbsp;<span class="font-weight-normal">IT서비스</span></p>
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
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>