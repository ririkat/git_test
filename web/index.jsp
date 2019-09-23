<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section class="marginB100">
	<!-- 배너 슬라이더 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- 슬라이더갯수 버튼? -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>
		
		<!-- 슬라이드 컨테이너 -->
		<div class="carousel-inner" role="listbox">
			<div class="item active banner">
				<img src="http://placehold.it/1024x300" alt="Image" width="100%" height="300px;">
				<!-- <div class="carousel-caption">
					<h4>하나</h4>
					<p>Money Money.</p>
				</div> -->
			</div>
			
			<div class="item banner">
				<img src="http://placehold.it/1024x300" alt="Image" width="100%" height="300px;">
				<!-- <div class="carousel-caption">
					<h4>둘</h4>
					<p>Lorem ipsum...</p>
				</div> -->
			</div>

			<div class="item banner">
				<img src="http://placehold.it/1024x300" alt="Image" width="100%" height="300px;">
				<!-- <div class="carousel-caption">
					<h4>셋</h4>
					<p>Lorem ipsum...</p>
				</div> -->
			</div>

			<div class="item banner">
				<img src="http://placehold.it/1024x300" alt="Image" width="100%" height="200px;">
				<!-- <div class="carousel-caption">
					<h4>넷</h4>
					<p>Lorem ipsum...</p>
				</div> -->
			</div>
		</div>

		<!-- 화살표컨트롤 -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

<!-- 	테스트 링크 -->
	 <a href="<%=request.getContextPath()%>/search/load" class="text-center new-account">테스트테스트</a>

	<br>
	<br>
	<div class="container-fluid text-center info">
		<div class="container text-center">
			<div class="row">
				<div class="col-sm-4">
					<img class="wfullImg" src="http://placehold.it/300x150" alt="Image">
					<a class="nav-link" href="#">
						<!-- <h2 class="bContent yellow">테마검색</h2> -->
					</a>
					<!-- <p>테마마마마</p> -->
				</div>
				<div class="col-sm-4">
					<img class="wfullImg" src="http://placehold.it/300x150"  alt="Image">
					<a class="nav-link" href="#">
						<!-- <h2 class="bContent yellow">지역검색</h2> -->
					</a>
					<!-- <p>지역에에엥잉</p> -->
				</div>
				<div class="col-sm-4">
					<img class="wfullImg" src="http://placehold.it/300x150" alt="Image">
					<a class="nav-link" href="#">
						<!-- <h2 class="bContent yellow">여행지테마검색</h2> -->
					</a>
					<!-- <p >테마마마마마마</p> -->
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

	<!-- 광고슬라이더 -->
	<div class="container-fluid">
		<!-- 글씨 가운데 넣고싶으면  text-center -->
		<div class="container">
			<h1 class="thNavy">추천펜션</h1>
			<div id="myCarousel2" class="carousel slide" data-ride="carousel">
				<!-- 슬라이더갯수 버튼? -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
				</ol>

				<!-- 슬라이드 컨테이너 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="http://placehold.it/800x300" alt="Los Angeles" style="width: 100%">
					</div>

					<div class="item">
						<img src="http://placehold.it/800x300" alt="Chicago" style="width: 100%;">
					</div>


					<!-- 화살표컨트롤 -->
					<a class="left carousel-control" href="#myCarousel2"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel2"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="carousel-inner">
				<h1 class="thNavy">이벤트</h1>
				<img src="http://placehold.it/800x300" style="width: 100%" alt="Image">
			</div>
			<br>
			<br>
			<br>
		</div>
</section>
<script>
// 	$(document).ready(function(){              신고당한 유저 알람해줄 코드,, 완성 못함 by ogc
<%-- 		console.log(<%=loginClient%>); --%>
<%-- 		if(<%=loginClient==null%>){ --%>
// 			alert("로그인 안되어있음");
// 	//			break;
<%-- 		}else if(<%=loginClient!=null&&loginClient.getAuthority()==0&&loginClient.getcBLCount()>0&&loginClient.getReadstatus().equals("N")%>){ --%>
// 			alert("회원님이 작성하신 게시글에 대한 신고가 접수되었습니다. 이메일을 확인하세요");
<%-- 		location.href="<%=request.getContextPath() %>/report/reportSMTP?cId=<%=loginClient.getcId()%>"; --%>
// 		}
// 	});
</script>
<%@ include file="/views/common/footer.jsp"%>