<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top: 30px">
	<div class="container mt-3">
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h2 class="display-4">개인 회원 정보 관리</h2>
    <p class="lead">이 곳은 개인 회원 정보 관리하는 공간입니다.</p>
  </div>
</div>
    <div class="row">
    	<div class="col-sm-9"></div>
    	<div class="col-sm-3">
		<button id="regBtn" class="btn btn-secondary" style="float: right">개인 회원 임의 등록</button>
    	</div>
    	<div class="col-sm-12"><p></div>
    	</div>
			<table class="table table-striped table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>회원번호</th>
						<th>ID</th>
						<th>회원명</th>
						<th>이메일</th>
						<th>생일</th>
						<th>경력</th>
						<th>등록일</th>
						<th>활동 회원 여부</th>
					</tr>
				</thead>
				<c:forEach items="${list }" var="member">
					<tr>
						<td><c:out value="${member.mnum }"/></td>
						<td>
							<a class="move" href='<c:out value="${ member.mnum}"/>'>
								<c:out value="${member.id }"/>	
							</a>
						</td>
						<td><c:out value="${member.name }"/></td>
						<td><c:out value="${member.email }"/></td>
						<td><c:out value="${member.birthday }"/></td>
						<td><c:out value="${member.career }"/></td>
						<td> 
							<c:set var="regdate" value="${member.reg_date }"/>
							<c:out value="${ regdate.substring(0,10) }"/>
						</td>
						<td>
							<c:choose>
							<c:when test="${member.del_yn == 'N' }">
								활동 회원
							</c:when>
							<c:when test="${member.del_yn == 'Y' }">
								삭제된 회원
							</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="row">
			<div class="col-lg-3"></div>
				<div class="col-lg-6">
				<form id="searchForm" action="/mng/member/memSelectList.do" method="get">
					<div class="input-group mb-3" style="align-self: center;">
					<div>
					<select name="type" class="form-control custom-select">
						<option value="">--</option>
						<option value="I">ID명</option>
						<option value="N">회원명</option>
					</select>
					</div>
					<div>
					<input type="text" name="keyword" class="form-control"/>
					</div>
					<div>
					<button id="query" class="btn btn-dark">조회</button>
					<button id="searchreset" class="btn btn-dark">초기화</button>
					</div>
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				</div>
					</form>
				</div>
				<div class="col-lg-3"></div>
			</div>
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a class="page-link" href="${pageMaker.startPage-1}">이전</a></li>					
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active" : " "}"><a class="page-link" href="${num }">${num }</a></li>
					</c:forEach>
							
					<c:if test="${pageMaker.next }">
						<li class="paginate_button next"><a class="page-link" href="${pageMaker.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
				<form id="actionForm" action="/mng/member/memSelectList.do" method="get">
					<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum }'/>">				
					<input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount }'/>">
 					<input type="hidden" name="type" value="<c:out value='${ pageMaker.cri.type}'/>"/>			
					<input type="hidden" name="keyword" value="<c:out value='${ pageMaker.cri.keyword}'/>"/>
				</form>
			</div>
			<!-- end Pagination -->
			</div>
			<!-- Modal 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header bg-primary text-white">
							<h4 class="modal-title" id="myModalLabel">처리 결과</h4>
							<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
					<!--  /.modal-content -->
				</div>
				<!--  /.modal-dialog -->
			</div>
			<!--  /.modal -->
		</div>
		<!--  end panel-body -->
<script type="text/javascript">

$(document).ready(function(){

	var result = '<c:out value="${result}"/>'
	

	checkModal(result);

	history.replaceState({}, null, null);
	
	function checkModal(result) {
	
		if (result === '' || history.state) {
			return;
		}
	
		if (parseInt(result) > 0) {
			$(".modal-body").html("회원번호 " + parseInt(result) + "번이 등록되었습니다.");
		
		}
	
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function(){
		self.location ='/mng/member/memInsertForm.do';
	});
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		
		e.preventDefault();
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e) {
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='mnum' value='"+
				$(this).attr("href")+"'>");
		actionForm.attr("action", "/mng/member/memView.do");
		actionForm.submit();
		
	})
	
	var searchForm = $("#searchForm");
	
	$("#query").on("click", function(e) {
		if (!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	})
	
	$("#searchreset").on("click", function(e) {
		
		self.location ='/mng/member/memSelectList.do';
		
	})

});

</script>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>