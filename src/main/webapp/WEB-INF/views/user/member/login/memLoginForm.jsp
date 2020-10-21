<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
<script>
	function memLogin(){
		document.frm.action="/user/member/login/memLogin.do";
		document.frm.submit();
	}
	function findId(){
		document.frm.action="/user/member/login/memFindIdForm.do";
		document.frm.submit();
	}
	function findPass(){
		document.frm.action="/user/member/login/memFindPassForm.do";
		document.frm.submit();
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<h3 style="font-weight: bold;"><i class="fas fa-user-friends"></i> 개인회원 로그인</h3>
	<br><br>
	<form name="frm" method="post">
		<div class="row">
			<div class="col">
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" name="id" class="form-control" id="id" placeholder="아이디를 입력하세요">
				</div>
				<div class="form-group">
					<label for="pass">비밀번호</label> 
					<input type="password" name="pass" class="form-control" id="pass" placeholder="비밀번호를 입력하세요">
				</div>
				<div class="form-group">
					<a class="btn btn-link" href="javascript:findId();" style="font-weight: bold">아이디 찾기</a>
					<a class="btn btn-link" href="javascript:findPass();" style="font-weight: bold">비밀번호 찾기</a>
				</div>
				<div>    
					<!-- <input type="submit" value="로그인" class="btn btn-danger"/> -->
					<a class="btn btn-danger px-3" href="javascript:memLogin();"><i class="fas fa-location-arrow"></i> 로그인</a>
					&emsp;&emsp;
					<a class="btn btn-primary px-3" href="/user/member/join/memJoinForm.do"><i class="fas fa-file-signature"></i> 회원가입</a>
				</div>
				
			</div>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>