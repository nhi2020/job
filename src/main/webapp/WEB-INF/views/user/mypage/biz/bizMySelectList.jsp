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
	<div class="container" style="margin-top: 30px"></div>

	<h2>마이페이지</h2>
	<form name="form1" method="post"
		action="/user/mypage/biz/bizMyUpdateForm.do">
		<table border="1" width="400">
			<tr>
				<th>사업자번호</th>
				<td>${sessionScope.b_user.bsmno}</td>
			</tr>

			<tr>
				<th>기업명</th>
				<td>${sessionScope.b_user.company}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${sessionScope.b_user.email}</td>
			</tr>

			<tr>
				<th>대표자</th>
				<td>${sessionScope.b_user.ceo}</td>
			</tr>

			<tr>
				<th>대표자 연락처</th>
				<td>${sessionScope.b_user.phone}</td>
			</tr>

			<tr>
				<th>업종</th>
				<td>${sessionScope.b_user.field}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${sessionScope.b_user.addr}</td>
			</tr>

			<tr>
				<th>이미지</th>
				<td><img
					src="/resources/images/upload/biz/${sessionScope.b_user.storedfilename}"
					class="img-fluid" width="30%" height="30%" /></td>
			</tr>

		</table>
		<input type="submit" value="수정" />
	</form>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>