<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>

<title>비밀번호 변경</title>

</head>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#submit").on("click", function() {
			
			var pass1 = $("#pchange").val();
			var pass2 = $("#pchange1").val();
			
			if (pass1 != pass2) {
				alert("변경할 비밀번호가 같지않습니다.");
				$("#pchange").val('');
				$("#pchange1").val('');
				$("#pchange").focus();
				return false;
			}
			
			$.ajax({
				url : "/user/mypage/member/myPassChk.do",
				type : "POST",
				dataType : "json",
				data : $("#passForm").serializeArray(),
				success : function(data) {
					
					
					if (data == 0) {
						alert("패스워드가 틀렸습니다.");
						return;
					} else {
						
						
						$.ajax({
							url : "/user/mypage/member/myUpdatePassChng.do",
							type : "POST",
							dataType : "json",
							data : $("#passForm").serializeArray(),
							success : function(data) {
								if (data == 0) {
									alert("패스워드실패");
									return;
								} else {
									alert("패스워드변경했습니다.");

								}

							}
						}); 
						
						

					}

				}
			}); 
			
			
			
		});
		
		
		
		

	})
</script>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<form action="/user/mypage/member/memMyPassForm.do" name="passForm" id="passForm" method="post">
		<input type="hidden" name="id" id="id" value="${sessionScope.user.id}">
	
		<table border="1" width="400">
			<tr>
				<th>현재비밀번호</th>
				<td><input type="password" name="pass" id="pass" value=""></td>
			</tr>
			<tr>
				<th>변경 비밀번호</th>
				<td><input type="password" name="pchange" id="pchange" value=""></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pchange1" id="pchange1" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" id="submit" value="변경"></td>
				
			</tr>
		</table>
	</form>
</body>
</html>