<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.jb.client.model.vo.Reservation, java.util.List"%>
<%
List<Reservation> list = (List) request.getAttribute("list");

%>

<style>

/* 예약내역, 찜 내역 제목 */
#reservedtitle, #jjimtitle {
	font-family: 'TmonMonsori';
	font-size: 30px;
	color: gray;
	position: relative;
	top: 40px;
	/* color: #6a60a9 !important; */
}

table.wish-list {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 100px 100px;
	position: relative;
	left: 50px;
	top: 40px;
}

table.wish-list th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.wish-list td {
	width: 350px;
	padding: 15px;
	/* vertical-align: top; */
	border-bottom: 1px solid #ccc;
	vertical-align: middle;
}

#all-clear {
	/* margin-right: 50%; */
	float: right;
	position: relative;
	right: 130px;
	top: 40px;
}

th, td {
	text-align: center;
}
</style>



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
					
                        <li class="active"><a href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/infoLoad?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteLoad?cId=<%=loginClient.getcId()%>">회원탈퇴</a></li>
					</ul>
				<br>
			</div>

		</div>
		<!-- 마이페이지 nav끝 -->

		<!-- 예약내역 시작 -->

		<section>

	
				
				<div class="tit_contents">예약내역확인</div>
				<br>
				<hr>
				<br>

				<!-- 예약한펜션리스트  -->
				
				<%
				if (list == null || list.size() <= 0) {
			%>
			
			<h1>찜한 펜션이 없습니다.</h1>
			
			<%
				} else {
			%>

			<table class="wish-list">
				<colgroup>
					<!-- 공백부분 -->
					<col width="1%" />
					<!-- 펜션이미지 -->
					<col width="15%" />
					<!-- 펜션이름 -->
					<col width="15%" />
					<!-- 펜션주소 -->
					<col width="15%" />
					<!-- 전화번호 -->
					<col width="15%" />
					<!-- 테마 -->
					<col width="15%" />
					<!-- 처리 -->
					<col width="15%" />
				</colgroup>
				<form name="list_form" method="post">
					<thead>
						<tr>
							<th scope="row"></th>

							<th scope="row">펜션이름</th>
							<th scope="row">방정보</th>
							<th scope="row">기간</th>
							<th scope="row">결제금액</th>
							<th scope="row">예약상태</th>
							<th scope="row">취소</th>
						</tr>
					</thead>

					<tbody>

						<%
							for (int i = 0; i < list.size(); i++) {
								Reservation r = list.get(i);
						%>

						<form name="pension-jjim-match-Frm" method="post">
							<input type="hidden" id="" name="pCode"
								value="<%=r.getpCode()%>" />
						</form>
						<tr>
							<td></td>
							<td>
								<div class="">
									<a href=""><img
										src="<%=request.getContextPath()%>/images/펜션사진.jpg"
										width="80px" height="80px" class="img-thumbnail" /></a>
								</div>
							</td>
							<td class="td-name"><%=r.getpName()%></td>
							<td class="td-addr"><%=r.getpAddr()%></td>
							<td class="td-phone"><%=r.getpTel()%></td>
							<td class=""><button class="btn btn-warning">보기</button></td>
							<td class="">
								<button class="btn btn-warning" id="btn-delete">삭제</button>
							</td>
						</tr>

						<%
							}
						%>


					</tbody>

				</form>


			</table>
			<%
				}
			%>
				
				
				
				
				
				
				
				
				
				
				

				<!-- 이전, 다음 버튼 -->

				<ul class="pager">
					<li class="previous"><a href="#">&#60;&#60;이전</a></li>
					<li class="next"><a href="#">다음 &#62; &#62;</a></li>
				</ul>








</section>

<!-- 예약내역 끝 -->


<script>

function updatePassword(){ 
	
	location.href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>";
	
	
}




</script>




<%@ include file="/views/common/footer.jsp"%>