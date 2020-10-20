<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>업데이트</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트 어썸 -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container pt-3">
	
		<form action="/user/mypage/member/myUpdate.do" method="post" id="upForm" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${sessionScope.user.id}">
			<input type="hidden" name="pass" value="${sessionScope.user.pass}">
			<h2>회원정보 상세</h2>
			<ul class="list-group text-center">
				<li class="list-group-item"> 
					<c:if test="${sessionScope.user.storedfilename ne '' and not empty sessionScope.user.storedfilename}">
						<img src="/resources/images/upload/member/${sessionScope.user.storedfilename}" class="img-fluid" width="30%" height="30%"/>
					</c:if>
				</li>
			</ul>
			<div class="form-group">
			    <label for="id">아이디:</label> ${sessionScope.user.id}
			</div>
			<div class="form-group">
			    <label for="id">이름:</label> ${sessionScope.user.name}
			</div>
			<div class="form-group">
			    <label for="id">성별:</label> 
				<c:if test="${sessionScope.user.gender ==1 }">
					남자
				</c:if>
				<c:if test="${sessionScope.user.gender ==2 }">
					여자
				</c:if>
			</div>
			<div class="form-group">
			  <label for="email">이메일:</label>
			  <input type="text" name="email" class="form-control" id="email" required="required" value="${sessionScope.user.email }">
			</div>
			<div class="form-group">
			  <label for="phone">폰번호:</label>
			  <input type="text" name="phone" class="form-control" id="phone" required="required" value="${sessionScope.user.phone }">
			</div>
			<div class="form-group">
			    <label for="birthday">생일:</label> ${sessionScope.user.birthday }
			</div>
			<div class="form-group">
			  <label for="pwd">경력:</label>
			  <input type="text" name="career" class="form-control" id="career" required="required" value="${sessionScope.user.career }">
			</div>
			<div class="form-group">
			  <label for="pwd">이미지 업로드:</label>
				<c:choose>
					<c:when test="${sessionScope.user.originalfilename eq '' or sessionScope.user.originalfilename == null}">
						<div class="form-group">
							<label for="image"><i class="fas fa-star-of-life" style="color: red;"></i>사진 업로드</label>
							<input type="file" class="form-control" id="file" name="file" placeholder="이름을 입력하세요">
						</div> 
					</c:when>
					<c:otherwise>
						<div class="form-group">
							${sessionScope.user.originalfilename}
							<a href="/user/mypage/member/myImageDel.do?storedfilename=${sessionScope.user.storedfilename}&filesize=${sessionScope.user.filesize}&attachid=${sessionScope.user.attachid}">삭제</a>
						</div> 
					</c:otherwise>
				</c:choose>
			</div>
			<input type="submit" class="btn btn-success float-right" value="확인" />
		</form>
	
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>

