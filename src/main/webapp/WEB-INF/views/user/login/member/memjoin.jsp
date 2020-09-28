<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<%@ include file="../../../inc/top.jsp" %>
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
<%@ include file="../../../inc/header.jsp" %>
<script type="text/javascript">
/* 아이디 중복체크 */
function check(){
	$.ajax({
		url:'<%=context%>/m_check.do',
		type : 'POST',
		dataType : 'json',
		data : {"id" : $("#id").val()},
		success : function(data) {
				if (data == 1) {
					alert("중복된 아이디가 존재합니다.");
				} else if (data == 0) {
					$("#id").attr("value", "Y");
					alert("사용하실 수 있는 아이디입니다.");
				}
			},
			error : function() {

			}
		});

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
		
		
		function chkPW(){

			 var pw = $("#pass").val();
			 var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			 if(pw.length < 8 || pw.length > 20){
				 $('m_pwcheck2').text('');
				 $('m_pwcheck2').html("8자리 ~ 20자리 이내로 입력해주세요.");
				 
			  /* alert("8자리 ~ 20자리 이내로 입력해주세요."); */
			  return false;
			 }else if(pw.search(/\s/) != -1){
			  alert("비밀번호는 공백 없이 입력해주세요.");
			  return false;
			 }else if(num < 0 || eng < 0 || spe < 0 ){
			  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			  return false;
			 }else {
				console.log("통과"); 
			    return true;
			 }

			}
		

	</script>


 <div class="container" style="margin-top:30px">
	<form method="post" action="memlogin.do" >
		<h3 style="font-weight: bold;">개인 회원가입</h3>
		<br><br>
		<div class="form-group" >
			<label for="id">아이디</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required="required">
		</div>
		<div class="form-group">
			<button class="btn btn-warning" id="m_check" type="button" onclick="check();">
			<i class="far fa-check-circle" aria-hidden="true"></i> 중복체크</button>
		</div>
		<div class="form-group">
			<label for="pass">비밀번호</label>
				<input type="password" class="form-control" id="pass" name="pass" oninput="pass.value" placeholder="비밀번호를 입력하세요" required="required" onclick="chkPW();">
				<p id="m_pwcheck2" style="color: #FF6600; margin: 0; font-weight: bold"></p>
		</div>
		<div class="form-group">
			<label for="pass2">비밀번호 확인</label>
				<input type="password" class="form-control" id="pass2" name="pass2" placeholder="비밀번호를 다시 입력하세요" required="required">
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
			<label for="phone">전화번호 ('-'를 포함한 연락처를 입력해주세요)</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" required="required">
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
               <option value="20년 이상">20년 이상</option>
            </select>
			
		</div>
		<div class="reg_button">
				<a class="btn btn-danger px-3" href="javascript:location.href=history.back();">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>&emsp;&emsp;
				<button class="btn btn-primary px-3" id="reg_submit">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
	</form>
	</div>

	<%@ include file="../../../inc/footer.jsp" %>	
</body>
</html>