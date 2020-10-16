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
	memView.jsp
	
	<div >
  <div >
    <h1>개인 회원 관리</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div >
  <div>
    <div >

      <div>개인 회원 관리</div>
      <!-- /.panel-heading -->
      <div>

          <div>
          <label>회원번호</label> <input class="form-control" name='mnum'
            value='<c:out value="${member.mnum }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>ID</label> <input class="form-control" name='id'
            value='<c:out value="${member.id }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>이름</label> <input class="form-control" name='pass'
            value='<c:out value="${member.name }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>이메일</label>
          <input type="text" class="form-control" name='email'
			value='<c:out value="${member.email }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>전화번호</label> <input class="form-control" name='phone'
            value='<c:out value="${member.phone }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>생년월일</label> <input class="form-control" name='birthday'
            value='<c:out value="${member.birthday }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>등록일</label> <input class="form-control" name='reg_date'
            value='<c:out value="${member.reg_date }"/>' readonly="readonly">
        </div>
        <c:if test="${biz.del_yn == 'Y' }">
        <div class="form-group">
        <label>삭제 일자</label> <input class="form-control" name='del_date'
            value='<c:out value="${biz.del_date }"/>' readonly="readonly">
        </div>
        </c:if>
        <c:if test="${biz.del_yn == 'N' }">
        <div class="form-group">
          활동 회원
        </div>
        </c:if>
		<button data-oper='modify' class="btn btn-warning">수정/삭제</button>
		<button data-oper='list' class="btn btn-success">목록</button>

	<form id='operForm' action="/mng/member/memMngUpdateForm.do" method="get">
  		<input type='hidden' id='mnum' name='mnum' value='<c:out value="${member.mnum}"/>'>
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
		operForm.attr("action", "/mng/member/memMngUpdateForm.do").submit();
	
	});

$("button[data-oper='list']").on("click", function(e) {
	
	operForm.find("#mnum").remove();
	operForm.attr("action", "/mng/member/memSelectList.do")
	operForm.submit();
	
	});
});
</script>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>