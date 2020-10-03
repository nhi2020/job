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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
		style="margin:24px 0;"> <a class="navbar-brand"
		href="/user/main/main.do">Logo</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navb">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navb">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="javascript:void(0)">기업</a></li>
			<li class="nav-item"><a class="nav-link"
				href="javascript:void(0)">리뷰</a></li>
		</ul>
		<ul class="navbar-nav" id="main-menu">
			<c:choose>
				<c:when test="${empty sessionScope.b_user.bsmno and empty sessionScope.user.id}">
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
					<li class="nav-item">
						<a class="nav-link" href="/user/member/login/memLogout.do">로그아웃</a>
					</li>
					<c:if test="${!empty sessionScope.user.id}">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 마이페이지 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/user/member/mypage/memMySelectList.do">내 프로필</a> 
							<a class="dropdown-item" href="">활동내역</a> 
							<a class="dropdown-item" href="">탈퇴</a> 
						</div>
					</li>
					</c:if>
					<c:if test="${!empty sessionScope.b_user.bsmno}">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 마이페이지 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="">내 프로필</a> 
							<a class="dropdown-item" href="">활동내역</a> 
							<a class="dropdown-item" href="">탈퇴</a> 
						</div>
					</li>
					</c:if>
				</c:otherwise>
			</c:choose>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="기업을 검색해 보세요.">
			<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
		</form>
	</div>
	</nav>
</body>
</html>