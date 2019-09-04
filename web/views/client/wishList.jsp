<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

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

<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-3 sidenav">
			<br> <br>
			<h4 id="mypagetitle">
				<a href="mypage.html">&nbsp;&nbsp;마이페이지</a>
			</h4>
			<div id="mypageList">
				<ul class="nav nav-pills nav-stacked">
					<br>
					<li><a href="mypage.html">&nbsp;&nbsp;예약확인/취소</a></li>
					<li class="active"><a href="jjim.html">&nbsp;&nbsp;내가찜한펜션</a></li>
					<li><a href="updateUserInfo.html">&nbsp;&nbsp;회원정보수정</a></li>
					<li><a href="DeleteUserInfo.html">&nbsp;&nbsp;회원탈퇴</a></li>
				</ul>
				<br>
			</div>

		</div>

		<!-- 마이페이지 nav끝 -->

		<!-- 내가 찜한 객실 시작 -->

		<section>





			<h4 id="jjimtitle" style="text-align: center">내가 찜한 펜션</h4>




			 <div class="all-clear">
                    <button class="btn btn-warning" id="all-clear" onclick="">목록모두삭제</button>


                </div>

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

							<th scope="row">펜션사진</th>
							<th scope="row">펜션이름</th>
							<th scope="row">펜션주소</th>
							<th scope="row">전화번호</th>
							<th scope="row">펜션테마</th>
							<th scope="row">처리</th>
						</tr>
					</thead>
					<tbody>

						<form name="pension-jjim-match-Frm" method="post">
							<input type="hidden" id="" name="pCode" value="" />
						</form>
						<tr>
							<td>
							
								
							</td>
							<td>
								<div class="">
									<a href=""><img
										src="<%=request.getContextPath()%>/images/펜션사진.jpg"
										width="80px" height="80px" /></a>
								</div>
							</td>
							<td class="td-name">허니펜션</td>
							<td class="td-addr">경기도 화성시 동탄반석로42</td>
							<td class="td-phone">031-8888-0000</td>
							<td class="td-theme">수영장</td>
							<td class=""> <button class="btn btn-warning" onclick="">삭제</button></td>
						</tr>
					</tbody>
				</form>
				<form name="pension-jjim-match-Frm" method="post">
					<input type="hidden" id="" name="pCode" value="" />
				</form>
				<tr>
					<td>
						
					</td>
					<td>
						<div class="">
							<a href=""><img
								src="<%=request.getContextPath()%>/images/펜션사진.jpg" width="80px"
								height="80px" /></a>
						</div>
					</td>
					<td class="td-name">허니펜션</td>
					<td class="td-addr">경기도 화성시 동탄반석로42</td>
					<td class="td-phone">031-8888-0000</td>
					<td class="td-theme">수영장</td>
					<td class=""> <button class="btn btn-warning">삭제</button></td>
				</tr>
				</tbody>
				</form>
				<form name="pension-jjim-match-Frm" method="post">
					<input type="hidden" id="" name="pCode" value="" />
				</form>
				<tr>
					<td>
						
					</td>
					<td>
						<div class="">
							<a href=""><img
								src="<%=request.getContextPath()%>/images/펜션사진.jpg" width="80px"
								height="80px" /></a>
						</div>
					</td>
					<td class="td-name">허니펜션</td>
					<td class="td-addr">경기도 화성시 동탄반석로42</td>
					<td class="td-phone">031-8888-0000</td>
					<td class="td-theme">수영장</td>
					<td class=""> <button class="btn btn-warning">삭제</button></td>
				</tr>
				</tbody>
				</form>
				<form name="pension-jjim-match-Frm" method="post">
					<input type="hidden" id="" name="pCode" value="" />
				</form>
				<tr>
					<td>
						
					</td>
					<td>
						<div class="">
							<a href=""><img
								src="<%=request.getContextPath()%>/images/펜션사진.jpg" width="80px"
								height="80px" /></a>
						</div>
					</td>
					<td class="td-name">허니펜션</td>
					<td class="td-addr">경기도 화성시 동탄반석로42</td>
					<td class="td-phone">031-8888-0000</td>
					<td class="td-theme">수영장</td>
					<td class=""> <button class="btn btn-warning">삭제</button></td>
				</tr>
				</tbody>
				</form>
				<form name="pension-jjim-match-Frm" method="post">
					<input type="hidden" id="" name="pCode" value="" />
				</form>
				<tr>
					<td></td>
					<td>
						<div class="">
							<a href=""><img
								src="<%=request.getContextPath()%>/images/펜션사진.jpg" width="80px"
								height="80px" /></a>
						</div>
					</td>
					<td class="td-name">허니펜션</td>
					<td class="td-addr">경기도 화성시 동탄반석로42</td>
					<td class="td-phone">031-8888-0000</td>
					<td class="td-theme">수영장</td>
					<td class=""> <button class="btn btn-warning">삭제</button></td>
				</tr>
				</tbody>
				</form>



			</table>


		</section>

		<!-- 내가 찜한 객실 끝 -->

		<%@ include file="/views/common/footer.jsp"%>