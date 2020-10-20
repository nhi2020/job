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
	<form name="frm" method="post" action="/user/biz/login/bizLoginForm.do">
		<div class="row">
			<div class="col">
				<div class="form-group">
					비밀번호 변경이 완료되었습니다. <br>
					변경된 비밀번호로 로그인 해주시기 바랍니다.
				</div>
				<div class="form-group">
					<input type="submit" value="로그인" class="btn btn-danger px-3">
				</div>
			</div>
		
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>