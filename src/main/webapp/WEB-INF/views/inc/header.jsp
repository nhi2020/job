<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#keyword").autocomplete({
		source : function(request, response) {
			$.ajax({
				url : "/autocomplete.do",
				type : "post",
				dataType : "json",
				data: {keyword : $("#keyword").val()},
				success : function(data) {
					var result = data;
					response(result);
				},
			     error:function(request,status,error){
			        alert("code = "+ request.status + " error = " + error); // 실패 시 처리
			     },
			     complete : function(data) {
			        //  실패했어도 완료가 되었을 때 처리
			     }
			});
		}
	});
});
</script>
<style>
.ui-menu {
        list-style:none;
        padding: 10px;
        margin: 0;
        display:block;
        width:227px;
        background-color : white;
}
.ui-menu .ui-menu {
        margin-top: -3px;
}
.ui-menu .ui-menu-item {
        margin:0;
        padding: 0;
        width: 200px;
}
.ui-menu .ui-menu-item a {
        text-decoration:none;
        display:block;
        padding:.2em .4em;
        line-height:1.5;
        zoom:1;
}
.ui-menu .ui-menu-item a.ui-state-hover,
.ui-menu .ui-menu-item a.ui-state-active {
        margin: -1px;
}
</style>
</head>
<body>
<div class="container">
	<nav class="navbar navbar-expand"> 
		<a class="navbar-brand" href="/user/main/main.do">
    		<img src="/resources/images/upload/member/logo1.png" alt="Logo" style="width:70px;height:40px;"/>
  		</a>
	
		<div class="collapse navbar-collapse" id="navb">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/user/biz/info/bizInfo.do" >기업</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0" action="/user/biz/info/bizInfo.do">
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when	test="${empty sessionScope.b_user.bsmno and empty sessionScope.user.id}">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbardrop" data-toggle="dropdown" style="color: black"> 로그인 </a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="/user/member/login/memLoginForm.do">개인 로그인</a>
									<a class="dropdown-item" href="/user/biz/login/bizLoginForm.do">기업 로그인</a>
								</div>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbardrop" data-toggle="dropdown" style="color: black"> 회원가입 </a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="/user/member/join/memJoinForm.do">개인 회원가입</a> 
									<a class="dropdown-item" href="/user/biz/join/bizJoinForm.do">기업 회원가입</a>
								</div>
							</li>
						</c:when>
						<c:otherwise>
							<c:if test="${!empty sessionScope.user.id}">
								<a class="navbar-brand">
						    		<img src="/resources/images/upload/member/${sessionScope.user.storedfilename}" class="rounded-circle" alt="Logo" style="width:30px;height:30px;"/>
						  		</a>
								<li class="nav-item"><a class="nav-link font-weight-bold" style="color: black">${sessionScope.user.name}님 환영합니다.</a></li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle font-weight-bold" id="navbardrop" data-toggle="dropdown" style="color: black">마이페이지 </a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="/user/mypage/member/memMySelectList.do">내 프로필</a>
										<a class="dropdown-item" href="/user/mypage/member/memMyReviewList.do">활동내역</a>
										<a class="dropdown-item" href="/user/mypage/member/memMyPassForm.do">비밀번호변경</a> 
										<a class="dropdown-item" href="/user/mypage/member/memMyDeleteForm.do">탈퇴</a>
									</div>
								</li>
								<li class="nav-item font-weight-bold"><a class="nav-link" href="/user/member/login/memLogout.do">로그아웃</a></li>
							</c:if>
							<c:if test="${!empty sessionScope.b_user.bsmno}">
								<a class="navbar-brand" href="#">
						    		<img src="/resources/images/upload/biz/${sessionScope.b_user.storedfilename}" alt="Logo" class="rounded-circle"  style="width:30px;height:30px;"/>
						  		</a>
								<li class="nav-item"><a class="nav-link font-weight-bold" style="color: black">${sessionScope.b_user.company}님 환영합니다.</a></li>
								<li class="nav-item dropdown"><a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbardrop" data-toggle="dropdown" style="color: black"> 마이페이지 </a>
									<div class="dropdown-menu">
											<a class="dropdown-item" href="/user/mypage/biz/bizMySelectList.do">내 프로필</a> 
										<a class="dropdown-item" href="/user/mypage/biz/bizMyPassForm.do">비밀번호변경</a> 
										<a class="dropdown-item" href="/user/mypage/biz/bizMyDeleteForm.do">탈퇴</a>
									</div>
								</li>
								<li class="nav-item"><a class="nav-link font-weight-bold" href="/user/member/login/memLogout.do" style="color: black">로그아웃</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
				</ul>
				<input class="form-control mr-sm-2 font-weight-bold" type="text" id="keyword" name="keyword" placeholder="기업을 검색해 보세요.">
				<button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<div style="height:auto;border-top: 2px solid #64cd3c;"></div>
</div>
</body>
</html>