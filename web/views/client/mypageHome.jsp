<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.jb.reservation.model.vo.Reservation, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%
List<Reservation> list = (List) request.getAttribute("list");

/* Reservation res = (Reservation)request.getAttribute("reservation");
 */
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
                       <li class="active"><a href="<%=request.getContextPath()%>/client/reservationList?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li ><a href="<%=request.getContextPath()%>/client/infoLoad?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteLoad?cId=<%=loginClient.getcId()%>">회원탈퇴</a></li>
                        <li><a href="<%=request.getContextPath()%>/reservation/reservationInfoLoad?cId=<%=loginClient.getcId()%>">예약진행(임시)</a></li>
                        

					</ul>

				<br>
			</div>

		</div>
		<!-- 마이페이지 nav끝 -->

		<!-- 예약내역 시작 -->

		<section>
		
		<br>
		<br>
		<br>
		<br>
		
	
				
				<div class="tit_contents">예약내역확인</div>
				<br>
				<br>
				<br>
				<hr>
				

				<!-- 예약한펜션리스트  -->
				
				<%
				if (list == null || list.size() <= 0) {
			%>
			
			<h1>예약한 펜션이 없습니다.</h1>
			
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
							<th scope="row">방이름</th>
							<th scope="row">인원수</th>
							<th scope="row">이용일</th>
							<th scope="row">결제금액</th>
							<th scope="row">예약상태</th>
							
						</tr>
					</thead>

					<tbody>

						<%
							for (int i = 0; i < list.size(); i++) {
								Reservation res = list.get(i);
						%>

						<form name="pension-jjim-match-Frm" method="post">
							<%-- <input type="hidden" id="" name="pCode"
								value="<%=r.getpCode()%>" /> --%>
						</form>
						
					
						<tr>
						<td></td>
						
							<td><a href="<%=request.getContextPath()%>/client/pensionDetail?pensionCode=<%=res.getPension().getpCode()%>">
								<%=res.getPension().getpName() %></a>
								<%-- <div class="">

<!-- 						<form name="pension-jjim-match-Frm" method="post"> -->
<!-- 							<input type="hidden" id="" name="pCode" -->
<%-- 								value="<%=r.getpCode()%>" /> --%>
<!-- 						</form> -->
<%-- 						<tr>
							<td></td>
							<td>
								<div class="">

									<a href=""><img
										src="<%=request.getContextPath()%>/images/펜션사진.jpg"
										width="80px" height="80px" class="img-thumbnail" /></a>
								</div> --%>
							</td>
							<td><%=res.getRoom().getrName() %></td>
							<td><%=res.getResNop()%></td>
<%-- 							<td class="td-name"><%=r.getPension().getpName()%></td> --%>
<%-- 							<td class="td-addr"><%=r.getRoom().getrName()%></td> --%>
							<td class="">
							체크인 : <%=res.getResCheckIn() %><br>
							체크아웃 : <%=res.getResCheckOut() %>
							
							</td>
							
							<td class="">
						<!-- 	<button class="btn btn-warning">보기</button> -->
						
						  <%=res.getTotalPrice() %>&nbsp;원
							
							</td>
							
							<%
				if (res.getResState().equals("N")) {
		
					
					%>
							<td class="">
							<p>결제대기<p>
							
							
								<!-- <button class="btn btn-warning" id="btn-delete">삭제</button> -->
							</td>
							
							<%
				} else {
			%>
			
			       <td class="">
							<p>결제완료<p>
							
							
								<!-- <button class="btn btn-warning" id="btn-delete">삭제</button> -->
							</td>
							
							
							<%
							}
						%>
							
							
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
			
				



</section>

<!-- 예약내역 끝 -->


<script>






</script>




<%@ include file="/views/common/footer.jsp"%>