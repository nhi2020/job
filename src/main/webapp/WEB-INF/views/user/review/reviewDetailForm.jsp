<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<title>기업리뷰상세보기</title>
<style>
h2 {text-align: center;}
</style>
<script>
	function updateCheck() {
		if(document.frm.review.value!=''){
			if(confirm ("수정 하시겠습니까?") === true){
				alert("수정완료");
				document.frm.submit();
			} else {
				alert("수정취소");
			}
		} else {
			alert("내용을 입력해주세요");
			document.frm.review.focus();
		}
	}	
		
	function deleteCheck() {
		if(confirm ("정말 삭제하시겠습니까?") === true){
			alert("삭제완료");
			location.href='/user/review/reviewDeleteForm.do?rnum=${review.rnum}&bsmno=${review.bsmno}';
		} else {
			alert("삭제취소");
		}
	}	
</script>
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container pt-3">
	<form action="/user/review/reviewUpdate.do" name="frm">
		<input type="hidden" name="rnum" value="${review.rnum }" />
		<input type="hidden" name="bsmno" value="${review.bsmno }">
		<h2>기업 리뷰 상세보기</h2>
	    <div class="p-3 border font-weight-bold h5">
	    	<div class="form-group p-3">
		      <label for="reg_date">기업명:</label> ${review.company }
		    </div>
		    <div class="form-group p-3">
		      <label for="reg_date">등록날짜:</label> ${review.reg_date }
		    </div>
		</div>
	    <div class="form-group p-3">
		  <label for="review">내용:</label>
		  <textarea class="form-control" name="review" rows="5" id="review">${review.review }</textarea>
		</div>
		<div class="text-center">
			<input type="button" class="btn btn-success" value="수정" onclick="updateCheck();"> 
			<input type="button" class="btn btn-success" value="삭제" onclick="deleteCheck();"> 
			<input type="button" class="btn btn-success" value="글 목록" onclick="location.href='/user/review/reviewSelectList.do?bsmno=${review.bsmno}'">
		</div>
	</form>
</div>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>