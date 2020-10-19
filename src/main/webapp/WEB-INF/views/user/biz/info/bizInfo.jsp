<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<c:forEach items="${bizInfo}" var="result">	
	<p>번호 : ${result.bnum }</p>
	<pre>기업명 : <a href="/user/review/reviewSelectList.do?bsmno=${result.bsmno}">${result.company }</a></pre>
</c:forEach>
	<div class="text-center">
			    <c:if test="${pg1.startPage > pg1.pageBlock }">
					<a href="/user/biz/info/bizInfo.do?currentPage=${pg1.startPage-pg1.pageBlock}&pg=pg1">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg1.startPage }" end="${pg1.endPage }">
					<a href="/user/biz/info/bizInfo.do?currentPage=${i}&pg=pg1">[${i}]</a>
				</c:forEach>
				<c:if test="${pg1.endPage < pg1.totalPage }">
					<a href="/user/biz/info/bizInfo.do?currentPage=${pg1.startPage+pg1.pageBlock}&pg=pg1">[다음]</a>
				</c:if>
	</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>