<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
<script>
	function bizLogin(){
		document.frm.action="/user/biz/login/bizLoginForm.do";
		document.frm.submit();
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top: 30px">
	<h3 style="font-weight: bold;"><i class="fas fa-address-card"></i> 사업자 번호 찾기 검색결과</h3>
	<br><br>
	<form name="frm" method="post">
		<div class="row">
			<div class="col">
				<div class="form-group">
					<h4> 찾으신 아이디는 ${bsmno } 입니다. <br><br> 다시 로그인 해주세요.</h4>
				</div>
				<br>
				<div class="form-group">
				    <a class="btn btn-danger px-3" href="javascript:bizLogin();" ><i class="fas fa-location-arrow"></i> 로그인 하러가기</a>
				
				</div>
			</div>
		</div>
	</form>
</div>


<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>