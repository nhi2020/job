<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	main.jsp
	
	<div>
		<br>
		<br>
		<a href="/mng/biz/bizSelectList.do">기업정보 관리</a>
		<br>
		<br>
		<br>
		<br>
		<br>
		<a href="/mng/review/reviewSelectList.do">리뷰정보 관리</a>
		<br>
		<br>
		<br>
		<br>
		<br>
		<a href="/mng/member/memSelectList.do">회원정보 관리</a>
		<br>
		<br>
	</div>
	
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>