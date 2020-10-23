<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>기업리뷰쓰기</title>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	  $("#summernote").summernote('code',  '${review.review}');
	});

function goWrite(frm) {
	var review = frm.review.value;
	
	if (review.trim() == ''){
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
}
</script>	
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<h2 style="text-align: center;">기업 리뷰글 작성</h2><br>
	
	<div style="width: 60%; margin: auto;">
		<form method="post" action="/user/review/write.do" name="frm">
			<div class="form-group">
			  <label for="bsmno">사업자번호:</label>
			  <input type="text" class="form-control" name="bsmno" id="bsmno" value="${review.bsmno}" readonly="readonly">
			</div>
			<div class="form-group">
			  <label for="id">아이디:</label>
			  <input type="text" class="form-control" name="id" id="id" value="${sessionScope.user.id}" readonly="readonly">
			</div>
			<div class="form-group">
			  <label for="review">글 작성:</label>
			  <textarea class="form-control" rows="5" id="review" name="review"></textarea>
			</div>
			<input class="btn btn-success" type="button" value="글 작성" onclick="goWrite(this.form)"/>
		</form>
	</div>
</div>
<%@ include file="../../inc/footer.jsp" %>
</body>
</html>