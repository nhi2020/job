<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>관리자 : 기업 정보 수정</title>
</head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
</head>
<script type="text/javascript">
function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }
</script>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container" style="margin-top:30px">
	<h2>기업정보 수정 : ${biz.company}</h2>
	<form action="/mng/biz/bizMngUpdate.do" method="post"
		id="upForm" enctype="multipart/form-data">
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
		<input type='hidden' name='attachid' value='<c:out value="${biz.attachid }"/>'>
		<input type='hidden' name='bnum' value='<c:out value="${biz.bnum }"/>'>
<div class="row">
<div class="col-lg-1"></div>
 <div class="card w-75 col-lg-10">
   <div class="card-header">
    <h4 class="card-text">${biz.company }</h4>
  </div>
  <div class="row">
  <div class="col-lg-3"></div>
  <div class="col-lg-6">
  	<c:if test="${image.storedfilename ne '' and not empty image.storedfilename}">
		<img src="/resources/images/upload/biz/${image.storedfilename}" class="card-img-top" alt="회사로고" />
	</c:if>
	</div>
	  <div class="col-lg-3"></div>
  </div>
  <div class="card-body">
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">사업자 번호</p></div>
    <div class="col-sm-9"> <input class="form-control" name='bsmno'
            value='<c:out value="${biz.bsmno }"/>' readonly="readonly"> </div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"><p class="card-text">기업명</p></div>
    <div class="col-sm-9"> <input class="form-control" type="text" name="company" id="company"
					required="required" value="${biz.company }"> </div>
	</div>
		<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">이메일</p></div>
    <div class="col-sm-9"> <input class="form-control" type="text" name="email" id="email"
					required="required" value="${biz.email }"></div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">대표자</p></div>
    <div class="col-sm-9"><input class="form-control" type="text" name="ceo" id="ceo" required="required"
					value="${biz.ceo }"></div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">대표연락처</p></div>
    <div class="col-sm-9"> <input class="form-control" type="text" name="phone" id="phone"
					required="required" value="${biz.phone }"></div>
	</div>
	<div class="form-group row">
	<div class="col-sm-3 col-form-label"> <p class="card-text">업종</p></div>
    <div class="col-sm-9">
    	<select class="custom-select" name="field" id="field"
					required="required">
						<option value=""
							${biz.field eq ''? "selected='selected'":""}>업종을 선택하세요.</option>
						<option value="it"
							${biz.field eq 'it'? "selected='selected'":""}>IT/인터넷</option>
						<option value="management"
							${biz.field eq 'management'? "selected='selected'":""}>경영/기획/컨설팅</option>
						<option value="education"
							${biz.field eq 'education'? "selected='selected'":""}>교육</option>
						<option value="finance"
							${biz.field eq 'finance'? "selected='selected'":""}>금융/재무</option>
						<option value="design"
							${biz.field eq 'design'? "selected='selected'":""}>디자인</option>
						<option value="marketing"
							${biz.field eq 'marketing'? "selected='selected'":""}>마케팅/시장조사</option>
						<option value="media"
							${biz.field eq 'media'? "selected='selected'":""}>미디어/홍보</option>
						<option value="production"
							${biz.field eq 'production'? "selected='selected'":""}>생산/제조</option>
				</select></div>
	</div>
	<div class="form-group row">
			<div class="col-sm-3 col-form-label"> 회사 주소</div>
			<div class="col-sm-9">
			<input class="form-control" style="width: 40%; display: inline;"
				placeholder="우편번호" name="addr1" id="addr1" type="text"
				readonly="readonly"  value="${biz.addr1 }">
			<button type="button" class="btn btn-success"
				onclick="execPostCode();">
				<i class="fa fa-search"></i> 우편번호 찾기
			</button>
			<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
				name="addr" id="addr" type="text" readonly="readonly" value="${biz.addr }"/>
			<input class="form-control" placeholder="상세주소" name="addr3"
				id="addr3" type="text" value="${biz.addr3 }" />
		</div>
	</div>
				<c:choose>
			<c:when
				test="${image.originalfilename eq '' or image.originalfilename == null}">
				<div class="form-group row">
						<div class="col-sm-3 col-form-label">
					<label for="image"><i class="fas fa-star-of-life" style="color: red;"></i>사진 업로드</label> 
						</div>
				<div class="col-sm-9">
					<input type="file" class="form-control" id="file" name="file">
				</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="form-group row">
					<div class="col-sm-3 col-form-label">현재 기업 대표 사진</div>
					<div class="col-sm-9 card-text form-control">
					${image.originalfilename} 
				</div>
				</div>
			</c:otherwise>
		</c:choose>
	<br>
	
	<div class="text-center">
 		 <button type="submit" data-oper='modify' class="btn btn-secondary">수정</button>
 		 <a href="/mng/biz/ImageDel.do?storedfilename=${image.storedfilename}&filesize=${image.filesize}&attachid=${image.attachid}" class="btn btn-warning">이미지 삭제</a>
  		<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
 		 <button type="submit" data-oper='list' class="btn btn-primary">목록</button>
	</div>

</div>
</div>
<!-- .card -->
<div class="col-lg-1"></div>
</div>
<!-- .row -->
<!-- .text-center -->
				
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	var formObj = $("#upForm");
	$('button').on("click", function(e){
	
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/mng/biz/remove.do");
		} else if (operation === 'list') {
			formObj.attr("action", "/mng/biz/bizSelectList.do").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		formObj.submit();
	});
});
</script>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>