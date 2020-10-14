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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트 어썸 -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
		<div class="form-group">
			<label for="addr">주소</label>
				<input type="text" class="form-control" id="addr" name="addr" placeholder="주소를 입력하세요" required="required">
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
	</div>

	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>