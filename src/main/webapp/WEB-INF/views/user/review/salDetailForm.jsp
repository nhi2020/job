<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<title>연봉 상세보기</title>
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
		if(document.frm.sal.value != ""){
			if(confirm ("수정 하시겠습니까?") === true){
				document.frm.action="/user/review/salUpdate.do";
				document.frm.submit();
			} else {
				alert("수정취소");
			}
		} else {
			alert("연봉정보를 입력해주세요");
			document.frm.sal.focus();
		}
	}	
	
	function deleteCheck() {
		if(confirm ("정말 삭제하시겠습니까?") === true){
			document.frm.action="/user/review/reviewDeleteForm.do";
			document.frm.submit();
		} else {
			alert("삭제취소");
		}
	}
	
	function selectCheck() {
		alert("글목록으로 이동합니다.");
		document.frm.action="/user/review/reviewSelectList.do";
		document.frm.submit();
	}
	
</script>
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<form action="/user/review/salUpdate.do" name="frm">
		<input type="hidden" name="rnum" value="${sal.rnum }" />
		<input type="hidden" name="bsmno" value="${sal.bsmno }" />
		<h2>연봉 상세보기</h2>
		<div class="form-group">
	      <label for="reg_date">기업명:</label> 
	      <input type="text" class="form-control" name="company" value="${sal.company }" readonly="readonly"/>
	    </div>
		<div class="form-group">
	      <label for="reg_date">등록날짜:</label> 
	      <input type="text" class="form-control" name="reg_date" value="${sal.reg_date }" readonly="readonly"/>
	    </div>
	    <div class="form-group">
	      	<label for="spot">직위:</label> 
	     	<select class="form-control" name="spot">
				<option value="신입" ${sal.spot eq '신입' ? 'selected="selected"' : '' }>신입</option>
				<option value="대리" ${sal.spot eq '대리' ? 'selected="selected"' : '' }>대리</option>
				<option value="과장" ${sal.spot eq '과장' ? 'selected="selected"' : '' }>과장</option>
				<option value="차장" ${sal.spot eq '차장' ? 'selected="selected"' : '' }>차장</option>
				<option value="부장" ${sal.spot eq '부장' ? 'selected="selected"' : '' }>부장</option>
				<option value="상무" ${sal.spot eq '상무' ? 'selected="selected"' : '' }>상무</option>
				<option value="이사" ${sal.spot eq '이사' ? 'selected="selected"' : '' }>이사</option>
			</select> 
	    </div>
	    <div class="form-group">
	      <label for="sal">평균 연봉:</label> 
	      <input type="text" class="form-control" name="sal" value="${sal.sal }"/>
	    </div>
	    <div class="text-center">
			<input type="button" class="btn btn-success" value="수정" onclick="updateCheck();"> 
			<input type="button" class="btn btn-success" value="삭제" onclick="deleteCheck();">  
			<input type="button" class="btn btn-success" value="글 목록" onclick="selectCheck();">
		</div>
	</form>
	<br>
</div>
<br>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>