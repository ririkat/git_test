<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="com.jb.client.model.vo.Client,com.jb.owner.model.vo.Owner" %>
<% 
	Client loginClient = (Client)session.getAttribute("loginClient"); 
	Owner loginOwner = (Owner)session.getAttribute("loginOwner");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>호텔</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	
<!-- 
#fffcf0 : 누리끼리색
#dedcee : 옅은 남?보라?색
#6a60a9 : 진한 남?보라?색
#fbd14b : 노랭이
-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-*.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/honeycss.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/riri.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/reservationCSS.css"> --%>

<script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.4.1.js"></script>
<style>
.search-form .form-group {
  float: right !important;
  transition: all 0.35s, border-radius 0s;
  width: 32px;
  height: 32px;
  background-color: #fff;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
  border-radius: 25px;
  border: 1px solid #ccc;
}
.search-form .form-group input.form-control {
  padding-right: 20px;
  border: 0 none;
  background: transparent;
  box-shadow: none;
  display:block;
}
.search-form .form-group input.form-control::-webkit-input-placeholder {
  display: none;
}
.search-form .form-group input.form-control:-moz-placeholder {
  /* Firefox 18- */
  display: none;
}
.search-form .form-group input.form-control::-moz-placeholder {
  /* Firefox 19+ */
  display: none;
}
.search-form .form-group input.form-control:-ms-input-placeholder {
  display: none;
}
.search-form .form-group:hover,
.search-form .form-group.hover {
  width: 100%;
  border-radius: 4px 25px 25px 4px;
}
.search-form .form-group span.form-control-feedback {
  position: absolute;
  top: -1px;
  right: -2px;
  z-index: 2;
  display: block;
  width: 34px;
  height: 34px;
  line-height: 34px;
  text-align: center;
  color: #3596e0;
  left: initial;
  font-size: 14px;
}
</style>
</head>

<body>

	<!-- 헤더 -->
	<!-- 네이게이션 -->
	<header>
		<nav class="navbar navbar-inverse navbg">
<!--  		<nav class="navbar navbar-inverse navbar-fixed-top navbg"> -->
			<!--위에 코드로하면 헤더가 바디까지 섹션을 먹어서 바디 윗부분이 짤림,-->
			
			<div class="container nav">
				<div class="row">
				<div class="navbar-header">
					<!-- 화면이 줄었을때 버튼생성,스펜포함 -->
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button>
					<!-- 로고 -->
					<a class="navbar-brand navfont" href="<%=request.getContextPath()%>/index.jsp">자바방</a>
				</div>
				
				<!-- <button type="button" class="navbar-nav btn pull-right btn-srch" id="btn-srch">
						<span class="glyphicon glyphicon-search btn-srch"></span>
				</button> -->
				<div class="pull-right">
					<form action="" class="search-form">
		               <div class="form-group has-feedback">
			           		<label for="search" class="sr-only">Search</label>
			           		<span class="glyphicon glyphicon-search form-control-feedback"></span>
			           		<input type="text" class="form-control" name="search" id="search" placeholder="search">
		           		</div>
		           	</form>
		         </div>

				<div class=" collapse navbar-collapse " >
					<ul class="nav navbar-nav navbar-left font2" id="myNavbar">
					<!-- 로그인 정책 
					1. 회원로그인/업주 로그인 두종류로 구성
					2. 관리자는 회원로그인에서 권한이 1인 경우 관리자로 설정 -->
						<li><a class="aa" href="<%=request.getContextPath()%>/notice/noticeList">게시판</a></li>
						<% if (loginClient == null&&loginOwner==null) {%>
							<li><a class="aa" href="<%=request.getContextPath()%>/views/client/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
						<%}%>
						<%if(loginClient!=null&&loginOwner==null){//1.회원로그인 된 경우
							if(loginClient.getAuthority()==1 ) { %><!-- 회원 중 관리자로 로그인 된 경우 -->
							<li>
								<a class="aa" href="<%=request.getContextPath()%>/master/pensionList">관리자메뉴</a>
							</li>
						<%}%>
	                        <li><a class="aa" href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">마이페이지</a></li>
	                        <li><a class="aa" href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
						<%}%>
						<%if(loginClient==null&&loginOwner!=null){%>
	                        <li><a class="aa" href="<%=request.getContextPath()%>/owner/pensionList?oId=<%=loginOwner.getoId()%>">마이페이지</a></li>
	                        <li><a class="aa" href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
						<%}%>
					</ul>
				</div>
				
				<!--검색버튼  -->
				
			</div>
			</div>
		</nav>
		<script>
			$('#btn-srch').click(function(){
				
			})
		</script>
	</header>
	<!-- 헤더 끝 -->