<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>JOBARA - 관리자 : 기업회원 상세</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="container" style="margin-top: 30px">
		<div class="text-center">
		<h2>기업정보 상세</h2>
<div class="row">
<div class="col-lg-2"></div>
 <div class="card w-75 col-lg-7">
   <div class="card-header">
    <h4 class="card-text">${biz.company }</h4>
  </div>
  <div class="row">
  <div class="col-lg-3"></div>
  <div class="col-lg-6">
  	<c:if test="${image.storedfilename ne '' and not empty image.storedfilename}">
		<img src="/resources/images/upload/biz/${image.storedfilename}" class="card-img-top" alt="회사로고" />
	</c:if>
	</div>
	  <div class="col-lg-3"></div>
  </div>
  <div class="card-body">
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">사업자 번호</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${biz.bsmno }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">기업명</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${biz.company }</p> </div>
	</div>
		<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">이메일</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${biz.email }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-md-3 col-form-label"> <p class="card-text">주소</p></div>
    <div class="col-md-9 card-text form-control text-center"> <p class="card-text">${biz.addr1 } ${biz.addr} ${biz.addr3 }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">대표자</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${biz.ceo }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">대표연락처</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${biz.phone }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">업종</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${biz.field }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">등록일</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${biz.reg_date }</p> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">정보최종수정일</p></div>
    <div class="col-sm-9 card-text form-control text-center"> <p class="card-text">${biz.up_date }</p> </div>
	</div>
    	<c:if test="${biz.del_yn=='Y'}">
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">탈퇴일자</p></div>
    <div class="col-sm-9 card-text form-control text-center"> 
	    	<p class="card-text">${biz.del_date }</p> 
    	</div>
	</div>
    	</c:if>
	<br>
	<div class="text-center">
        <c:if test="${biz.del_yn == 'N' }">
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
		<form id='operForm' action="/mng/biz/bizMngUpdateForm.do" method="get">
  			<input type='hidden' id='bnum' name='bnum' value='<c:out value="${biz.bnum}"/>'>
  			<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
  			<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
		</form>

<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/mng/biz/bizMngUpdateForm.do").submit();
	
	});

$("button[data-oper='list']").on("click", function(e) {
	
	operForm.find("#bnum").remove();
	operForm.attr("action", "/mng/biz/bizSelectList.do")
	operForm.submit();
	
	});
});
</script>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>