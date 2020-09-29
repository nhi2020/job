<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 로그인 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/user/member/login/memLoginForm.do">개인 로그인</a> 
					<a class="dropdown-item" href="/user/biz/login/bizLoginForm.do">기업 로그인</a> 
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/user/biz/login/bizLoginForm.do">로그아웃</a>
				<!-- <a class="nav-link" href="/user/member/login/memLoginForm.do">로그아웃</a> -->
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 회원가입 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/user/member/join/memJoinForm.do">개인 회원가입</a> 
					<a class="dropdown-item" href="/user/biz/join/bizJoinForm.do">기업 회원가입</a> 
				</div>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text"
				placeholder="기업을 검색해 보세요.">
			<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
		</form>
	</div>
	</nav>
</body>
</html>