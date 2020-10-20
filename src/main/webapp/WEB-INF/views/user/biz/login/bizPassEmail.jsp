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