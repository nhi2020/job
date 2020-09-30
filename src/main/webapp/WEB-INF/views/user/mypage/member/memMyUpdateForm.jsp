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

	<h2>회원정보 상세</h2>
	<form action="/user/member/mypage/myUpdate.do" method="post" name="form1">
		<input type="hidden" name="id" value="${user.id}">
		<table border="1" width="400">
			<tr>
				<th>아이디</th>
				<td>${user.id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required"
					value="${user.name }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" required="required"
					value="${user.email }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" required="required"
					value="${user.phone }"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<input type="hidden" name="birthday" value="${user.birthday}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>경력</th>
				<td><input type="text" name="career" required="required"
					value="${user.career }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
