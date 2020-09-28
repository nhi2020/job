<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<%@ include file="../../../inc/top.jsp" %>
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
<%@ include file="../../../inc/header.jsp" %>
<script type="text/javascript">
/* 사업자번호 중복체크 */
function check(){
	$.ajax({
		url:'<%=context%>/bsm_no_check.do',
		type : 'POST',
		dataType : 'json',
		data : {"bsm_no" : $("#bsm_no").val()},
		success : function(data) {
				if (data == 1) {
					alert("중복된 사업자번호가 존재합니다.");
				} else if (data == 0) {
					$("#bsm_no").attr("value", "Y");
					alert("사용하실 수 있는 사업자 번호입니다.");
				}
			},
			error : function() {

			}
		});

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
	</script>


 <div class="container" style="margin-top:30px">
	<form method="post" action="bizlogin.do" >
		<h3 style="font-weight: bold;">기업 회원가입</h3>
		<br><br>
		<div class="form-group" >
			<label for="bsm_no">사업자 번호 ('-'를 포함한 사업자 번호를 입력해주세요)</label>
				<input type="text" class="form-control" id="bsm_no" name="bsm_no" placeholder="사업자 번호를 입력하세요" maxlength="12" required="required">
		</div>
		<div class="form-group">
			<button class="btn btn-warning" id="b_check" type="button" onclick="check();">
			<i class="far fa-check-circle" aria-hidden="true"></i> 중복체크</button>
		</div>
		<div class="form-group">
			<label for="pass">비밀번호</label>
				<input type="password" class="form-control" id="pass" name="pass" oninput="pass.value" placeholder="비밀번호를 입력하세요" required="required">
		</div>
		<div class="form-group">
			<label for="pass2">비밀번호 확인</label>
				<input type="password" class="form-control" id="pass2" name="pass2" placeholder="비밀번호를 다시 입력하세요" required="required">
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
			<label for="ceo">대표자</label>
				<input type="text" class="form-control" id="ceo" name="ceo" placeholder="대표자를 입력하세요" required="required">
		</div> 
		<div class="form-group">
			<label for="phone">대표자 연락처 ('-'를 포함한 연락처를 입력해주세요)</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="대표자 연락처를 입력하세요" required="required">
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