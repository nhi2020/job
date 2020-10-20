<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container pt-3">

		<form name="form1" method="post" action="/user/mypage/biz/bizMyUpdateForm.do">
			<h2>마이페이지</h2>
			<ul class="list-group">
			  <li class="list-group-item" style="background-color: #64cd3c;">사업자번호: ${sessionScope.b_user.bsmno}</li>
			  <li class="list-group-item" style="background-color :#ccf5bc;">기업명: ${sessionScope.b_user.company}</li>
			  <li class="list-group-item" style="background-color :#ccf5bc;">이메일: ${sessionScope.b_user.email}</li>
			  <li class="list-group-item"style="background-color :#ccf5bc;">대표자: ${sessionScope.b_user.ceo}</li>
			  <li class="list-group-item"style="background-color :#ccf5bc;">대표자 연락처: ${sessionScope.b_user.phone}</li>
			  <li class="list-group-item"style="background-color :#ccf5bc;">업종: ${sessionScope.b_user.field}</li>
			  <li class="list-group-item"style="background-color :#ccf5bc;">주소: ${sessionScope.b_user.addr}</li>
			  <li class="list-group-item"style="background-color :#ccf5bc;">이미지: <img src="/resources/images/upload/biz/${sessionScope.b_user.storedfilename}" class="img-fluid" width="30%" height="30%" /></li>
			  <li class="list-group-item"><input type="submit" class="btn btn-success float-right" value="수정" /></li>
			</ul>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>