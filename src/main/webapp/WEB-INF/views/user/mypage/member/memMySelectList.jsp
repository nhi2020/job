<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>마이페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container" style="margin-top: 30px"></div>

	<h2>마이페이지</h2>
	<form name="form1" method="post"
		action="/user/mypage/member/memMyUpdateForm.do">
		<%-- <input type="hidden" name="id" value="${sessionScope.user.id}"/>
	<input type="hidden" name="name" value="${sessionScope.user.name}"/> --%>
		<table border="1" width="400">
			<tr>
				<th>아이디</th>
				<td>${sessionScope.user.id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${sessionScope.user.name}</td>
			</tr>
			<tr>
				<td>성별</td>
				<c:if test="${sessionScope.user.gender ==1 }">
					<td>남자
					</th>
				</c:if>
				<c:if test="${sessionScope.user.gender ==2 }">
					<td>여자</td>
				</c:if>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${sessionScope.user.email }</td>
			</tr>
			<tr>
				<th>폰번호</th>
				<td>${sessionScope.user.phone }</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>${sessionScope.user.birthday }</td>
			</tr>
			<tr>
				<th>경력</th>
				<td>${user.career }</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><img
					src="/resources/images/upload/member/${sessionScope.user.storedfilename}"
					class="img-fluid" width="30%" height="30%" /></td>
			</tr>

		</table>
		<input type="submit" value="수정" />
	</form>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>