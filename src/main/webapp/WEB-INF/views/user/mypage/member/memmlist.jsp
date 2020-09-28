<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../../inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	
</div>
<%@ include file="../../../inc/footer.jsp" %>	

	<h2>회원목록</h2>

	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>이메일</th>
			<th>폰</th>
			<th>생일</th>
			<th>경력</th>
			<c:forEach var="my" items="${list}">
				<tr>
					<td>${my.id }</td>
					<td>${my.name }</td>
					<td>${my.gender}</td>
					<td>${my.email}</td>
					<td>${my.phone}</td>
					<td>${my.birthday}</td>
					<td>${my.career}</td>
				</tr>

			</c:forEach>
	</table>
</body>
</html>