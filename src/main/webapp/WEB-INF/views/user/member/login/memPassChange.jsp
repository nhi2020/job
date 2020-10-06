<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
%>
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
<script type="text/javascript">
/* 비밀번호 유효성 검사 */
function pwCheck(pass){
	$.ajax({
		type:'POST',
		url:'<%=context%>/memPwCheck.do',
		data:{pass:pass},
		success:function(result){
			if(result==true){
				m_pwcheck2.innerHTML="비밀번호 사용가능합니다.";
			}else{
				m_pwcheck2.innerHTML="비밀번호 형식이 일치하지 않습니다.";
			}
		},
		error:function(request,status){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>

</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top: 30px">
	<h3 style="font-weight: bold;"><i class="fas fa-address-card"></i> 변경할 비밀번호를 입력하세요. </h3>
	<br><br>
	<form  method="post" action="/user/member/login/memPassChange.do">
		<input type="hidden" name="email" value="${email}"/>
		<div class="row">
			<div class="col">
				<div class="form-group">
					<label for="pass">변경할 비밀번호 입력</label>
					<input type="password" name="pass" id="pass"  class="form-control" oninput="pwCheck(pass.value)" maxlength="18" placeholder="비밀번호를 입력하세요">
					<p id="m_pwcheck2" style="color: #FF6600; margin: 0; font-weight: bold"></p>
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