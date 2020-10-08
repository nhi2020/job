<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
 function getRevList(page){
	str    = "";
	str2   = "";
	str3   = "";
	str4   = ""; 
	alert("getRevList ajax start page : " + page);
	
	$.ajax({
		url:"/mng/review/tab1/"+page +".do",
		dataType:"json",
		success:function(data){
			var jsondata = JSON.stringify(data); // json으로 받으면 모든 내용이 객체화되어 있음. 이걸 문자열로 변경해주는 작업임. 
			alert("jsondata->"+jsondata);
			
			str += "<br><h3>기업리뷰</h3>" +
					"<table class='table table-striped table-bordered table-hover'>" +
					"<thead class='thead-dark'>"+
						"<tr>" +
							"<th>글 번호</th>" +
							"<th>작성자</th>" + 
							"<th>기업명</th>" + 
							"<th>리뷰내용</th>" +
							"<th>등록일</th>" +
							"<th>수정일</th>" +
							"<th>삭제일</th>" +
						"</tr>" +
						"</thead>" +
						"<tr>";
			$(data.rlist).each(
				function(){
					str3 = this.review;
					str2 = 	"<td>"+ this.rnum + "</td>" + 
							"<td>" + this.id + "</td>" + 
							"<td>" + this.company + "</td>" + 
							"<td>" + "<a href='ReviewView.do?rnum=" + this.rnum + "'>"+ str3.substring(0, 15) + "......" +"</a></td>" + 
							"<td>" + this.reg_date + "</td>" + 
							"<td>" + this.up_date + "</td>" + 
							"<td>" + this.del_yn + "</td></tr>"; 
					str+= str2;
				}		
			);
			
			str += "</table>";

			$('#table1').html(str);
			alert('.ajax getListDept str->' + str);
		}
		
	});
	
	
}

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<div class="container mt-3">
		<h2>리뷰 글 관리</h2>
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
	    <div id="tab1" class="container tab-pane active">
	      <div id="table1">
	      <div>
	      <h3>기업리뷰</h3>
	      <table class="table table-striped table-bordered table-hover">
				<thead class="thead-dark">
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>기업명</th>
					<th>리뷰내용</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>삭제일</th>
				</tr>
				</thead>
	      <c:forEach var="rev" items="${revList}">
					<c:set var="content1" value="${rev.review }"/>
      		<tr>
					<td><c:out value="${rev.rnum }"/></td>
					<td><c:out value="${rev.id }"/></td>
					<td><c:out value="${rev.company }"/></td>
					<td><a href="ReviewView.do?rnum=${rev.rnum}"><c:out value="${ fn:substring(content1, 0, 30) }....."/></a></td>
					<td><c:out value="${rev.reg_date }"/></td>
					<td><c:out value="${rev.up_date }"/></td>
					<td>
							<c:choose>
							<c:when test="${rev.del_yn == 'y' }">
								<c:out value="${rev.del_date }"/>
							</c:when>
							<c:when test="${rev.del_yn == 'n' }">
								삭제되지 않음
							</c:when>
							</c:choose>
						</td>
				</tr>
				</c:forEach>
			</table>
	      </div>
	    </div>
	      <div>
				<ul class="pagination justify-content-center">
					<c:if test="${revPageMaker.prev }">
						<li class="paginate_button previous"><a class="page-link" href="${revPageMaker.startPage-1}">이전</a></li>					
					</c:if>
					
					<c:forEach var="num1" begin="${revPageMaker.startPage }" end="${revPageMaker.endPage }">
						<li class="paginate_button page-item ${revPageMaker.cri.pageNum == num1 ? "active" : " "}"><a class="page-link" onclick="getRevList(${num1 })">${num1 }</a></li>
					</c:forEach>
							
					<c:if test="${revPageMaker.next }">
						<li class="paginate_button next"><a class="page-link" href="${revPageMaker.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
	      </div>
	    <div id="tab2" class="container tab-pane fade"><br>
	      <h3>연봉</h3>
	      <table class="table table-striped table-bordered table-hover">
				<thead class="thead-dark">
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>기업명</th>
					<th>직위</th>
					<th>연봉</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>삭제일</th>
				</tr>
				</thead>
	      <c:forEach var="sall" items="${salList}">
      		<tr>
					<td><c:out value="${sall.rnum }"/></td>
					<td><c:out value="${sall.id }"/></td>
					<td><c:out value="${sall.company }"/></td>
					<td><c:out value="${sall.spot }"/></td>
					<td><c:out value="${sall.sal }"/></td>
					<td><c:out value="${sall.reg_date }"/></td>
					<td><c:out value="${sall.up_date }"/></td>
					<td>
							<c:choose>
							<c:when test="${sall.del_yn == 'y' }">
								<c:out value="${sall.del_date }"/>
							</c:when>
							<c:when test="${sall.del_yn == 'n' }">
								삭제되지 않음
							</c:when>
							</c:choose>
						</td>
				</tr>
				</c:forEach>
			</table>
				<ul class="pagination justify-content-center">
					<c:if test="${salPageMaker.prev }">
						<li class="paginate_button previous"><a class="page-link" href="${salPageMaker.startPage-1}">이전</a></li>					
					</c:if>
					
					<c:forEach var="num2" begin="${salPageMaker.startPage }" end="${salPageMaker.endPage }">
						<li class="paginate_button page-item ${salPageMaker.cri.pageNum == num2 ? "active" : " "}"><a class="page-link" href="tab2/${num2 }">${num2 }</a></li>
					</c:forEach>
							
					<c:if test="${salPageMaker.next }">
						<li class="paginate_button next"><a class="page-link" href="${salPageMaker.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
	    </div>
	    <div id="tab3" class="container tab-pane fade"><br>
	      <h3>면접후기</h3>
	      <table class="table table-striped table-bordered table-hover">
				<thead class="thead-dark">
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>기업명</th>
					<th>면접일자</th>
					<th>면접후기</th>
					<th>면접상태</th>
					<th>면접난이도</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>삭제일</th>
				</tr>
				</thead>
	      <c:forEach var="mrev" items="${mrevList}">
					<c:set var="content3" value="${mrev.mreview }"/>
      		<tr>
					<td><c:out value="${mrev.rnum }"/></td>
					<td><c:out value="${mrev.id }"/></td>
					<td><c:out value="${mrev.company }"/></td>
					<td><c:out value="${mrev.m_date }"/></td>
					<td><a href="ReviewView.do?rnum=${mrev.rnum}"><c:out value="${ fn:substring(content3, 0, 30) }....."/></a></td>
					<td><c:out value="${mrev.m_status }"/></td>
					<td><c:out value="${mrev.m_difficultly }"/></td>
					<td><c:out value="${mrev.reg_date }"/></td>
					<td><c:out value="${mrev.up_date }"/></td>
					<td>
							<c:choose>
							<c:when test="${mrev.del_yn == 'y' }">
								<c:out value="${mrev.del_date }"/>
							</c:when>
							<c:when test="${mrev.del_yn == 'n' }">
								삭제되지 않음
							</c:when>
							</c:choose>
						</td>
				</tr>
				</c:forEach>
			</table>	
				<ul class="pagination justify-content-center">
					<c:if test="${mrevPageMaker.prev }">
						<li class="paginate_button previous"><a class="page-link" href="${mrevPageMaker.startPage-1}">이전</a></li>					
					</c:if>
					
					<c:forEach var="num3" begin="${mrevPageMaker.startPage }" end="${mrevPageMaker.endPage }">
						<li class="paginate_button page-item ${mrevPageMaker.cri.pageNum == num3 ? "active" : " "}"><a class="page-link" href="tab3/${num3 }">${num3 }</a></li>
					</c:forEach>
							
					<c:if test="${mrevPageMaker.next }">
						<li class="paginate_button next"><a class="page-link" href="${mrevPageMaker.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
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



<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>