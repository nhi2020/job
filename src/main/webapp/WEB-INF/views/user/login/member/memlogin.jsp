<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../../inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<h2>로그인</h2>
	<form name="frm">
		<div class="row">
			<div class="col">
				<div class="form-group">
					<label for="id">아이디:</label> 
					<input type="text" name="id" class="form-control" id="id">
				</div>
				<div class="form-group">
					<label for="pass">비밀번호:</label> 
					<input type="password" name="pass" class="form-control" id="pass">
				</div>
			</div>
		</div>
	</form>
</div>
<%@ include file="../../../inc/footer.jsp" %>	
</body>
</html>