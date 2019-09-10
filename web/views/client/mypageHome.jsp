<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/views/common/header.jsp"%>
<%@page import="com.jb.client.model.vo.Client" %>
<%
 Client c=(Client)request.getAttribute("loginClient");

%>


<!-- 마이페이지 nav -->
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
					<%-- <li class="active"><a href="<%=request.getContextPath()%>/client/mypageHome?cId=<%=c.getcId()%>">&nbsp;&nbsp;예약확인/취소</a></li>
                      <li><a href="<%=request.getContextPath()%>/client/myFavoriteRoom?cId=<%=c.getcId()%>">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updateClientInfo?cId=<%=c.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=c.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteClient?cId=<%=c.getcId()%>">회원탈퇴</a></li> --%>
                        <li class="active"><a href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/infoLoad">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        
                        <li><a href="<%=request.getContextPath()%>/client/deleteLoad">회원탈퇴</a></li>
					</ul>
				<br>
			</div>

		</div>
		<!-- 마이페이지 nav끝 -->

		<!-- 예약내역 시작 -->

		<section>

			<div class="col-sm-9">
				<br>
				<br>
				<br>
				<h4 id="reservedtitle">
					<small>&nbsp;&nbsp;&nbsp;예약내역</small>
				</h4>
				<hr>

				<!-- 예약한펜션 이미지 -->

				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<a href="#"> <img src="펜션사진.jpg" width="200px" height="200px">
								<div class="caption">
									<p class="text-center">
										<strong>리리펜션</strong>
									</p>
								</div>
							</a>
						</div>
					</div>

					<div class="col-md-4">
						<div class="thumbnail">
							<a href="#"> <img src="펜션사진.jpg" width="200px" height="200px">
								<div class="caption">
									<p class="text-center">
										<strong>허니펜션</strong>
									</p>
								</div>
							</a>
						</div>
					</div>
					
				</div>


				<br>
				<br> <br>
				<br>


				<!-- 이전, 다음 버튼 -->

				<ul class="pager">
					<li class="previous"><a href="#">&#60;&#60;이전</a></li>
					<li class="next"><a href="#">다음 &#62; &#62;</a></li>
				</ul>






			</div>
	</div>
</div>

</section>

<!-- 예약내역 끝 -->


<script>

function updatePassword(){ 
	
	location.href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>";
	
	
}




</script>




<%@ include file="/views/common/footer.jsp"%>