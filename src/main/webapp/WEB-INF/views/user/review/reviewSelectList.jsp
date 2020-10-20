<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../inc/top.jsp" %>
<title>후기 리스트</title>
<style>
 .border {
   margin: 6px;
 }
</style>
<script type="text/javascript">
	function reviewWrite(url, bsmno){
		var userid='${sessionScope.user.id}';
		if(userid != ''){
			//location.href=url+"?id="+userid+"&bsmno="+bsmno;
			location.href=url+"?id="+userid+"&bsmno=111-100";
		}else{
			alert('개인회원만 작성이 가능합니다.');
			return false;
		}
	}
</script>
</head>
<body>
<%@ include file="../../inc/header.jsp" %>
<div class="container" style="margin-top:30px">
            <div class="p-5 border">
           		<img src="/resources/images/upload/biz/${bizInfo.storedfilename}" alt="${bizInfo.company}" style="width:5%;height:5%">
                <h2>${bizInfo.company}</h2>
                <p class="badge badge-success">${bizInfo.field}</p>
                <p>대표: ${bizInfo.ceo}</p>
                <p>주소:${bizInfo.addr1} ${bizInfo.addr} ${bizInfo.addr3}</p>
                <p>전화번호: ${bizInfo.phone}</p>
            </div>
    <div class="container mt-3">
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
	      <c:forEach var="result1" items="${list1}">
			<div class="pt-4 list-group-item-light text-success bg-light">글번호 : ${result1.rnum } | 조회수 : ${result1.b_cnt } | 등록일: ${result1.reg_date }</div>
  			<div class="p-5 border border-success">
				<a href="/user/review/reviewDetailForm.do?rnum=${result1.rnum}">${result1.review }</a>
  			</div>
	      </c:forEach>
	      <!-- <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/user/review/reviewWriteForm.do?id=user01&bsmno=111-100'"> -->
	      <c:if test="${user.id != null }">
			<input type="button" value="글쓰기" class="btn btn-success" style="float: right;" onclick="reviewWrite('/user/review/reviewWriteForm.do','${param.bsmno}');"/>
		  </c:if>
			<div class="text-center">
			    <c:if test="${pg1.startPage > pg1.pageBlock }">
					<a href="/user/review/reviewSelectList.do?currentPage=${pg1.startPage-pg1.pageBlock}&pg=pg1&bsmno=${param.bsmno}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg1.startPage }" end="${pg1.endPage }">
					<a href="/user/review/reviewSelectList.do?currentPage=${i}&pg=pg1&bsmno=${param.bsmno}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg1.endPage < pg1.totalPage }">
					<a href="/user/review/reviewSelectList.do?currentPage=${pg1.startPage+pg1.pageBlock}&pg=pg1&bsmno=${param.bsmno}">[다음]</a>
				</c:if>
			</div>
	    </div>
	    <div id="tab2" class="container tab-pane ${(param.pg eq 'pg2')?'active':'fade'}"><br>
	      <h3 style="font-weight: bold;">연봉</h3>
	      <c:if test="${total2 == 0 }">
	      	<p style="color: grey">등록된 연봉이 없습니다</p>
	      </c:if>
	      <c:if test="${total2 != 0 }">
	      <c:forEach var="result2" items="${list2}">
	      	<div class="container p-3 my-3 border">
		      	<p> 
		      		직위 : ${result2.spot }<br/><fmt:formatNumber value="${result2.min_sal }" pattern="#,###.##"/>만원 ~ <fmt:formatNumber value="${result2.max_sal }" pattern="#,###.##"/>만원
		      		평균연봉 : <fmt:formatNumber value="${result2.avg_sal }" pattern="#,###.##"/>만원
		      	</p>
				<div class="progress">
					<div class="progress-bar bg-success" style="width:${result2.per_sal}">${result2.per_sal}</div>
				</div>
			</div>
	      </c:forEach>
	      </c:if>
	      <!-- <input type="button" value="연봉추가" style="float: right;" onclick="location.href='/user/review/salWriteForm.do?id=user01&bsmno=111-100'"> -->
	      <input type="button" value="글쓰기" class="btn btn-success" style="float: right;" onclick="reviewWrite('/user/review/salWriteForm.do','${param.bsmno}');"/>
	      	<div class="text-center">
		       <c:if test="${pg2.startPage > pg2.pageBlock }">
					<a href="/user/review/reviewSelectList.do?currentPage=${pg2.startPage-pg2.pageBlock}&pg=pg2&bsmno=${param.bsmno}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg2.startPage }" end="${pg2.endPage }">
					<a href="/user/review/reviewSelectList.do?currentPage=${i}&pg=pg2&bsmno=${param.bsmno}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg2.endPage < pg2.totalPage }">
					<a href="/user/review/reviewSelectList.do?currentPage=${pg2.startPage+pg2.pageBlock}&pg=pg2&bsmno=${param.bsmno}">[다음]</a>
				</c:if>
			</div>
	    </div>
	    <div id="tab3" class="container tab-pane ${(param.pg eq 'pg3')?'active':'fade'}"><br>
	    <h3 style="font-weight: bold;">면접후기</h3>
	      <c:if test="${total3 == 0 }">
	      	<p style="color: grey">등록된 후기가 없습니다</p>
	      </c:if>
	      	<c:forEach var="result3" items="${list3}">
	      	 	<%-- <div class="pt-4 list-group-item-light text-success bg-light">글번호 : ${result3.rnum } | 조회수 : ${result3.b_cnt } | 등록일: ${result3.reg_date }</div> --%>
	      	 	<div class="row p-3 my-3 border">
	      	 	  <div class="col-12 border border-top-0 border-left-0 border-right-0">
				  	글번호 : ${result3.rnum } | 조회수 : ${result3.b_cnt } | 등록일: ${result3.reg_date }
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
		     <!-- <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/user/review/mreviewWriteForm.do?id=user01&bsmno=111-100'"> -->
		    <input type="button" value="글쓰기" class="btn btn-success" style="float: right;" onclick="reviewWrite('/user/review/mreviewWriteForm.do','${param.bsmno}');"/>
		    <div class="text-center">
			    <c:if test="${pg3.startPage > pg3.pageBlock }">
					<a href="/user/review/reviewSelectList.do?currentPage=${pg3.startPage-pg3.pageBlock}&pg=pg3&bsmno=${param.bsmno}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg3.startPage }" end="${pg3.endPage }">
					<a href="/user/review/reviewSelectList.do?currentPage=${i}&pg=pg3&bsmno=${param.bsmno}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg3.endPage < pg3.totalPage }">
					<a href="/user/review/reviewSelectList.do?currentPage=${pg3.startPage+pg3.pageBlock}&pg=pg3&bsmno=${param.bsmno}">[다음]</a>
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
<br>
<%@ include file="../../inc/footer.jsp" %>	
</body>
</html>