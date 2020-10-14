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
	<div class="container mt-3">
		<c:forEach var="result1" items="${list1}">
	 	 <h2></h2>
		</c:forEach>
	  <br>
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link active" href="#tab1">기업리뷰</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#tab2">연봉</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#tab3">면접후기</a>
	    </li>
	  </ul>
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="tab1" class="container tab-pane active"><br>
	      <h3>기업리뷰</h3>
	      <c:forEach var="result1" items="${list1}">
      		<p>	
      			${result1.reg_date }<br/>
      			${result1.id }<br/>
      			${result1.title}
      		</p>
	      </c:forEach>
	      <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/reviewWriteForm.do'">
	      <c:if test="${pg1.startPage > pg1.pageBlock }">
				<a href="list.do?currentPage=${pg1.startPage-pg1.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg1.startPage }" end="${pg1.endPage }">
				<a href="list.do?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${pg1.endPage < pg1.totalPage }">
				<a href="list.do?currentPage=${pg1.startPage+pg1.pageBlock}">[다음]</a>
			</c:if>
	    </div>
	    <div id="tab2" class="container tab-pane fade"><br>
	      <h3>연봉</h3>
	      <c:forEach var="result2" items="${list2}">
	      	<p> 
	      		${result2.reg_date }<br/>
	      		${result1.id }<br/>
	      		${result2.sal }
	      	</p>
	      </c:forEach>
	      <c:if test="${pg2.startPage > pg2.pageBlock }">
				<a href="list.do?currentPage=${pg2.startPage-pg2.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg2.startPage }" end="${pg2.endPage }">
				<a href="list.do?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${pg2.endPage < pg2.totalPage }">
				<a href="list.do?currentPage=${pg2.startPage+pg2.pageBlock}">[다음]</a>
			</c:if>
	    </div>
	    <div id="tab3" class="container tab-pane fade"><br>
	      <h3>면접후기</h3>
	      	<c:forEach var="result3" items="${list3}">
	      	 <p>
		      	${result3.reg_date }<br/>
		      	${result3.id }<br/>		     
		      	${result3.title}
		     </p>
		    </c:forEach>	
		     <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/reviewWriteForm.do'">
		    <c:if test="${pg3.startPage > pg3.pageBlock }">
				<a href="list.do?currentPage=${pg3.startPage-pg3.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg3.startPage }" end="${pg3.endPage }">
				<a href="list.do?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${pg3.endPage < pg3.totalPage }">
				<a href="list.do?currentPage=${pg3.startPage+pg3.pageBlock}">[다음]</a>
			</c:if>
	    </div>
	  </div>
	</div>	
	<script>
	$(document).ready(function(){
	  $(".nav-tabs a").click(function(){
	    $(this).tab('show');
	  });
	});
	</script>
</div>
<br>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>