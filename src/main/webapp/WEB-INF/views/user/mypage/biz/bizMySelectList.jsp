<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>마이기업 페이지</title>
<style type="text/css">
li {
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container pt-3">

		<form name="form1" method="post"
			action="/user/mypage/biz/bizMyUpdateForm.do">
			<h3 style="font-weight: bold;">
				<i class="far fa-building"></i> 마이기업 페이지
			</h3>
			<br> <br>
			<ul class="list-group">
				<li class="list-group-item" style="background-color: #64cd3c;">사업자번호:
					${sessionScope.b_user.bsmno}</li>
					<li class="list-group-item" style="background-color: #eef5df;">이미지:
					<img
					src="/resources/images/upload/biz/${sessionScope.b_user.storedfilename}"
					class="img-fluid" style="width:100px;height:100px;" />
				</li>
				<li class="list-group-item" style="background-color: #e3f5bc;">기업명:
					${sessionScope.b_user.company}</li>
				<li class="list-group-item" style="background-color: #eef5df;">이메일:
					${sessionScope.b_user.email}</li>
				<li class="list-group-item" style="background-color: #e3f5bc;">대표자:
					${sessionScope.b_user.ceo}</li>
				<li class="list-group-item" style="background-color: #eef5df;">대표자
					연락처: ${sessionScope.b_user.phone}</li>
				<li class="list-group-item" style="background-color: #e3f5bc;">업종:
					${sessionScope.b_user.field}</li>
				<li class="list-group-item" style="background-color: #eef5df;">주소:
					${sessionScope.b_user.addr1} ${sessionScope.b_user.addr}
					${sessionScope.b_user.addr3}</li>
				
				<li class="list-group-item" style="background-color: #e3f5bc;"><input
					type="submit" class="btn btn-success float-right" value="수정" /></li>
			</ul>
		</form>
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>


</body>
</html>