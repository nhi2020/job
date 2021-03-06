<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<title>개인 회원가입</title>
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
/* 아이디 중복체크 */
function check(){
	if(document.frm.id.value!=""){
	$.ajax({
		url:'/m_check.do',
		type : 'POST',
		dataType : 'json',
		data : {"id" : $("#id").val()},
		success : function(data) {
				if (data == 1) {
					alert("중복된 아이디가 존재합니다.");
					document.frm.id.value="";
				} else if (data == 0) {
					alert("사용가능한 아이디입니다.");
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
		url:'/e_check.do',
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
		alert('전화번호를 입력해주세요.');
		document.frm.phone.value="";
		document.frm.phone.focus();
		return false;
	}
	$.ajax({
		url:'/p_check.do',
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
			}
		},
		error : function() {

		}
	});

}

	function joinMem() {
		var f=document.frm;
		if(f.id.value==""){
			alert('아이디를 입력해 주세요.');
			document.frm.id.value="";
			document.frm.id.focus();
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
		if(f.phone.value==""){
			alert('전화번호를 입력해 주세요.');
			document.frm.phone.value="";
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
		
		document.frm.action="/mng/member/memMngInsert.do";
		document.frm.submit();
	}
	
	</script>


 <div class="container" style="margin-top:30px">
	<form method="post" name="frm" enctype="multipart/form-data">
		<h3 style="font-weight: bold;"><i class="fas fa-file-signature"></i> 개인 회원 임의 추가</h3>
		<br><br>
		<div class="form-group" >
			<label for="id">아이디</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required="required">
		</div>
		<div class="form-group">
			<button class="btn btn-warning" id="m_check" type="button" onclick="check();">
			 중복체크</button>
		</div>
			관리자가 임의로 회원을 추가시 비밀번호는 일괄적으로 'abcd1234!'입니다.
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
			<label for="file">이미지</label>
				<input type="file" class="form-control" id="file" name="file" placeholder="내 이미지를 넣으세요." required="required">
		</div> 
		<div class="reg_button">
				<a class="btn btn-danger px-3" href="/mng/member/memSelectList.do">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>&emsp;&emsp;
				<button class="btn btn-primary px-3" id="reg_submit" onclick="joinMem();">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
	</form>
	</div>

	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>	
</body>
</html>