<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String context = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../inc/top.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../../inc/header.jsp"%>
	<div class="container" style="margin-top: 30px"></div>
$.ajax({
	type: "POST",
	url: "/myapp/user/checkPw",
	headers: {
		"Content-Type": "application/json",
        "X-HTTP-Method-Override": "POST"
	},
	data: pw,
	datatype: "json",
	success: function(result) {			
		console.log(result);
					
		if(result === "pwConfirmOK") {
			$('#pwMsg').html('');
			chk1 = true;
		} else {
			$('#pwMsg').html('');
			chk1 = false;
		}
									
	},
	error : function(error) {
    	console.log("error : " + error);
	}
});
//새로운 비번
$('#newPw').on('keyup', function() {
	//비밀번호 공백 확인
	if($("#newPw").val() === ""){
		$('#newPwMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
		chk2 = false;
	}		         
	//비밀번호 유효성검사
	else if(!getPwCheck.test($("#newPw").val()) || $("#newPw").val().length < 8){
		$('#newPwMsg').html('<b>특수문자 포함 8자 이상 입력하세요</b>');
		chk2 = false;
	} else {
		$('#newPwMsg').html('');
		chk2 = true;
	}
			
}); //end of new password
			
			
//비밀번호 확인
$('#newPwCheck').on('keyup', function() {
	
	if($("#newPwCheck").val() === "") {
		$('#newPwMsg').html('<b">비밀번호 확인은 필수 정보입니다.</b>');
		chk3 = false;
	} else if( $("#newPw").val() != $("#newPwCheck").val() ) {
		$('#newPwMsg').html('<b>비밀번호가 일치하지 않습니다.</b>');
		chk3 = false;
	} else {
		$('#newPwMsg').html('');
		chk3 = true;
}
	
			});//end of passwordCheck
			
			//비밀번호 변경 요청처리하기
$('.emailChkBtn').click(function(e) {
	
	if(chk1 == false) {
		alert('현재 비밀번호가 틀렸습니다.');	

	} else if(chk2 == false){
		alert('2번 틀림');
	} else if(chk3 == false){
		alert('3번 틀림');
			
	} else if(chk1 && chk2 && chk3) {
			
		const userNo = $('#userNo').val();
		const pw = $("#newPw").val();
		const email = $("#email").val();
		const id = $("#id").val();
		const name = $('#name').val();
		const user = {
			userNo: userNo,
			id: id,
            pw: pw,
            email: email,
            name: name
		};
		console.log(user);
					
		$.ajax({
			type: "POST",
			url: "/myapp/user/pw-change",
            headers: {
               "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: "text",
            data: JSON.stringify(user),
            success: function(result) {
            	
           	console.log("result: " + result);
            	if(result === "changeSuccess") {
            		alert('비밀번호가 변경되었습니다.');
            		location.href ="/myapp/user/pw-change";
            	} else {
           		alert('현재 비밀번호가 틀렸습니다.');
	           	}
            }
		});
					
	} else {
		alert('입력정보를 다시 확인하세요.');	
	}
});
</body>
</html>