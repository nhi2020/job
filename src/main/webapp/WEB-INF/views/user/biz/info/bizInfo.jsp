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
<div class="container pt-3">
	<c:forEach items="${bizInfo}" var="result">	
		<div class="row p-2 my-3 border">
			<div class="col-3 border border-top-0 border-left-0 border-bottom-0">
				<img src="/resources/images/upload/member/${result.storedfilename}" class="rounded" alt="${result.storedfilename}" style="width:100px;height:100px;">
			</div>
			<div class="col-7">
				<p class="font-weight-bold">기업명 : <a href="/user/review/reviewSelectList.do?bsmno=${result.bsmno}">${result.company }</a></p>
				<p><span class="badge badge-secondary">${result.field}</span>${result.review} 기업리뷰 |   ${result.sal} 기업연봉 | ${result.mreview}면접후기 </p>
			</div>
		</div>
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
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>