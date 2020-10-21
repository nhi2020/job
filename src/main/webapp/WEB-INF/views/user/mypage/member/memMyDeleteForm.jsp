<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>회원탈퇴</title>

</head>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		/* 취소 버튼 */
		$(".cencle").on("click", function() {

			location.href = "/user/main/main.do";
			/* 	/user/member/login/memLoginForm.do */
		})

		$("#submit").on("click", function() {
			if ($("#pass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			$.ajax({
				url : "/user/mypage/member/myPassChk.do",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success : function(data) {
					if (data == 0) {
						alert("비밀번호가 틀렸습니다.");
						return;
					} else {
						if (confirm("회원탈퇴하시겠습니까?")) {
							$("#delForm").submit();
						}

					}

				}
			})
		});

	})
</script>
<body>
 <div class="container" style="margin-top:30px">
	<h3 style="font-weight: bold;"><i class="fas fa-external-link-alt"></i> 개인회원 탈퇴</h3>
	<br><br>
	<form action="/user/mypage/member/memMyDelete.do" method="post"
		name="delForm" id="delForm">
		<div class="form-group has-feedback">
			<label class="control-label" for="id">아이디</label> <input
				class="form-control" type="text" name="id" id="id"
				value="${sessionScope.user.id}" readonly="readonly" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="pass">비밀번호</label> <input
				class="form-control" type="password" name="pass" id="pass"
				required="required" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="name">성명</label> <input
				class="form-control" type="text" name="name" id="name"
				value="${sessionScope.user.name}" readonly="readonly" />
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
			<button class="cencle btn btn-danger" type="button">취소</button>
		</div>
	</form>

</div>
<br><br><br>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>

</html>