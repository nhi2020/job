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
	function memLogin(){
		document.frm.action="/user/member/login/memLoginForm.do";
		document.frm.submit();
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top: 30px">
	<h3 style="font-weight: bold;"><i class="fas fa-address-card"></i> 아이디 찾기 검색결과</h3>
	<br><br>
	<form name="frm" method="post">
		<div class="row">
			<div class="col">
				<div class="form-group">
					<h4> 찾으신 아이디는 ${id } 입니다. <br><br> 다시 로그인 해주세요.</h4>
				</div>
				<br>
				<div class="form-group">
				    <a class="btn btn-danger px-3" href="javascript:memLogin();" ><i class="fas fa-location-arrow"></i> 로그인 하러가기</a>
				
				</div>
			</div>
		</div>
	</form>
</div>


<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>