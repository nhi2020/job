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
<title>비밀번호 변경</title>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
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
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container" style="margin-top: 30px">
		<h3 style="font-weight: bold;">
			<i class="fab fa-expeditedssl"></i> 비밀번호 변경
		</h3>
		<br>
		<br>
		<form action="/user/mypage/member/memMyPassForm.do" name="passForm"
			id="passForm" method="post">
			<input type="hidden" name="id" id="id"
				value="${sessionScope.user.id}">

			<div class="form-group has-feedback">
				<label class="control-label" for="pass">현재비밀번호</label> <input
					class="form-control" type="password" name="pass" id="pass"
					placeholder="현재 비밀번호를 입력하세요" required="required" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="pchange">변경 비밀번호</label> <input
					class="form-control" type="password" name="pchange" id="pchange"
					oninput="pwCheck1(this.value)" maxlength="18"
					placeholder="변경 비밀번호를 입력하세요 . (영문,숫자,특수기호 포함 6~18자리)"
					required="required" />
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


		</form>
	</div>
	<br><br><br>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>