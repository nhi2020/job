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
		<form name="form1" method="post" action="">
		<table border="1" width="400">
		<tr>
		<td>사업자번호</td>
			<td>${sessionScope.b_user.bsmno}</td>
			</tr>
		
		
		
		
		
		
		
		
		</table>
		
		</form>
</body>
</html>