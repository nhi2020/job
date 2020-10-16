<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<title>연봉추가</title>
<script>
function goWrite(frm) {
	var spot = frm.spot.value;
	var sal = frm.sal.value;
	
	if (spot.trim() == ''){
		alert("직위정보를 입력해주세요");
		return false;
	}
	if (sal.trim() == ''){
		alert("연봉정보를 입력해주세요");
		return false;
	}
	if(confirm ("연봉을 등록 하시겠습니까?") === true){
		alert("등록완료");
		document.frm.submit();
	} else {
		alert("등록취소");
		return false;
		}	
}
</script>	
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
<h2 style="text-align: center;">연봉 작성</h2><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="/user/review/sWrite.do" name="frm">
		<p>사업자번호 : <input type="text" name="bsmno" style="width: 20%;" value="${review.bsmno }" readonly="readonly"/><br></p>
		<p>아이디 : <input type="text" name="id" style="width: 20%;" value="${review.id }" readonly="readonly"/><br></p>
		<p>직위 : <input type="text" name="spot" style="width: 20%;" value="${review.spot }" /><br></p>
		<p>연봉 : <input type="text" name="sal" style="width: 20%;" value="${review.sal }" /><br></p>
		<br>
		<input id="subBtn" type="button" value="연봉 추가" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
</div>
<br>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>