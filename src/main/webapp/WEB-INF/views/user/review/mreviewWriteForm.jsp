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
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>면접후기쓰기</title>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
<script>
function goWrite(frm) {
	var m_status = frm.m_status.value;
	var m_difficultly = frm.m_difficultly.value;	
	var mreview = frm.mreview.value;
	
	if (m_status == ''){
		alert("면접 상태를 선택해주세요");
		return false;
	}
	if (m_difficultly == ''){
		alert("면접 난이도를 선택해주세요");
		return false;
	}
	if (mreview.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	if(confirm ("글 등록 하시겠습니까?") === true){
		alert("글 등록완료");
		document.frm.submit();
	} else {
		alert("등록취소");
		return false;
		}
	
	frm.submit();
}
</script>	
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
<h2 style="text-align: center;">면접 후기글 작성</h2><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="/user/review/mWrite.do" name="frm">
		<div class="form-group">
		  <label for="bsmno">사업자번호:</label>
		  <input type="text" class="form-control" name="bsmno" id="bsmno" value="${review.bsmno}" readonly="readonly">
		</div>
		<div class="form-group">
		  <label for="id">아이디:</label>
		  <input type="text" class="form-control" name="id" id="id" value="${sessionScope.user.id}" readonly="readonly">
		</div>
		<div class="form-group">
		  <label for="m_status">면접상태:</label>
		  <select class="form-control" name="m_status">
			<option value="">상태선택</option>
			<option value="대기중" >대기중</option>
			<option value="합격" >합격</option>
			<option value="탈락" >탈락</option>
		  </select>	
		</div>
		<div class="form-group">
		  <label for="m_status">면접난이도:</label>
		  <select class="form-control" name="m_difficultly">
			<option value="">난이도선택</option>
			<option value="어려움" >어려움</option>
			<option value="보통" >보통</option>
			<option value="쉬움" >쉬움</option>
		  </select>
		</div>
		<div class="form-group">
		  <label for="mreview">글 작성:</label>
		  <textarea class="form-control" rows="5" id="mreview" name="mreview"></textarea>
		</div>
		<input id="subBtn" class="btn btn-success" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
</div>
<br>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>