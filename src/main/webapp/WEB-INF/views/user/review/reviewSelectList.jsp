<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<title>후기 리스트</title>
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
	      <a class="nav-link ${(param.pg eq 'pg1' or param.pg == null)?'active':''}" href="#tab1">기업리뷰</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link ${(param.pg eq 'pg2')?'active':''}" href="#tab2">기업연봉</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link ${(param.pg eq 'pg3')?'active':''}" href="#tab3">면접후기</a>
	    </li>
	  </ul>
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="tab1" class="container tab-pane ${(param.pg eq 'pg1' or param.pg == null)?'active':'fade'}"><br>
	      <h3>기업리뷰</h3>
	      <c:forEach var="result1" items="${list1}">
      		<p>	
      			글번호 : ${result1.rnum }<br/>
      			조회수 : ${result1.b_cnt }<br/>
      			${result1.reg_date }<br/>
      			${result1.id }<br/>
      			<a href="/user/review/reviewDetailForm.do?rnum=${result1.rnum}">${result1.review }</a>
      		</p>
	      </c:forEach>
	      <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/user/review/reviewWriteForm.do?id=user01&bsmno=111-100'">
	      <c:if test="${pg1.startPage > pg1.pageBlock }">
				<a href="/user/review/reviewSelectList.do?currentPage=${pg1.startPage-pg1.pageBlock}&pg=pg1">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg1.startPage }" end="${pg1.endPage }">
				<a href="/user/review/reviewSelectList.do?currentPage=${i}&pg=pg1">[${i}]</a>
			</c:forEach>
			<c:if test="${pg1.endPage < pg1.totalPage }">
				<a href="/user/review/reviewSelectList.do?currentPage=${pg1.startPage+pg1.pageBlock}&pg=pg1">[다음]</a>
			</c:if>
	    </div>
	    <div id="tab2" class="container tab-pane ${(param.pg eq 'pg2')?'active':'fade'}"><br>
	      <h3>연봉</h3>
	      <c:forEach var="result2" items="${list2}">
	      	<p> 
	      		직위 :    ${result2.spot }<br/>
	      		<p>평균연봉 : <a href="/user/review/salDetailForm.do?rnum=${result2.rnum}">${result2.sal }</a></p><br>
	      	</p>
	      </c:forEach>
	      <input type="button" value="연봉추가" style="float: right;" onclick="location.href='/user/review/salWriteForm.do?id=user01&bsmno=111-100'">
	      <c:if test="${pg2.startPage > pg2.pageBlock }">
				<a href="/user/review/reviewSelectList.do?currentPage=${pg2.startPage-pg2.pageBlock}&pg=pg2">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg2.startPage }" end="${pg2.endPage }">
				<a href="/user/review/reviewSelectList.do?currentPage=${i}&pg=pg2">[${i}]</a>
			</c:forEach>
			<c:if test="${pg2.endPage < pg2.totalPage }">
				<a href="/user/review/reviewSelectList.do?currentPage=${pg2.startPage+pg2.pageBlock}&pg=pg2">[다음]</a>
			</c:if>
	    </div>
	    <div id="tab3" class="container tab-pane ${(param.pg eq 'pg3')?'active':'fade'}"><br>
	      <h3>면접후기</h3>
	      	<c:forEach var="result3" items="${list3}">
	      	 <p>
	      	 	글번호 : ${result3.rnum }<br/>
	      	 	조회수 : ${result3.b_cnt }<br/>
	      	 	면접상태 : ${result3.m_status }<br/>
	      	 	면접난이도 : ${result3.m_difficultly }<br/>
		      	${result3.reg_date }<br/>
		      	${result3.id }<br/>	
		      	<a href="/user/review/mreviewDetailForm.do?rnum=${result3.rnum}">${result3.mreview }</a>	     
		     </p>
		    </c:forEach>	
		     <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/user/review/mreviewWriteForm.do?id=user01&bsmno=111-100'">
		    <c:if test="${pg3.startPage > pg3.pageBlock }">
				<a href="/user/review/reviewSelectList.do?currentPage=${pg3.startPage-pg3.pageBlock}&pg=pg3">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg3.startPage }" end="${pg3.endPage }">
				<a href="/user/review/reviewSelectList.do?currentPage=${i}&pg=pg3">[${i}]</a>
			</c:forEach>
			<c:if test="${pg3.endPage < pg3.totalPage }">
				<a href="/user/review/reviewSelectList.do?currentPage=${pg3.startPage+pg3.pageBlock}&pg=pg3">[다음]</a>
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