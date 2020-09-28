<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<c:forEach var="result" items="${list}">
		<c:out value="${result.name}"/>
		<c:out value="${result.email }"></c:out>
		<c:if test="${fn:trim(result.gender) eq 'M'}">
			남자
		</c:if>
		<c:if test="${fn:trim(result.gender) eq 'W'}">
			여자
		</c:if>
	</c:forEach>
</div>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>