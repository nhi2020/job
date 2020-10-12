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
	memUpdateForm.jsp
</div>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">회원 정보 수정</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">회원 정보 수정</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/mng/member/memMngUpdate.do" method="post">
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      
 
         <div>
          <label>회원번호</label> <input class="form-control" name='mnum'
            value='<c:out value="${member.mnum }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>ID</label> <input class="form-control" name='id'
            value='<c:out value="${member.id }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>이름</label> <input class="form-control" name='name'
            value='<c:out value="${member.name }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>암호</label> <input type="password" class="form-control" name='pass'
            value='<c:out value="${member.pass }"/>'>
        </div>
        <div class="form-group">
          <label>이메일</label>
          <input type="text" class="form-control" name='email'
			value='<c:out value="${member.email }"/>'>
        </div>
        <div class="form-group">
          <label>전화번호</label> <input type="text" class="form-control" name='phone'
            value='<c:out value="${member.phone }"/>'>
        </div>
        <div class="form-group">
          <label>생년월일</label> <input type="date" class="form-control" name='birthday'
            value='<c:out value="${member.birthday }"/>'>
        </div>
        <div class="form-group">
          <label>경력</label> <input type="text" class="form-control" name='career'
            value='<c:out value="${member.career }"/>'>
        </div>
        <div class="form-group">
          <label>등록일</label> <input class="form-control" name='reg_date'
            value='<c:out value="${member.reg_date }"/>' readonly="readonly">
        </div>

  <button type="submit" data-oper='modify' class="btn btn-default">수정</button>
  <button type="submit" data-oper='remove' class="btn btn-danger">완전 삭제</button>
  <button type="submit" data-oper='list' class="btn btn-info">목록</button>
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
			formObj.attr("action", "/mng/member/remove.do");
		} else if (operation === 'list') {
			formObj.attr("action", "/mng/member/memSelectList.do").attr("method", "get");
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


<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>