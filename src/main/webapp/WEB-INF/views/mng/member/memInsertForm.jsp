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
	memInsertForm.jsp

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">회원 임의 등록</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/mng/member/memMngInsert.do" method="post">
          <div class="form-group">
            <label>ID</label> <input class="form-control" name='id'><br>
            관리자가 회원 계정을 생성할 경우, 비밀번호는 기본적으로 'abcd1234!'로 설정되어 있습니다. 
          </div>
          <div class="form-group">
            <label>성명</label> <input class="form-control" name='name'>
          </div>
          <div class="form-group">
            <label>성별</label> 
            <select name="gender">
            	<option value="M">남자</option>
            	<option value="F">여자</option>
            </select>
          </div>
          <div class="form-group">
            <label>이메일</label> <input class="form-control" name='email'>
          </div>
          <div class="form-group">
            <label>전화번호</label> <input class="form-control" name='phone'>
          </div>
          <div class="form-group">
            <label>생년월일</label> <input type="date" class="form-control" name='birthday'>
          </div>
          <div class="form-group">
            <label>경력</label> <input class="form-control" name='career'>
          </div>
          <button type="submit" class="btn btn-default">회원 등록</button>
          <button type="reset" class="btn btn-default">초기화</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->	

	
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>