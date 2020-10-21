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
	<h3 style="font-weight: bold;"><i class="fas fa-address-card"></i> 아이디 찾기</h3>
	<br><br>
	<form name="frm" method="post" action="/user/member/login/memFindId.do">
		<div class="row">
			<div class="col">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" name="name" id="name"  class="form-control" placeholder="이름을 입력하세요">
				</div>
				<div class="form-group">
					<label for="phone">전화번호</label>
					<input type="text" name="phone" id="phone"  class="form-control" placeholder="전화번호를 입력하세요">
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<input type="text" name="email" id="email"  class="form-control" placeholder="이메일을 입력하세요">
				</div>
				<div class="form-group">
					<input type="submit" value="확인" class="btn btn-danger px-3">&emsp;&emsp;
					<a class="btn btn-primary px-3" href="/user/member/login/memLoginForm.do">취소</a>
				</div>
			</div>
		
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>