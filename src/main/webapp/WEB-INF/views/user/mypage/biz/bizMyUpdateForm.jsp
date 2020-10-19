<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>업데이트</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트 어썸 -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<h2>기업정보 상세</h2>
	<form action="/user/mypage/biz/bizMyUpdate.do" method="post"
		id="upForm" enctype="multipart/form-data">
		<input type="hidden" name="bsmno" value="${sessionScope.b_user.bsmno}">
		<input type="hidden" name="pass" value="${sessionScope.b_user.pass}">
		<c:if
			test="${sessionScope.b_user.storedfilename ne '' and not empty sessionScope.b_user.storedfilename}">
			<img
				src="/resources/images/upload/biz/${sessionScope.b_user.storedfilename}"
				class="img-fluid" width="30%" height="30%" />
		</c:if>
		<table border="1" width="400">

			<tr>
				<th>사업자번호</th>
				<td>${sessionScope.b_user.bsmno}</td>
			</tr>

			<tr>
				<th><i class="fas fa-star-of-life" style="color: red;"></i>기업명</th>
				<td><input type="text" name="company" id="company"
					required="required" value="${sessionScope.b_user.company }"></td>
			</tr>

			<tr>
				<th><i class="fas fa-star-of-life" style="color: red;"></i>이메일</th>
				<td><input type="text" name="email" id="email"
					required="required" value="${sessionScope.b_user.email }"></td>
			</tr>

			<tr>
				<th><i class="fas fa-star-of-life" style="color: red;"></i>대표자</th>
				<td><input type="text" name="ceo" id="ceo" required="required"
					value="${sessionScope.b_user.ceo }"></td>
			</tr>
			<tr>
				<th><i class="fas fa-star-of-life" style="color: red;"></i>대표자연락처</th>
				<td><input type="text" name="phone" id="phone"
					required="required" value="${sessionScope.b_user.phone }"></td>
			<tr>
				<th><i class="fas fa-star-of-life" style="color: red;"></i>업종</th>
				<td><select class="form-control" name="field" id="field"
					required="required">
						<option value=""
							${sessionScope.b_user.field eq ''? "selected='selected'":""}>업종을 선택하세요.</option>
						<option value="it"
							${sessionScope.b_user.field eq 'it'? "selected='selected'":""}>IT/인터넷</option>
						<option value="management"
							${sessionScope.b_user.field eq 'management'? "selected='selected'":""}>경영/기획/컨설팅</option>
						<option value="education"
							${sessionScope.b_user.field eq 'education'? "selected='selected'":""}>교육</option>
						<option value="finance"
							${sessionScope.b_user.field eq 'finance'? "selected='selected'":""}>금융/재무</option>
						<option value="design"
							${sessionScope.b_user.field eq 'design'? "selected='selected'":""}>디자인</option>
						<option value="marketing"
							${sessionScope.b_user.field eq 'marketing'? "selected='selected'":""}>마케팅/시장조사</option>
						<option value="media"
							${sessionScope.b_user.field eq 'media'? "selected='selected'":""}>미디어/홍보</option>
						<option value="production"
							${sessionScope.b_user.field eq 'production'? "selected='selected'":""}>생산/제조</option>
				</select></td>
			</tr>
			<!--  <tr>
				<th><i class="fas fa-star-of-life" style="color: red;"></i>주소</th>
				<td><input type="text" name="addr" id="addr"
					required="required" value="${sessionScope.b_user.addr }"></td>
			</tr>-->


			<tr>
				<td colspan="2"><input type="submit" id="submit" value="확인"></td>
			</tr>
		</table>



		<div class="form-group">
			<input class="form-control" style="width: 40%; display: inline;"
				placeholder="우편번호" name="addr1" id="addr1" type="text"
				readonly="readonly"  value="${sessionScope.b_user.addr1 }">
			<button type="button" class="btn btn-default"
				onclick="execPostCode();">
				<i class="fa fa-search"></i> 우편번호 찾기
			</button>
		</div>
		<div class="form-group">
			<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
				name="addr" id="addr" type="text" readonly="readonly" value="${sessionScope.b_user.addr }"/>
		</div>
		<div class="form-group">
			<input class="form-control" placeholder="상세주소" name="addr3"
				id="addr3" type="text" value="${sessionScope.b_user.addr3 }" />
		</div>



		<c:choose>
			<c:when
				test="${sessionScope.b_user.originalfilename eq '' or sessionScope.b_user.originalfilename == null}">
				<div class="form-group">
					<label for="image"><i class="fas fa-star-of-life"
						style="color: red;"></i>사진 업로드</label> <input type="file"
						class="form-control" id="file" name="file" placeholder="이름을 입력하세요">
				</div>
			</c:when>
			<c:otherwise>
				<div class="form-group">
					${sessionScope.b_user.originalfilename} <a
						href="/user/mypage/biz/myImageDel.do?storedfilename=${sessionScope.b_user.storedfilename}&filesize=${sessionScope.b_user.filesize}&attachid=${sessionScope.b_user.attachid}">삭제</a>
				</div>
			</c:otherwise>
		</c:choose>
	</form>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>