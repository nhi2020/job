<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>기업 비밀번호변경</title>

</head>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<script type="text/javascript">
	function joinMem() {
		var bp = $('#m_pwcheck').text();
		var bp2 = $('#m_pwcheck2').text();
		if (bp2 == '비밀번호 형식이 일치하지 않습니다.') {
			alert('비밀번호 형식이 일치하지 않습니다.');
			document.passForm.bpchange.value = "";
			document.passForm.bpchange.focus();
			return false;
		}

		if (bp == '비밀번호가 일치하지 않습니다.') {
			alert('비밀번호가 일치하지 않습니다.');
			document.passForm.bpchange1.value = "";
			document.passForm.bpchange1.focus();
			return false;
		}

		document.passForm.action = "/user/mypage/biz/bizMyUpdatePassChng.do";
		document.passForm.submit();

	}
	/* 비밀번호 확인 */
	$(document).ready(function() {
		$('#bpchange').keyup(function() {
			$('m_pwcheck').text('');
		});
		$('#bpchange1').keyup(function() {
			if ($('#bpchange').val() != $('#bpchange1').val()) {
				$('#m_pwcheck').text('');
				$('#m_pwcheck').html("비밀번호가 일치하지 않습니다.");
			} else {
				$('#m_pwcheck').text('');
				$('#m_pwcheck').html("비밀번호가 일치합니다.");
			}
		});
	});

	/* 비밀번호 유효성 검사 */
	function pwCheck1(pass) {
		$.ajax({
			type : 'POST',
			url : '/bizPassChk.do',
			data : {
				pass : pass
			},
			success : function(result) {
				if (result == true) {
					m_pwcheck2.innerHTML = "비밀번호 사용가능합니다.";
				} else {
					m_pwcheck2.innerHTML = "비밀번호 형식이 일치하지 않습니다.";
				}
			},
			error : function(request, status) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
</script>
<body>
	<div class="container" style="margin-top: 30px">
		<h3 style="font-weight: bold;">
			<i class="fab fa-expeditedssl"></i> 비밀번호 변경
		</h3>
		<br>
		<br>
		<form action="/user/mypage/biz/bizMyPassForm.do" name="passForm"
			id="passForm" method="post">
			<input type="hidden" name="bsmno" id="bsmno"
				value="${sessionScope.b_user.bsmno}">

			<div class="form-group has-feedback">
				<label class="control-label" for="pass">현재비밀번호</label> <input
					class="form-control" type="password" name="pass" id="pass"
					placeholder="현재 비밀번호를 입력하세요" required="required" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="bpchange">변경 비밀번호</label> <input
					class="form-control" type="password" name="bpchange" id="bpchange"
					oninput="pwCheck1(this.value)" maxlength="18"
					placeholder="변경 비밀번호를 입력하세요 . (영문,숫자,특수기호 포함 6~18자리)"
					required="required" />
				<p id="m_pwcheck2"
					style="color: #FF6600; margin: 0; font-weight: bold"></p>
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="bpchange1">비밀번호 확인</label> <input
					class="form-control" type="password" name="bpchange1"
					id="bpchange1" placeholder="비밀번호를 다시 입력하세요" required="required" />
				<p id="m_pwcheck"
					style="color: #FF6600; margin: 0; font-weight: bold"></p>
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit "
					onclick="joinMem();">변경</button>
			</div>

		</form>
	</div>
	<br><br><br>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>