<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>개인 회원가입</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<script type="text/javascript">
/* 아이디 중복체크 */
function check(){
	if(document.frm.id.value!=""){
	$.ajax({
		url:'<%=context%>/m_check.do',
		type : 'POST',
		dataType : 'json',
		data : {"id" : $("#id").val()},
		success : function(data) {
				if (data == 1) {
					alert("중복된 아이디가 존재합니다.");
					document.frm.id.value="";
					document.frm.id.focus();
					return false;
				} else if (data == 0) {
					alert("사용가능한 아이디입니다.");
					document.frm.idChk.value="Y";
				}
			},
			error : function() {

			}
		});

	}
	else{
		alert("아이디를 입력해주세요.")
	}
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
		url:'<%=context%>/e_check.do',
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
				document.frm.emailChk.value="Y";
			}
		},
		error : function() {

		}
	});

}

/* 전화번호 중복체크 */
function p_check(){
	if(document.frm.phone.value==""){
		alert('전화번호를 입력해주세요.');
		document.frm.phone.value="";
		document.frm.phone.focus();
		return false;
	}
	$.ajax({
		url:'<%=context%>/p_check.do',
		type : 'POST',
		dataType : 'json',
		data : {"phone" : $("#phone").val()},
		success : function(data) {
			if (data == 1) {
				alert("중복된 전화번호가 존재합니다.");
				document.frm.phone.value="";
				document.frm.phone.focus();
				return false;
			} else if (data == 0) {
				alert("사용가능한 전화번호입니다.");
				document.frm.phoneChk.value="Y";
			}
		},
		error : function() {

		}
	});

}

	function joinMem() {
		var mp=$('#m_pwcheck').text();
		var mp2=$('#m_pwcheck2').text();
		var f=document.frm;
		if(f.id.value==""){
			alert('아이디를 입력해 주세요.');
			document.frm.id.value="";
			document.frm.id.focus();
			return false;
		}
		if(f.idChk.value==''){
			alert('아이디 체크를 해주세요.');
			document.frm.id.focus();
			return false;
		}
		if(mp2=='비밀번호 형식이 일치하지 않습니다.'){
			alert('비밀번호 형식이 일치하지 않습니다.');
			document.frm.pass.value="";
			document.frm.pass.focus();
			return false;
		}
		if(mp=='비밀번호가 일치하지 않습니다.'){
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
		if(f.name.value==""){
			alert('이름을 입력해 주세요.');
			document.frm.name.value="";
			document.frm.name.focus();
			return false;
		}
		if(f.gender.value==""){
			alert('성별을 입력해 주세요.');
			document.frm.gender.value="";
			document.frm.gender.focus();
			return false;
		}
		if(f.email.value==""){
			alert('이메일을 입력해 주세요.');
			document.frm.email.value="";
			document.frm.email.focus();
			return false;
		}
		
		if(f.emailChk.value==''){
			alert('이메일 체크를 해주세요.');
			document.frm.email.focus();
			return false;
		}
		
		if(f.phone.value==""){
			alert('전화번호를 입력해 주세요.');
			document.frm.phone.value="";
			document.frm.phone.focus();
			return false;
		}
		
		if(f.phoneChk.value==''){
			alert('전화번호 체크를 해주세요.');
			document.frm.phone.focus();
			return false;
		}
		
		if(f.birthday.value==""){
			alert('생년월일을 입력해 주세요.');
			document.frm.birthday.value="";
			document.frm.birthday.focus();
			return false;
		}
		if(f.career.value==""){
			alert('총 경력을 입력해 주세요.');
			document.frm.career.value="";
			document.frm.career.focus();
			return false;
		}
		if(f.file.value==""){
			alert('내 이미지를 입력해 주세요.');
			document.frm.file.value="";
			document.frm.file.focus();
			return false;
		}
		
		document.frm.action="/user/member/join/memJoin.do";
		document.frm.submit();
	}
	

		/* 비밀번호 확인 */
		$(document).ready(function() {
			$('#pass').keyup(function() {
				$('m_pwcheck').text('');
			});
			$('#pass2').keyup(function() {
				if ($('#pass').val() != $('#pass2').val()) {

					$('#m_pwcheck').text('');
					$('#m_pwcheck').html("비밀번호가 일치하지 않습니다.");
				} else {
					$('#m_pwcheck').text('');
					$('#m_pwcheck').html("비밀번호가 일치합니다.");
				}
			});
		});
		
	    /* 비밀번호 유효성 검사 */
	    function pwCheck(pass){
	    	$.ajax({
	    		type:'POST',
	    		url:'<%=context%>/memPwCheck.do',
	    		data:{pass:pass},
	    		success:function(result){
	    			if(result==true){
	    				m_pwcheck2.innerHTML="비밀번호 사용가능합니다.";
	    			}else{
	    				m_pwcheck2.innerHTML="비밀번호 형식이 일치하지 않습니다.";
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
		<input type="hidden" name="emailChk" value="">
		<input type="hidden" name="phoneChk" value="">
		<input type="hidden" name="idChk" value="">
		<h3 style="font-weight: bold;"><i class="fas fa-file-signature"></i> 개인 회원가입</h3>
		<br><br>
		<div class="form-group" >
			<label for="id">아이디</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required="required">
		</div>
		<div class="form-group">
			<button class="btn btn-warning" id="m_check" type="button" onclick="check();">
			 중복체크</button>
		</div>
		<div class="form-group">
			<label for="pass">비밀번호 (영문자, 숫자, 특수기호 사용한 6~18자리로 작성해주세요)</label>
				<input type="password" class="form-control" id="pass" name="pass" oninput="pwCheck(pass.value)" maxlength="18" placeholder="비밀번호를 입력하세요" required="required" >
				<p id="m_pwcheck2" style="color: #FF6600; margin: 0; font-weight: bold"></p>
		</div>
		<div class="form-group">
			<label for="pass2">비밀번호 확인</label>
				<input type="password" class="form-control" id="pass2" name="pass2" maxlength="18" placeholder="비밀번호를 다시 입력하세요" required="required">
				<p id="m_pwcheck" style="color: #FF6600; margin: 0; font-weight: bold"></p>

		</div>
		<div class="form-group">
			<label for="name">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" required="required">
		</div> 
		<div class="form-group">
		    <label for="gender">성별</label><br>
		    <label class="radio-inline">
                <input type="radio" name="gender" id="gender" value="1" required="required"> 남
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender" id="gender" value="2" required="required"> 여
            </label>
		</div> 
		<div class="form-group">
			<label for="email">이메일</label>
				<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required="required">
		</div> 
		<div class="form-group">
			<input type="button" value="중복체크" onclick="e_check();" class="btn btn-warning"/>
		</div>
		
		<div class="form-group">
			<label for="phone">전화번호 ('-'를 포함한 연락처를 입력해주세요)</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" required="required">
		</div> 
		<div class="form-group">
			<input type="button" value="중복체크" onclick="p_check();" class="btn btn-warning"/>
		</div>
			<div class="form-group">
			<label for="birthday">생년월일</label>
				<input type="date" class="form-control" id="birthday" name="birthday" required="required" >
		</div> 
		<div class="form-group">
			<label for="career">총 경력</label>
			<select  class="form-control" id="career" name="career" required="required">
               <option value="">총 경력을 선택하세요.</option>
               <option value="신입">신입</option>
               <%for(int i=1; i<=20; i++){ %>
               <option value="<%=i+"년"%>"><%=i+"년"%></option>
               <% } %>
               <option value="21년 이상">21년 이상</option>
            </select>
			
		</div>
		<div class="form-group">
			<label for="file">내 이미지</label>
				<input type="file" class="form-control" id="file" name="file" placeholder="내 이미지를 넣으세요." required="required">
		</div> 
		<div class="reg_button text-center">
				<a class="btn btn-danger px-3" href="/user/main/main.do">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>&emsp;&emsp;
				<a class="btn btn-primary px-3" id="reg_submit" onclick="joinMem();">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</a>
		</div>
	</form>
	</div>

	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>