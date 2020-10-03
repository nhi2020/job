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
<script>
function bizLogin() {
	document.frm.action="/user/biz/login/bizLogin.do";
	document.frm.submit();
}
function findBsm(){
	document.frm.action="/user/biz/login/bizFindBsmForm.do";
	document.frm.submit();
}
function findPass(){
	document.frm.action="/user/biz/login/bizFindPassForm.do";
	document.frm.submit();
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<h3 style="font-weight: bold;"><i class="far fa-building"></i> 기업회원 로그인</h3>
	<br><br>
	<form name="frm" method="post" >
		<div class="row">
			<div class="col">
				<div class="form-group">
					<label for="bsmno">사업자 번호</label> 
					<input type="text" name="bsmno" class="form-control" id="bsmno" placeholder="'-' 를 포함한 사업자 번호를 입력하세요">
				</div>
				<div class="form-group">
					<label for="pass">비밀번호</label> 
					<input type="password" name="pass" class="form-control" id="pass" placeholder="비밀번호를 입력하세요">
				</div>
				<div class="form-group">
					<a class="btn btn-link" href="javascript:findBsm();" style="font-weight: bold">사업자 번호 찾기</a>
					<a class="btn btn-link" href="javascript:findPass();" style="font-weight: bold">비밀번호 찾기</a>
				</div>
				<div>
					<a class="btn btn-danger px-3" href="javascript:bizLogin();"><i class="fas fa-location-arrow"></i> 로그인</a>
					&emsp;&emsp;
					<a class="btn btn-primary px-3" href="/user/biz/join/bizJoinForm.do"><i class="fas fa-file-signature"></i> 회원가입</a>
				</div>
			</div>
		</div>
		
	</form>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>