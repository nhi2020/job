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
<title>업데이트</title>
<style type="text/css">
li {
	font-weight: bold;
}
</style>
</head>

<body>
	<script type="text/javascript">
function btnMyUpdate(){
	if(document.frm.emailChk.value==''){
		alert('이메일 체크를 해주세요.');
		document.frm.email.focus();
		return false;
	}
	if(document.frm.phoneChk.value==''){
		alert('전화번호 체크를 해주세요.');
		document.frm.phone.focus();
		return false;
	}
	document.frm.action="/user/mypage/member/myUpdate.do";
	document.frm.submit();
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
				document.frm.emailChk.value="Y";
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
				data : {
					"phone" : $("#phone").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 전화번호가 존재합니다.");
						document.frm.phoneChk.value="Y";
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
	</script>





	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container p-3">

		<form method="post" name="frm" id="upForm"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${sessionScope.user.id}">
			<input type="hidden" name="pass" value="${sessionScope.user.pass}">
			<input type="hidden" name="emailChk" value=""> <input
				type="hidden" name="phoneChk" value="">
			<h3 style="font-weight: bold;">
				<i class="fas fa-user-edit"></i> 마이페이지 수정
			</h3>

			<ul class="list-group">
				<li class="list-group-item" style="background-color: #64cd3c;">
					<label for="id">아이디:</label> ${sessionScope.user.id}
				</li>

				<li class="list-group-item " style="background-color: #eef5df;">이미지:
					<c:if
						test="${sessionScope.user.storedfilename ne '' and not empty sessionScope.user.storedfilename}">
						<img
							src="/resources/images/upload/member/${sessionScope.user.storedfilename}"
							class="img-fluid" width="100px" height="100px" />
					</c:if>
				</li>


				<li class="list-group-item" style="background-color: #e3f5bc;">

					<label for="pwd"></label> <c:choose>
						<c:when
							test="${sessionScope.user.originalfilename eq '' or sessionScope.user.originalfilename == null}">
							<div class="form-group">
								<label for="image"><i class="fas fa-star-of-life"
									style="color: red;"></i>이미지 업로드</label> <input type="file"
									class="form-control" id="file" name="file"
									placeholder="이름을 입력하세요">
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
								${sessionScope.user.originalfilename} <a class="btn btn-success"
									href="/user/mypage/member/myImageDel.do?storedfilename=${sessionScope.user.storedfilename}&filesize=${sessionScope.user.filesize}&attachid=${sessionScope.user.attachid}">삭제</a>
							</div>
						</c:otherwise>
					</c:choose>
				</li>





				<li class="list-group-item" style="background-color: #eef5df;">
					<div class="form-group">
						<label for="id">이름:</label> ${sessionScope.user.name}
					</div>
				</li>
				<li class="list-group-item" style="background-color: #e3f5bc;">
					<div class="form-group">
						<label for="id">성별:</label>
						<c:if test="${sessionScope.user.gender ==1 }">
							남자
						</c:if>
						<c:if test="${sessionScope.user.gender ==2 }">
							여자
						</c:if>
					</div>
				</li>
				<li class="list-group-item" style="background-color: #eef5df;">
					
						<i class="fas fa-star-of-life" style="color: red;"></i> <label
							for="email">이메일:</label> <input type="text" name="email"
							class="form-control" id="email" required="required"
							value="${sessionScope.user.email }"> <input type="button"
							value="중복체크" onclick="e_check();" class="btn btn-warning" />
				
				</li>
				<li class="list-group-item" style="background-color: #e3f5bc;">
					<div class="form-group">
						<i class="fas fa-star-of-life" style="color: red;"></i> <label
							for="phone">전화번호:</label> <input type="text" name="phone"
							class="form-control" id="phone" required="required"
							value="${sessionScope.user.phone }"> <input type="button"
							value="중복체크" onclick="p_check();" class="btn btn-warning" />
					</div>
				</li>
				<li class="list-group-item" style="background-color: #eef5df;">
					<div class="form-group">
						<label for="birthday">생일:</label> ${sessionScope.user.birthday }
					</div>
				</li>
				<li class="list-group-item" style="background-color: #e3f5bc;">
					<div class="form-group">
						<i class="fas fa-star-of-life" style="color: red;"></i> <label
							for="career">총 경력</label> <select class="form-control"
							id="career" name="career" required="required">
							<option value=""
								${sessionScope.user.career eq ''? "selected='selected'":""}>총 경력을 선택하세요.</option>
							<c:forEach begin="1" end="20" var="i">
								<c:set var="rlt" value="${i}년" />
								<option value="${i}년"
									${sessionScope.user.career eq rlt? "selected='selected'":""}>${i}년</option>
							</c:forEach>
							<option value="21년 이상"
								${sessionScope.user.career eq '21년 이상'? "selected='selected'":""}>21년 이상</option>
						</select>
					</div>
				</li>

				<li class="list-group-item" style="background-color: #eef5df;">
					<input type="button" class="btn btn-success float-right" value="확인"
					onclick="btnMyUpdate();" />
				</li>
			</ul>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>

