<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<form action="/user/review/salUpdate.do" name="frm">
		<br><br>
		<h2>게시판</h2>
		<br><br>
		<div id="outter">
			<table border="1">
				<tr>
					<td>등록날짜: ${sal.reg_date }</td>
				</tr>
				<tr>
					<td>직위: <input class="updateSpot" type="text" name="spot" value="${sal.spot }"></td>	
				</tr>	
				<tr>
					<td>평균 연봉: <input class="updateSal" type="text" name="sal" value="${sal.sal }"></td>
				</tr>
			</table>
			<input type="hidden" name="rnum" value="${sal.rnum }" />
			<div style="float: right;">
				<input class="updateBtn" type="button" value="수정"> 
				<input class="deleteBtn" type="button" value="삭제"> 
				<input type="button" value="글 목록"onclick="location.href='/user/review/reviewSelectList.do'">
			</div>
		</div>
	</form>
	<script>
	const updateBtn = document.querySelector(".updateBtn");
	const deleteBtn = document.querySelector(".deleteBtn");
	const updateSpot = document.querySelector(".updateSpot"); 
	const updateSal = document.querySelector(".updateSal");
	
	updateBtn.addEventListener("click", function(event) {
		updateCheck();
	});
	
	function updateCheck() {
		if(updateSal.value != ""){
			if(confirm ("수정 하시겠습니까?") === true){
					alert("수정완료");
					document.frm.submit();
			} else {
				alert("수정취소");
			}
		} else {
			alert("연봉정보를 입력해주세요");
			updateReview.focus();
		}
	}	
	
	deleteBtn.addEventListener("click", function(event) {
		deleteCheck();
	});
		
	function deleteCheck() {
		if(confirm ("정말 삭제하시겠습니까?") === true){
			alert("삭제완료");
			location.href='/user/review/reviewDeleteForm.do?rnum=${sal.rnum}';
		} else {
			alert("삭제취소");
		}
	}
	
</script>
</body>
</html>