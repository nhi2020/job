<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>마이페이지</title>
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
			action="/user/mypage/member/memMyUpdateForm.do">

			<h3 style="font-weight: bold;">
				<i class="fas fa-user-friends"></i> 마이페이지
			</h3>

			<ul class="list-group">
				<li class="list-group-item " style="background-color: #64cd3c;">아이디: ${sessionScope.user.id}</li>
				<li class="list-group-item" style="background-color: #eef5df;">이미지: <img
					src="/resources/images/upload/member/${sessionScope.user.storedfilename}"
					class="img-fluid" width="100px" height="100px" /></li>
				<li class="list-group-item" style="background-color: #e3f5bc;">이름: ${sessionScope.user.name}</li>
				<li class="list-group-item" style="background-color: #eef5df;">성별: <c:if
						test="${sessionScope.user.gender eq '1' }">
						남자
					</c:if> <c:if test="${sessionScope.user.gender eq '2' }">
						여자
					</c:if>
				</li>
				<li class="list-group-item" style="background-color: #e3f5bc;">이메일: ${sessionScope.user.email }</li>
				<li class="list-group-item" style="background-color: #eef5df;">전화번호: ${sessionScope.user.phone }</li>
				<li class="list-group-item" style="background-color: #e3f5bc;">생일: ${sessionScope.user.birthday }</li>
				<li class="list-group-item" style="background-color: #eef5df;">경력: ${sessionScope.user.career }</li>

				<li class="list-group-item" style="background-color: #e3f5bc;"><input type="submit"
					class="btn btn-success float-right" value="수정" /></li>
			</ul>
		</form>

	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>