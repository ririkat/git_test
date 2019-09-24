<%@ include file="/views/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="marginB100">
	<!-- 배너 슬라이더 -->
	<div id="myCarousel" class="container carousel slide" data-ride="carousel">
		<!-- 슬라이더갯수 버튼? -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>
		
		<!-- 슬라이드 컨테이너 -->
		<div class=" carousel-inner" role="listbox">
			<div class="item active banner">
				<img src="<%=request.getContextPath()%>/images/KakaoTalk_20190924_090822461.jpg" alt="Image" width="100%" height="50%">
				<!-- <div class="carousel-caption">
					<h4>하나</h4>
					<p>Money Money.</p>
				</div> -->
			</div>
			
			<div class="item banner">
				<img src="<%=request.getContextPath()%>/images/KakaoTalk_20190924_090822689.jpg" alt="Image"  width="100%" height="50%">
				<!-- <div class="carousel-caption">
					<h4>둘</h4>
					<p>Lorem ipsum...</p>
				</div> -->
			</div>

			<div class="item banner">
				<img src="<%=request.getContextPath()%>/images/KakaoTalk_20190924_090822900.jpg" alt="Image" width="100%" height="50%">
				<!-- <div class="carousel-caption">
					<h4>셋</h4>
					<p>Lorem ipsum...</p>
				</div> -->
			</div>

			<div class="item banner">
				<img src="<%=request.getContextPath()%>/images/KakaoTalk_20190924_090823117.jpg" alt="Image" width="100%" height="50%">
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

	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid text-center info">
		<div class="container text-center">
			<div class="row">
				<div class="col-sm-6">
					
					<a class="nav-link" href="<%=request.getContextPath()%>/search/load">
					<img class="wfullImg" src="<%=request.getContextPath()%>/images/KakaoTalk_20190924_093147164.png" alt="Image">
						<!-- <h2 class="bContent yellow">테마검색</h2> -->
					</a>
					<!-- <p>테마마마마</p> -->
				</div>
				<div class="col-sm-6">
					
					<a class="nav-link" href="<%=request.getContextPath()%>/search/loadMap">
					<img class="wfullImg" src="<%=request.getContextPath()%>/images/KakaoTalk_20190924_093147278.png"  alt="Image">
						<!-- <h2 class="bContent yellow">지역검색</h2> -->
					</a>
					<!-- <p>지역에에엥잉</p> -->
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
			<div class="carousel-inner">
				<h1 class="thNavy">이벤트</h1>
				<img src="<%=request.getContextPath()%>/images/KakaoTalk_20190924_091117071.png" style="width: 100%" alt="Image">
			</div>
			<br>
			<br>
			<br>
		</div>
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