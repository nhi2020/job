<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>업데이트</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트 어썸 -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>

<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<h2>회원정보 상세</h2>
	<form action="/user/member/mypage/myUpdate.do" method="post"
		id="upForm">
		<input type="hidden" name="id" value="${sessionScope.user.id}">
		<input type="hidden" name="pass" value="${sessionScope.user.pass}">

		<table border="1" width="400">
			<tr>
				<th>아이디</th>
				<td>${sessionScope.user.id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required"
					value="${sessionScope.user.name }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" required="required"
					value="${sessionScope.user.email }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" required="required"
					value="${sessionScope.user.phone }"></td>
			</tr>
			<%-- <tr>
				<th>생일</th>
				<td>
					<input type="hidden" name="birthday" value="${user.birthday}" readonly="readonly">
				</td>
			</tr> --%>
			<tr>
				<th>경력</th>
				<td><input type="text" name="career" required="required"
					value="${sessionScope.user.career }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>

		</table>
	</form>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>

