<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트 어썸 -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top: 30px">
	<h3 style="font-weight: bold;"><i class="fas fa-address-card"></i> 입력한 이메일로 받은 인증번호를 입력하세요. </h3>
	<br><br>
	<form method="post" action="/user/biz/login/bizPassEmailInjeung.do">
		<input type="hidden" name="tempPass" value="${tempPass}"/>
		<input type="hidden" name="email" value="${email}"/>
		<div class="row">
			<div class="col">
				<div class="form-group">
					<label for="injeung">인증번호 입력</label>
					<input type="text" name="injeung" id="injeung"  class="form-control" placeholder="인증번호를 입력하세요">
				</div>
				<div class="form-group">
					<input type="submit" value="확인" class="btn btn-danger px-3">
				</div>
			</div>
		
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>