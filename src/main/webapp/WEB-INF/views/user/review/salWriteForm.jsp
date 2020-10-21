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
	<form method="post" action="/user/review/sWrite.do" name="frm">
		<h2>연봉 작성</h2>
		<div class="form-group">
	      <label for="bsmno">사업자번호:</label> 
	      <input type="text" class="form-control" name="bsmno" value="${review.bsmno }" readonly="readonly"/>
	    </div>
	    <div class="form-group">
	      <label for="id">아이디:</label> 
	      <input type="text" class="form-control" name="id" value="${review.id }" readonly="readonly"/>
	    </div>
	    <div class="form-group">
	      <label for="spot">직위:</label> 
	      <select class="form-control" name="spot">
				<option value="신입">신입</option>
				<option value="대리">대리</option>
				<option value="과장">과장</option>
				<option value="차장">차장</option>
				<option value="부장">부장</option>
				<option value="상무">상무</option>
				<option value="이사">이사</option>
			</select> 
	    </div>
		<div class="form-group">
	      <label for="sal">연봉:</label> 
	      <input type="text" class="form-control" name="sal" value="${review.sal }"/>
	    </div>
		<input id="subBtn" class="btn btn-success" type="button" value="연봉 추가" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
<br>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>