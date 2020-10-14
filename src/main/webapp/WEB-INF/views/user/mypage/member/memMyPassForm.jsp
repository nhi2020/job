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
<title>JOBARA</title>
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
</head>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<script type="text/javascript">
	/* $(document).ready(function() {
		
		$("#submit").on("click", function() {
			
			var pass1 = $("#pchange").val();
			var pass2 = $("#pchange1").val();
			if (pass1 == ''){
				alert("비밀번호를 입력해주세요.");
				$("#pchange").val('');
				$("#pchange").focus();
				return false;
			}
			if (pass2 == ''){
				alert("변경할 비밀번호를 입력해주세요.");
				$("#pchange1").val('');
				$("#pchange1").focus();
				return false;
			}
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
						alert("비밀번호가 틀렸습니다.");
						return;
					} else {
						
						
						$.ajax({
							url : "/user/mypage/member/myUpdatePassChng.do",
							type : "POST",
							dataType : "json",
							data : $("#passForm").serializeArray(),
							success : function(data) {
								if (data == 0) {
									alert("비밀번호 변경실패했습니다.");
									return;
								} else {
									alert("비밀번호변경했습니다.");

								}

							}
						}); 
	
					}

				}
			}); 

		});

	})
 */
 /* 비밀번호 확인 */
<%-- 	$(document).ready(function() {
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
			data : {pass : pass},
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
	} --%>
	
	function joinMem(){
		var bp=$('#m_pwcheck').text();
		var bp2=$('#m_pwcheck2').text();
		if(bp2=='비밀번호 형식이 일치하지 않습니다.'){
			alert('비밀번호 형식이 일치하지 않습니다.');
			document.passForm.pchange.value="";
			document.passForm.pchange.focus();
			return false;
		}
		
		if(bp=='비밀번호가 일치하지 않습니다.'){
			alert('비밀번호가 일치하지 않습니다.');
			document.passForm.pchange1.value="";
			document.passForm.pchange1.focus();
			return false;
		}
		
		document.passForm.action="/user/mypage/member/myUpdatePassChng.do";
		document.passForm.submit();
		
	}
		/* 비밀번호 확인 */
		$(document).ready(function() {
			$('#pchange').keyup(function() {
				$('m_pwcheck').text('');
			});
			$('#pchange1').keyup(function() {
				if ($('#pchange').val() != $('#pchange1').val()) {

					$('#m_pwcheck').text('');
					$('#m_pwcheck').html("비밀번호가 일치하지 않습니다.");
				} else {
					$('#m_pwcheck').text('');
					$('#m_pwcheck').html("비밀번호가 일치합니다.");
				}
			});
		});
		
		/* 비밀번호 유효성 검사 */
	    function pwCheck1(pass){
	    	$.ajax({
	    		type:'POST',
	    		url:'/memPwCheck.do',
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

<body>

	<h3>비밀번호 변경 (영문자, 숫자, 특수기호 사용한 6~18자리로 작성해주세요)</h3>
	<form action="/user/mypage/member/memMyPassForm.do" name="passForm"
		id="passForm" method="post">
		<input type="hidden" name="id" id="id" value="${sessionScope.user.id}">

		<div class="form-group has-feedback">
			<label class="control-label" for="pass">현재비밀번호</label> <input
				class="form-control" type="password" name="pass" id="pass"
				placeholder="현재 비밀번호를 입력하세요" required="required" />
		</div>

		<div class="form-group has-feedback">
			<label class="control-label" for="pchange">변경 비밀번호</label> <input
				class="form-control" type="password" name="pchange" id="pchange"
				oninput="pwCheck1(this.value)" maxlength="18"
				placeholder="변경 비밀번호를 입력하세요" required="required" />
			<p id="m_pwcheck2"
				style="color: #FF6600; margin: 0; font-weight: bold"></p>
		</div>

		<div class="form-group has-feedback">
			<label class="control-label" for="pchange1">비밀번호 확인</label> <input
				class="form-control" type="password" name="pchange1" id="pchange1"
				placeholder="비밀번호를 다시 입력하세요" required="required" />
			<p id="m_pwcheck"
				style="color: #FF6600; margin: 0; font-weight: bold"></p>
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit "
				onclick="joinMem();">변경</button>
		</div>

		<!-- 	<table border="1" width="400"> -->
		<!-- 	<tr>
				<th>현재비밀번호</th>
				<td><input type="password" name="pass" id="pass"
					placeholder="현재 비밀번호를 입력하세요" required="required"></td>
			</tr> -->
		<!-- 	<tr>
				<th>변경 비밀번호</th>
				<td><input type="password" name="pchange" id="pchange"
					oninput="pwCheck(pass.value)" maxlength="18"
					placeholder="비밀번호를 입력하세요" required="required"></td>
				<p id="m_pwcheck2"
					style="color: #FF6600; margin: 0; font-weight: bold"></p>
			</tr> -->
		<!-- 	<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pchange1" id="pchange1"
					placeholder="비밀번호를 다시 입력하세요" required="required"></td>
			</tr> -->
		<!-- <tr>
				<td colspan="2"><input type="submit" id="submit" value="변경"></td>

			</tr>
		</table> -->
	</form>
</body>
</html>