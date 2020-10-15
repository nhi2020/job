<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
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
<h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="/user/review/write.do" name="frm">
		<p>사업자번호 : <input type="text" name="bsmno" style="width: 20%;" value="${review.bsmno }" readonly="readonly"/><br></p>
		<p>아이디 : <input type="text" name="id" style="width: 20%;" value="${review.id }" readonly="readonly"/><br></p>
		<br>
		<textarea id="summernote" name="review"></textarea>
		<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
</body>
</html>