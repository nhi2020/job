<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	bizInsertForm.jsp
	<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">회원 임의 등록</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form action="/mng/biz/bizMngInsert.do" method="post">
          <div class="form-group">
            <label>사업자번호</label> <input class="form-control" name='bsmno'><br>
            관리자가 기업 계정을 생성할 경우, 비밀번호는 기본적으로 '1234abcd!'로 설정되어 있습니다. 
          </div>
          <div class="form-group">
            <label>기업명</label> <input class="form-control" name='company'>
          </div>
          <div class="form-group">
            <label>대표 이메일</label> <input class="form-control" name='email'>
          </div>
          <div class="form-group">
            <label>대표 전화번호</label> <input class="form-control" name='phone'>
          </div>
          <div class="form-group">
            <label>대표자</label> <input class="form-control" name='ceo'>
          </div>
          <div class="form-group">
            <label>직종</label> <input class="form-control" name='field'>
          </div>
          <div class="form-group">
            <label>주소</label> <input class="form-control" name='addr'>
          </div>
          <button type="submit" class="btn btn-default">기업 추가</button>
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