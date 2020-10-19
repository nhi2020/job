<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top:30px">
<div class="row">
<div class="col-lg-12">

<h1>리뷰 관리</h1>

<div>
       <div>
          <label>리뷰 관리 번호</label> <input class="form-control" name='rnum'
            value='<c:out value="${review.rnum }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>사업자 번호</label> <input class="form-control" name='bsmno'
            value='<c:out value="${review.bsmno }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>기업명</label> <input class="form-control" name='company'
            value='<c:out value="${review.company }"/>' readonly="readonly">
        </div>
        <c:choose>
        <c:when test="${review.review != null}">
        <div class="form-group">
          <label>기업 리뷰</label> <textarea class="form-control" name='review'
            readonly="readonly"> <c:out value="${review.review }"/></textarea>
        </div>
        </c:when>
        <c:when test="${review.sal != null }">
        <div class="form-group">
         <label>직위</label>
          <input type="text" class="form-control" name='spot'
			value='<c:out value="${review.spot }"/>' readonly="readonly">
        </div>
        <div class="form-group">
         <label>연봉</label>
          <input type="text" class="form-control" name='sal'
			value='<c:out value="${review.sal }"/>' readonly="readonly">
        </div>
        </c:when>
        <c:when test="${review.mreview != null }">
        <div class="form-group">
          <label>면접리뷰</label> <textarea class="form-control" name='mreview' readonly="readonly"><c:out value="${review.mreview }"/></textarea>
        </div>
        <div class="form-group">
          <label>면접일자</label> <input class="form-control" name='m_date'
            value='<c:out value="${review.m_date }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label> 면접 상황</label> <input class="form-control" name='m_status'
            value='<c:out value="${review.m_status }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>면접난이도</label> <input class="form-control" name='m_difficultly'
            value='<c:out value="${review.m_difficultly }"/>' readonly="readonly">
        </div>
        </c:when>
        </c:choose>
        <div class="form-group">
          <label>등록일자</label> <input class="form-control" name='reg_date'
            value='<c:out value="${review.reg_date }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>최종수정일자</label> <input class="form-control" name='reg_date'
            value='<c:out value="${review.up_date }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>삭제 여부</label> <input class="form-control" name='del_yn'
            value='<c:out value="${review.del_yn }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>삭제 일자</label> <input class="form-control" name='del_date'
            value='<c:out value="${review.del_date }"/>' readonly="readonly">
        </div>
        <c:if test="${review.del_yn == 'N'}">
			<button data-oper='delete' class="btn btn-danger">삭제</button>
        </c:if>
		<button data-oper='list' class="btn btn-info">목록</button>
		<form id='operForm' action="/mng/review/reviewMngRemove.do" method="get">
  		<input type='hidden' id='rnum' name='rnum' value='<c:out value="${review.rnum}"/>'>
  		<input type="hidden" name="pageNum" value="<c:out value='${pageNum }'/>">
	</form>
</div>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</div>
<!--  /.container -->
<script type="text/javascript">

// 수정(삭제)와 목록 부분 클릭시 동작 화면
$(document).ready(function() {
	var operForm = $("#operForm");
	
	$("button[data-oper='delete']").on("click", function(e) {
		operForm.attr("action", "/mng/review/reviewMngRemove.do").submit();
	
	});

$("button[data-oper='list']").on("click", function(e) {
	
	operForm.attr("action", "/mng/review/returnList.do")
	operForm.submit();
	
	});
});
</script>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>