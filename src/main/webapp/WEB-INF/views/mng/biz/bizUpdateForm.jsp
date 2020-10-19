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
	bizUpdateForm.jsp
	<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">기업 정보 수정</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">기업 정보 수정</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/mng/biz/bizMngUpdate.do" method="post">
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      
        <div>
          <label>회원번호</label> <input class="form-control" name='bnum'
            value='<c:out value="${biz.bnum }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>사업자번호</label> <input class="form-control" name='bsmno'
            value='<c:out value="${biz.bsmno }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>기업명</label> <input class="form-control" name='company'
            value='<c:out value="${biz.company }"/>'>
        </div>
        <div class="form-group">
          <label>대표 이메일</label>
          <input type="text" class="form-control" name='email'
			value='<c:out value="${biz.email }"/>'>
        </div>
        <div class="form-group">
          <label>대표 전화번호</label> <input type="text" class="form-control" name='phone'
            value='<c:out value="${biz.phone }"/>'>
        </div>
        <div class="form-group">
          <label>대표자</label> <input type="text" class="form-control" name='ceo'
            value='<c:out value="${biz.ceo }"/>'>
        </div>
        <div class="form-group">
          <label>업종</label> <input type="text" class="form-control" name='field'
            value='<c:out value="${biz.field }"/>'>
        </div>
        <div class="form-group">
          <label>주소</label> <input type="text" class="form-control" name='addr'
            value='<c:out value="${biz.addr }"/>'>
        </div>

  <button type="submit" data-oper='modify' class="btn btn-secondary">수정</button>
  <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
  <button type="submit" data-oper='list' class="btn btn-primary">목록</button>
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
	
	var formObj = $("form");
	$('button').on("click", function(e){
	
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/mng/biz/remove.do");
		} else if (operation === 'list') {
			formObj.attr("action", "/mng/biz/bizSelectList.do").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		formObj.submit();
	});
});
</script>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>