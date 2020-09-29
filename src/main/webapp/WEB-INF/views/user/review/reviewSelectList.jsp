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
reviewSelectLis Start...
<table>	
	<c:forEach var="result" items="${list}">
		${result.rnum}
		${result.id }
		${result.bsmno }
		${result.rev_type }
		${result.review }
		${result.sal }		
		${result.spot }
		${result.b_cnt }
		${result.reg_date }
		${result.up_date }
		${result.del_date }
		${result.del_yn }
		${result.m_status }
		${result.m_difficultly }
		${result.m_date }			
	</c:forEach>
</table>	
<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="list.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="list.do?currentPage=${i}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="list.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
</c:if>
</div>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>