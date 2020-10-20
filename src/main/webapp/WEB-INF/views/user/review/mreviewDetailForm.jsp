<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<title>글 상세보기</title>
<style>
h2 {text-align: center;}
table {width: 100%;}
textarea {width: 100%;}
#outter {display: block;
	     width: 30%;
		 margin: auto;}
</style>
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<form action="/user/review/mreviewUpdate.do" name="frm">
		<br><br>
		<h2>게시판</h2>
		<br><br>
		<div id="outter">
			<table border="1">
				<tr>
					<td>글번호: ${review.rnum }</td>	
				</tr>	
				<tr>
					<td>등록날짜: ${review.reg_date }</td>
				</tr>
				<tr>
					<td>면접 날짜: ${review.m_date }</td>
				</tr>
				<tr>
					<td>작성 아이디: ${review.id }</td>
				</tr>
				<tr>
					<td>면접상태 : 
					<select name="m_status">
   						<option value="">상태선택</option>
   						<option value="${review.m_status }" selected="selected">${review.m_status }</option>
   	 					<option value="대기중">대기중</option>
    					<option value="합격">합격</option>
   						<option value="탈락">탈락</option>
					</select>					
					면접난이도 : 
					<select name="m_difficultly">
   						<option value="">난이도선택</option>
   						<option value="${review.m_difficultly }" selected="selected">${review.m_difficultly }</option>
   	 					<option value="어려움">어려움</option>
    					<option value="보통">보통</option>
   						<option value="쉬움">쉬움</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>
						<div style="height: 300px; margin: 10px; display: inline-block">
							<textarea class="updateReview" name="mreview" cols="73" rows="17" required>${review.mreview }</textarea>
						</div>
					</td>
				</tr>
			</table>
			<input type="hidden" name="rnum" value="${review.rnum }" />
			<input type="hidden" name="m_date" value="${review.m_date }" />			
			<div style="float: right;">
				<input class="updateBtn" type="button" value="수정"> 
				<input class="deleteBtn" type="button" value="삭제"> 
				<input type="button" value="글 목록"onclick="location.href='/user/review/reviewSelectList.do?bsmno=${review.bsmno}'">
			</div>
		</div>
	</form>
	<script>
	const updateBtn = document.querySelector(".updateBtn");
	const deleteBtn = document.querySelector(".deleteBtn");
	const updateReview = document.querySelector(".updateReview"); 
	const updateMreview = document.querySelector(".updateMreview");
	
	updateBtn.addEventListener("click", function(event) {
		updateCheck();
	});
	
	function updateCheck() {
		if(updateReview.value != ""){
			if(confirm ("수정 하시겠습니까?") === true){
					alert("수정완료");
					document.frm.submit();
			} else {
				alert("수정취소");
			}
		} else {
			alert("내용을 입력해주세요");
			updateReview.focus();
		}
	}	
	
	deleteBtn.addEventListener("click", function(event) {
		deleteCheck();
	});
		
	function deleteCheck() {
		if(confirm ("정말 삭제하시겠습니까?") === true){
			alert("삭제완료");
			location.href='/user/review/reviewDeleteForm.do?rnum=${review.rnum}&bsmno=${review.bsmno}';
		} else {
			alert("삭제취소");
		}
	}	
</script>
</div>
<br>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>