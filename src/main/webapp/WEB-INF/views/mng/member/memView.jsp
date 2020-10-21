<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>JOBARA - 관리자 : 개인회원 상세</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top: 30px">
		<div class="text-center">
		<h2>개인 회원정보 상세</h2>
<div class="row">
<div class="col-lg-2"></div>
 <div class="card w-75 col-lg-7">
   <div class="card-header">
    <h4 class="card-text">${member.name }</h4>
  </div>
    <div class="row">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
  	<c:if test="${image.storedfilename ne '' and not empty image.storedfilename}">
		<img src="/resources/images/upload/member/${image.storedfilename}" class="card-img-top" alt="사진" />
	</c:if>
	</div>
	  <div class="col-lg-4"></div>
  </div>
   <div class="card-body">
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">회원ID</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${member.id }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">이름</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${member.name }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">이메일</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${member.email }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">전화번호</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${member.phone }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">생년월일</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${member.phone }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">가입일</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${member.reg_date }</p> </div>
	</div>
	<div class="form-group row">
		<div class="col-sm-3 col-form-label"> <p class="card-text">정보최종수정일</p></div>
    	<div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${member.up_date }</p> </div>
	</div>
        <c:if test="${member.del_yn == 'Y' }">
        	<div class="form-group row">
				<div class="col-sm-3 col-form-label"> <p class="card-text">탈퇴일자</p></div>
    			<div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${member.del_date }</p> </div>
			</div>
        </c:if>
    <div class="text-center">
        <c:if test="${member.del_yn == 'N' }">
		<button data-oper='modify' class="btn btn-warning">수정/삭제</button>
		</c:if>
		<button data-oper='list' class="btn btn-success">목록</button>
	</div>
</div>
</div>
<!-- .card -->
<div class="col-lg-3"></div>
</div>
<!-- .row -->
</div>
<!-- .text-center -->
</div>
<!-- .container -->
	<form id='operForm' action="/mng/member/memMngUpdateForm.do" method="get">
  		<input type='hidden' id='mnum' name='mnum' value='<c:out value="${member.mnum}"/>'>
  		<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
  		<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
	</form>

<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/mng/member/memMngUpdateForm.do").submit();
	
	});

$("button[data-oper='list']").on("click", function(e) {
	
	operForm.find("#mnum").remove();
	operForm.attr("action", "/mng/member/memSelectList.do")
	operForm.submit();
	
	});
});
</script>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>