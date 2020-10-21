<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>기업 회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<script type="text/javascript">
/* 사업자번호 중복체크 */
	function check(){
		if(document.frm.bsmno.value!="" && isNaN(document.frm.bsmno.value)){
			alert("숫자만 입력해 주세요.");
			document.frm.bsmno.value="";
			document.frm.bsmno.focus();
			return false;
		}
		if(document.frm.bsmno.value.length!=10){
			alert("사업자번호는 10자리 입니다.");
			document.frm.bsmno.value="";
			document.frm.bsmno.focus();
			return false;
		}
		$.ajax({
			url:'<%=context%>/bsm_no_check.do',
			type : 'POST',
			dataType : 'json',
			data : {"bsmno" : $("#bsmno").val()},
			success : function(data) {
				if (data == 1) {
					alert("중복된 사업자번호가 존재합니다.");
					document.frm.bsmno.value="";
					document.frm.bsmno.focus();
					return false;
				} else if (data == 0) {
					alert("사용가능한 사업자 번호입니다.");
				}
			},
			error : function() {

			}
		});
	}
	
	
/* 이메일 중복체크 */
function e_check(){
	if(document.frm.email.value==""){
		alert('이메일을 입력해주세요.');
		document.frm.email.value="";
		document.frm.email.focus();
		return false;
	}
	$.ajax({
		url:'<%=context%>/bsm_no_e_check.do',
		type : 'POST',
		dataType : 'json',
		data : {"email" : $("#email").val()},
		success : function(data) {
			if (data == 1) {
				alert("중복된 이메일이 존재합니다.");
				document.frm.email.value="";
				document.frm.email.focus();
				return false;
			} else if (data == 0) {
				alert("사용가능한 이메일입니다.");
			}
		},
		error : function() {

		}
	});

}

/* 전화번호 중복체크 */
function p_check(){
	if(document.frm.phone.value==""){
		alert('연락처를 입력해주세요.');
		document.frm.phone.value="";
		document.frm.phone.focus();
		return false;
	}
	$.ajax({
		url:'<%=context%>/bsm_no_p_check.do',
		type : 'POST',
		dataType : 'json',
		data : {"phone" : $("#phone").val()},
		success : function(data) {
			if (data == 1) {
				alert("중복된 연락처가 존재합니다.");
				document.frm.phone.value="";
				document.frm.phone.focus();
				return false;
			} else if (data == 0) {
				alert("사용가능한 연락처입니다.");
			}
		},
		error : function() {

		}
	});

}
 
 
	function joinBiz(){
		var bp=$('#b_pwcheck').text();
		var bp2=$('#b_pwcheck2').text();
		var f=document.frm;
		if(f.bsmno.value==""){
			alert('사업자번호를 입력해 주세요.');
			document.frm.bsmno.value="";
			document.frm.bsmno.focus();
			return false;
		}
		
		if(bp2=='비밀번호 형식이 일치하지 않습니다.'){
			alert('비밀번호 형식이 일치하지 않습니다.');
			document.frm.pass.value="";
			document.frm.pass.focus();
			return false;
		}
		
		if(bp=='비밀번호가 일치하지 않습니다.'){
			alert('비밀번호가 일치하지 않습니다.');
			document.frm.pass2.value="";
			document.frm.pass2.focus();
			return false;
		}
		
		if(f.pass.value==""){
			alert('비밀번호를 입력해 주세요.');
			document.frm.pass.value="";
			document.frm.pass.focus();
			return false;
		}
		if(f.pass2.value==""){
			alert('비밀번호 확인을 입력해 주세요.');
			document.frm.pass2.value="";
			document.frm.pass2.focus();
			return false;
		}
		if(f.company.value==""){
			alert('기업명을 입력해 주세요.');
			document.frm.company.value="";
			document.frm.company.focus();
			return false;
		}
		if(f.email.value==""){
			alert('이메일을 입력해 주세요.');
			document.frm.email.value="";
			document.frm.email.focus();
			return false;
		}
		if(f.ceo.value==""){
			alert('대표자를 입력해 주세요.');
			document.frm.ceo.value="";
			document.frm.ceo.focus();
			return false;
		}
		if(f.phone.value==""){
			alert('대표자 연락처를 입력해 주세요.');
			document.frm.phone.value="";
			document.frm.phone.focus();
			return false;
		}
		if(f.field.value==""){
			alert('업종을 입력해 주세요.');
			document.frm.field.value="";
			document.frm.field.focus();
			return false;
		}
		if(f.addr.value==""){
			alert('주소을 입력해 주세요.');
			document.frm.addr.value="";
			document.frm.addr.focus();
			return false;
		}
		if(f.file.value==""){
			alert('기업로고를 입력해 주세요.');
			document.frm.file.value="";
			document.frm.file.focus();
			return false;
		}
		
		
		
		document.frm.action="/user/biz/join/bizJoin.do";
		document.frm.submit();
		
	}
		/* 비밀번호 확인 */
		$(document).ready(function() {
			$('#pass').keyup(function() {
				$('b_pwcheck').text('');
			});
			$('#pass2').keyup(function() {
				if ($('#pass').val() != $('#pass2').val()) {

					$('#b_pwcheck').text('');
					$('#b_pwcheck').html("비밀번호가 일치하지 않습니다.");
				} else {
					$('#b_pwcheck').text('');
					$('#b_pwcheck').html("비밀번호가 일치합니다.");
				}
			});
		});
		
		/* 비밀번호 유효성 검사 */
	    function pwCheck(pass){
	    	$.ajax({
	    		type:'POST',
	    		url:'<%=context%>/bizPwCheck.do',
	    		data:{pass:pass},
	    		success:function(result){
	    			if(result==true){
	    				b_pwcheck2.innerHTML="비밀번호 사용가능합니다.";
	    			}else{
	    				b_pwcheck2.innerHTML="비밀번호 형식이 일치하지 않습니다.";
	    			}
	    		},
	    		error:function(request,status){
	    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}
	    	});
	    }
		
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

 <div class="container" style="margin-top:30px">
	<form method="post" name="frm" enctype="multipart/form-data">
		<h3 style="font-weight: bold;"><i class="fas fa-file-signature"></i> 기업 회원가입</h3>
		<br><br>
		<div class="form-group" >
			<label for="bsmno">사업자 번호 (사업자 번호를 입력해주세요)</label>
				<input type="text" class="form-control" id="bsmno" name="bsmno" placeholder="사업자 번호를 입력하세요" maxlength="10" required="required">
		</div>
		<div class="form-group">
			<button class="btn btn-warning" id="b_check" type="button" onclick="check();">
			 중복체크</button>
		</div>
		<div class="form-group">
			<label for="pass">비밀번호 (영문자, 숫자, 특수기호 사용한 6~18자리로 작성해주세요)</label>
				<input type="password" class="form-control" id="pass" name="pass" oninput="pwCheck(pass.value)" maxlength="18" placeholder="비밀번호를 입력하세요" required="required">
				<p id="b_pwcheck2" style="color: #FF6600; margin: 0; font-weight: bold"></p>
		</div>
		<div class="form-group">
			<label for="pass2">비밀번호 확인</label>
				<input type="password" class="form-control" id="pass2" name="pass2" maxlength="18" placeholder="비밀번호를 다시 입력하세요" required="required">
				<p id="b_pwcheck" style="color: #FF6600; margin: 0; font-weight: bold"></p>

		</div>
		<div class="form-group">
			<label for="company">기업명</label>
				<input type="text" class="form-control" id="company" name="company" placeholder="기업명을 입력하세요" required="required">
		</div> 
		<div class="form-group">
			<label for="email">이메일</label>
				<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required="required">
		</div> 
		<div class="form-group">
			<input type="button" value="중복체크" onclick="e_check();" class="btn btn-warning"/>
		</div>
		<div class="form-group">
			<label for="ceo">대표자</label>
				<input type="text" class="form-control" id="ceo" name="ceo" placeholder="대표자를 입력하세요" required="required">
		</div> 
		<div class="form-group">
			<label for="phone">대표자 연락처 ('-'를 포함한 연락처를 입력해주세요)</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="대표자 연락처를 입력하세요" required="required">
		</div> 
		<div class="form-group">
			<input type="button" value="중복체크" onclick="p_check();" class="btn btn-warning"/>
		</div>
		<div class="form-group">
			<label for="field">업종</label>
				<select class="form-control" name="field" id="field" required="required">
					<option value="">업종을 선택하세요.</option>
			     	<option value="it">IT/인터넷</option>
			     	<option value="management">경영/기획/컨설팅</option>
			     	<option value="education">교육</option>
			     	<option value="finance">금융/재무</option>
			     	<option value="design">디자인</option>
			     	<option value="marketing">마케팅/시장조사</option>
			     	<option value="media">미디어/홍보</option>
			     	<option value="production">생산/제조</option>
                </select>
		</div>
		<!-- <div class="form-group">
			<label for="addr">주소</label>
				<input type="text" class="form-control" id="addr" name="addr" placeholder="주소를 입력하세요" required="required">
		</div> -->
		
		
		<label for="addr">주소</label>
		<div class="form-group">
			<input class="form-control" style="width: 40%; display: inline;"
				placeholder="우편번호" name="addr1" id="addr1" type="text"
				readonly="readonly">
			<button type="button" class="btn btn-default"
				onclick="execPostCode();">
				<i class="fa fa-search"></i> 우편번호 찾기
			</button>
		</div>
		<div class="form-group">
			<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
				name="addr" id="addr" type="text" readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" placeholder="상세주소" name="addr3"
				id="addr3" type="text"  required="required" />
		</div>
		
		
		
		
		<div class="form-group">
			<label for="file">기업 로고</label>
				<input type="file" class="form-control" id="file" name="file" placeholder="기업 로고를 넣으세요." required="required">
		</div> 
		<div class="reg_button">
				<a class="btn btn-danger px-3" href="/user/main/main.do">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>&emsp;&emsp;
				<button class="btn btn-primary px-3" id="reg_submit" onclick="joinBiz();">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
	

	</form>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
	</div>

</body>
</html>