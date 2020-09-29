<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../../inc/top.jsp"%>
<title>마이페이지</title>
</head>
<body>
	<%@ include file="../../../inc/header.jsp"%>
	<div class="container" style="margin-top: 30px"></div>

	<h2>마이페이지</h2>
	<form name="form1" method="post" action="/memmyUpdateForm.do">
	<input type="hidden" name="id" value="${ss.id}"/>
		<table border="1" width="400">
			<tr>
				<td>아이디</td>
				<td>${ss.id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${ss.name }</td>
			</tr>
			<tr>
				<td>성별</td>
				<c:if test="${ss.gender eq 'M'}">	
				<td>남자</td>
				</c:if>
				<c:if test="${ss.gender eq'W'}">	
				<td>여자</td>
				</c:if>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${ss.email }</td>
			</tr>
			<tr>
				<td>폰번호</td>
				<td>${ss.phone }</td>
			</tr>
			<tr>
				<td>생일</td>
				<td>${ss.birthday }</td>
			</tr>
			<tr>
				<td>경력</td>
				<td>${ss.career }</td>
			</tr>

		</table>
		<input type="submit" value="수정"/>
	</form>
	<%@ include file="../../../inc/footer.jsp"%>
</body>
</html>