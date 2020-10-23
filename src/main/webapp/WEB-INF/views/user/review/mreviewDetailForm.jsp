<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<title>면접 후기 상세보기</title>
<style>
h2 {text-align: center;}
table {width: 100%;}
textarea {width: 100%;}
#outter {display: block;
	     width: 30%;
		 margin: auto;}
</style>
<script>
	function updateCheck() {
		if(document.frm.mreview.value != ""){
			if(confirm ("수정 하시겠습니까?") === true){
				alert("수정완료");
				document.frm.action='/user/review/mreviewUpdate.do';
				document.frm.submit();
			} else {
				alert("수정취소");
				return false;
			}
		} else {
			alert("내용을 입력해주세요");
			document.frm.mreview.focus();
			return false;
		}
	}	
	
	function deleteCheck() {
		if(confirm ("정말 삭제하시겠습니까?") === true){
			alert("삭제완료");
			document.frm.action='/user/review/reviewDeleteForm.do';
			document.frm.submit();
		} else {
			alert("삭제취소");
		}
	}	
	
	function selectCheck() {
		alert("글목록으로 이동합니다.");
		document.frm.action='/user/review/reviewSelectList.do';
		document.frm.submit();
	}	
</script>
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<form name="frm" method="post">
		<input type="hidden" name="rnum" value="${review.rnum}" />
		<input type="hidden" name="bsmno" value="${review.bsmno}" />
		<h2>면접 후기 상세보기</h2>
		<div class="form-group p-3">
	      <label for="rnum">글번호:</label> ${review.rnum }
	    </div>
	    <div class="form-group p-3">
	      <label for="reg_date">등록날짜:</label> ${review.reg_date }
	    </div>
	    <div class="form-group p-3">
	      <label for="m_date">면접날짜:</label> ${review.m_date }
	    </div>
	    <div class="form-group p-3">
	      <label for="m_status">면접상태:</label>
	      <select class="form-control" name="m_status">
			<option value="" ${review.m_status eq ''?'selected="selected"':''}>상태선택</option>
			<option value="대기중" ${review.m_status eq '대기중'?'selected="selected"':''}>대기중</option>
			<option value="합격" ${review.m_status eq '합격'?'selected="selected"':''}>합격</option>
			<option value="탈락" ${review.m_status eq '탈락'?'selected="selected"':''}>탈락</option>
		  </select>	
	    </div>
	    <div class="form-group p-3">
	      <label for="m_difficultly">면접난이도:</label>
	      <select class="form-control" name="m_difficultly">
			<option value="" ${review.m_difficultly eq ''?'selected="selected"':''}>난이도선택</option>
			<option value="어려움" ${review.m_difficultly eq '어려움'?'selected="selected"':''}>어려움</option>
			<option value="보통" ${review.m_difficultly eq '보통'?'selected="selected"':''}>보통</option>
			<option value="쉬움" ${review.m_difficultly eq '쉬움'?'selected="selected"':''}>쉬움</option>
		  </select>
	    </div>
	    <div class="form-group p-3">
	      <label for="mreview">면접후기:</label> 
	      <textarea class="form-control" name="mreview" cols="73" rows="17" required>${review.mreview }</textarea>
	    </div>
		<div class="text-center">
			<input class="btn btn-success" type="button" value="수정" onclick="updateCheck();"> 
			<input class="btn btn-success" type="button" value="삭제" onclick="deleteCheck();"> 
			<input class="btn btn-success" type="button" value="글 목록" onclick="selectCheck();">
		</div>
	</form>
</div>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>