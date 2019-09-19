<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import ="com.jb.client.model.vo.Client" %>



<% 
Client loginClient = (Client)session.getAttribute("loginClient"); 
Client c=(Client)request.getAttribute("client");

%>


<section>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<br> <br>
				<h4 id="mypagetitle">
					<a href="mypage.html" >&nbsp;&nbsp;마이페이지</a>
				</h4>

				<div id="mypageList">

					<ul class="nav nav-pills nav-stacked">
						<br>
				
                        <li><a href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li class="active"><a href="<%=request.getContextPath()%>/client/infoLoad?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteLoad?cId=<%=loginClient.getcId()%>">회원탈퇴</a></li>
                        
                        
					</ul>
					<br>
				</div>

			</div>