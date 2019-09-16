<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="col-sm-3 sidenav">
			<br> <br>
			<h4 id="mypagetitle">
				<a href="mypage.html">&nbsp;&nbsp;마이페이지</a>
			</h4>


			<div id="mypageList">

				<ul class="nav nav-pills nav-stacked">
					<br>

					<li><a
						href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">&nbsp;&nbsp;예약확인/취소</a></li>
					<li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
					<li><a href="<%=request.getContextPath()%>/client/infoLoad">&nbsp;&nbsp;회원정보수정</a></li>
					<li><a
						href="<%=request.getContextPath()%>/client/updatePassword">&nbsp;&nbsp;비밀번호변경</a></li>
					<li class="active"><a
						href="<%=request.getContextPath()%>/client/deleteLoad">회원탈퇴</a></li>

				</ul>
				<br>
			</div>
		</div>