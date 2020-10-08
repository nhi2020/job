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
<div>
  <div>
    <h1>기업 회원 관리</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div >
  <div>
    <div >

      <div>기업 회원 관리</div>
      <!-- /.panel-heading -->
      <div>

         <div>
          <label>기업번호</label> <input class="form-control" name='bnum'
            value='<c:out value="${biz.bnum }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>사업자 번호</label> <input class="form-control" name='bsmno'
            value='<c:out value="${biz.bsmno }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>기업명</label> <input class="form-control" name='company'
            value='<c:out value="${biz.company }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>대표자</label> <input class="form-control" name='ceo'
            value='<c:out value="${biz.ceo }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>이메일</label>
          <input type="text" class="form-control" name='email'
			value='<c:out value="${biz.email }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>전화번호</label> <input class="form-control" name='phone'
            value='<c:out value="${biz.phone }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>등록일자</label> <input class="form-control" name='reg_date'
            value='<c:out value="${biz.reg_date }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>삭제 여부</label> <input class="form-control" name='del_yn'
            value='<c:out value="${biz.del_yn }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>삭제 일자</label> <input class="form-control" name='del_date'
            value='<c:out value="${biz.del_date }"/>' readonly="readonly">
        </div>
        <c:if test="${biz.del_yn == 'n'}">
		<button data-oper='modify' class="btn btn-default">수정</button>
        </c:if>
		<button data-oper='list' class="btn btn-info">목록</button>

	<form id='operForm' action="/mng/biz/bizMngUpdateForm.do" method="get">
  		<input type='hidden' id='bnum' name='bnum' value='<c:out value="${biz.bnum}"/>'>
  		<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
  		<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
	</form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

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
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>