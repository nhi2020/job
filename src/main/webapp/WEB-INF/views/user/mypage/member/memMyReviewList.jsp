<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>리뷰</title>
<script type="text/javascript">
	function reviewWrite(url, bsmno){
		var userid='${sessionScope.user.id}';
		if(userid != ''){
			location.href=url+"?id="+userid+"&bsmno="+bsmno;
		}else{
			alert('로그인 해주세요.');
			return false;
		}
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="container" style="margin-top:30px">
    <div class="container mt-3">
		<c:forEach var="result1" items="${list1}">
	 	 <h2></h2>
		</c:forEach> 
	  <br>
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link ${(param.pg eq 'pg1' or param.pg == null)?'active':''}" href="#tab1">기업리뷰(${total1})</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link ${(param.pg eq 'pg2')?'active':''}" href="#tab2">기업연봉(${total2})</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link ${(param.pg eq 'pg3')?'active':''}" href="#tab3">면접후기(${total3})</a>
	    </li>
	  </ul>	 
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="tab1" class="container tab-pane ${(param.pg eq 'pg1' or param.pg == null)?'active':'fade'}"><br>
	     <h3 style="font-weight: bold;">기업리뷰</h3>
	           <c:if test="${total1 == 0 }">
	      	<p style="color: grey">등록된 리뷰가 없습니다</p>
	      </c:if>
	      <c:forEach var="result1" items="${list1}" varStatus="i">
				<div class="pt-4 list-group-item-light text-success bg-light">글번호 : ${i.index+1 } | 등록일: ${result1.reg_date }</div>
				<div class="p-5 border border-success">
					<a href="/user/review/reviewDetailForm.do?rnum=${result1.rnum}">${result1.review }</a>
				</div>
			<br/>
	      </c:forEach>
			<div class="text-center">
			    <c:if test="${pg1.startPage > pg1.pageBlock }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${pg1.startPage-pg1.pageBlock}&pg=pg1">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg1.startPage }" end="${pg1.endPage }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${i}&pg=pg1">[${i}]</a>
				</c:forEach>
				<c:if test="${pg1.endPage < pg1.totalPage }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${pg1.startPage+pg1.pageBlock}&pg=pg1">[다음]</a>
				</c:if>
			</div>
	    </div>
	    <div id="tab2" class="container tab-pane ${(param.pg eq 'pg2')?'active':'fade'}"><br>
	      <h3 style="font-weight: bold;">연봉</h3>
	      <c:forEach var="result2" items="${list2}">
	      	<div class="container p-3 my-3 border">
		      	<p> 
		      		직위 : ${result2.spot }<br/>
		      		평균연봉 : <a href="/user/review/salDetailForm.do?rnum=${result2.rnum}"><fmt:formatNumber value="${result2.sal }" pattern="#,###.##"/>만원</a><br>
		      	</p>
		    </div>
	      </c:forEach>
	      	<div class="text-center">
		       <c:if test="${pg2.startPage > pg2.pageBlock }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${pg2.startPage-pg2.pageBlock}&pg=pg2">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg2.startPage }" end="${pg2.endPage }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${i}&pg=pg2">[${i}]</a>
				</c:forEach>
				<c:if test="${pg2.endPage < pg2.totalPage }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${pg2.startPage+pg2.pageBlock}&pg=pg2">[다음]</a>
				</c:if>
			</div>
	    </div>
	    <div id="tab3" class="container tab-pane ${(param.pg eq 'pg3')?'active':'fade'}"><br>
	      <h3 style="font-weight: bold;">면접후기</h3>
	      	<c:forEach var="result3" items="${list3}" varStatus="i">
	      		<div class="row p-3 my-3 border">
	      	 	  <div class="col-12 border border-top-0 border-left-0 border-right-0">
	      	 	 	 글번호 : ${i.index+1} | 등록일: ${result3.r_reg_date }
				  </div> 
	      	 	  <div class="col-3 border border-top-0 border-left-0 border-bottom-0">
				  	면접일자 : ${result3.m_date }<br/>
		      	 	면접상태 : ${result3.m_status }<br/>
		      	 	면접난이도 : ${result3.m_difficultly }
				  </div>
				  <div class="col-7">
				  	<a href="/user/review/mreviewDetailForm.do?rnum=${result3.rnum}">${result3.mreview }</a>
				  </div> 
				</div>    
		    </c:forEach>	
		    <div class="text-center">
			    <c:if test="${pg3.startPage > pg3.pageBlock }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${pg3.startPage-pg3.pageBlock}&pg=pg3">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg3.startPage }" end="${pg3.endPage }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${i}&pg=pg3">[${i}]</a>
				</c:forEach>
				<c:if test="${pg3.endPage < pg3.totalPage }">
					<a href="/user/mypage/member/memMyReviewList.do?currentPage=${pg3.startPage+pg3.pageBlock}&pg=pg3">[다음]</a>
				</c:if>
			</div>
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
<script type="text/javascript">
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });
});
</script>
</body>
</html>