<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin:24px 0;"> 
		<a class="navbar-brand" href="/user/main/main.do">
    		<img src="/resources/images/upload/member/logo.png" alt="Logo" style="width:70px;height:40px;"/>
  		</a>
	
		<div class="collapse navbar-collapse" id="navb">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="javascript:void(0)">기업</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:void(0)">리뷰</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when	test="${empty sessionScope.b_user.bsmno and empty sessionScope.user.id}">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 로그인 </a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="/user/member/login/memLoginForm.do">개인 로그인</a>
									<a class="dropdown-item" href="/user/biz/login/bizLoginForm.do">기업 로그인</a>
								</div>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 회원가입 </a>
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
								<li class="nav-item"><a class="nav-link">${sessionScope.user.name}님 환영합니다.</a></li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">마이페이지 </a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="/user/mypage/member/memMySelectList.do">내 프로필</a>
										<a class="dropdown-item" href="">활동내역</a>
										<a class="dropdown-item" href="/user/mypage/member/memMyPassForm.do">비밀번호변경</a> 
										<a class="dropdown-item" href="/user/mypage/member/memMyDeleteForm.do">탈퇴</a>
									</div>
								</li>
								<li class="nav-item"><a class="nav-link" href="/user/member/login/memLogout.do">로그아웃</a></li>
							</c:if>
							<c:if test="${!empty sessionScope.b_user.bsmno}">
								<a class="navbar-brand" href="#">
						    		<img src="/resources/images/upload/biz/${sessionScope.b_user.storedfilename}" alt="Logo" style="width:30px;height:30px;"/>
						  		</a>
								<li class="nav-item"><a class="nav-link" href="#">${sessionScope.b_user.company}님 환영합니다.</a></li>
								<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 마이페이지 </a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="/user/mypage/biz/bizMySelectList.do">내 프로필</a> 
										<a class="dropdown-item" href="">활동내역</a> <a class="dropdown-item" href="">탈퇴</a>
									</div>
								</li>
								<li class="nav-item"><a class="nav-link" href="/user/member/login/memLogout.do">로그아웃</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
				</ul>
				<input class="form-control mr-sm-2" type="text" placeholder="기업을 검색해 보세요.">
				<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
			</form>
		</div>
	</nav>
</body>
</html>