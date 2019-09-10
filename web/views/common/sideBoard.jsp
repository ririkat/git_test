<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-sm-3 sidenav">
			<br> <br>
			<h4 id="mypagetitle">
				<a href="mypage.html">게시판</a>
			</h4>

			<div id="boardList">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="<%=request.getContextPath()%>/notice/noticeList">공지사항</a></li>
					<li><a href="<%=request.getContextPath()%>/board/boardList">커뮤니티</a></li>
					<li><a href="<%=request.getContextPath()%>/faq/faqList">FAQ</a></li>
				</ul>
			</div>

		</div>