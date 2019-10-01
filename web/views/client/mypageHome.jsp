<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.reservation.model.vo.Reservation, java.util.List"%>
	<%@ page import="java.util.Calendar"%>
<%@ include file="/views/common/header.jsp"%>
<%

List<Reservation> resList = (List) request.getAttribute("resList");
   int cPage = (int)request.getAttribute("cPage");

 		Calendar now = Calendar.getInstance();
 		int nowYear = now.get(Calendar.YEAR); // 현재 년
 		int nowMonth = now.get(Calendar.MONTH) + 1; // 현재 월
 		int nowDate = now.get(Calendar.DATE)+7; // 현재 일

 		String payDate = nowYear + "년 " + nowMonth + "월 " + nowDate + "일";
%>

<style>

/* 예약내역, 찜 내역 제목 */

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
				<a href="mypage.html">&nbsp;&nbsp;마이페이지</a>
			</h4>

			<div id="mypageList">
				<ul class="nav nav-pills nav-stacked">
					<br>
					<li class="active"><a
						href="<%=request.getContextPath()%>/client/reservationList?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;예약확인/취소</a></li>
					<li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
					<li><a
						href="<%=request.getContextPath()%>/client/infoLoad?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
					<li><a
						href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
					<li><a
						href="<%=request.getContextPath()%>/client/deleteLoad?cId=<%=loginClient.getcId()%>">회원탈퇴</a></li>
					<li><a
						href="<%=request.getContextPath()%>/reservation/reservationInfoLoad?cId=<%=loginClient.getcId()%>">예약진행(임시)</a></li>
				</ul>

				<br>
			</div>

		</div>
		<!-- 마이페이지 nav끝 -->

		<!-- 예약내역 시작 -->

		<section>

			<br> <br> <br>

			 <center><p class="title" style="color: #6a60a9;">예약결제내역</p></center>
			<br>
			
			<hr>

<!-- 			예약한펜션리스트  -->

			<%
 				if (resList == null || resList.size() <= 0) {
 			%>

			<h1>예약한 펜션이 없습니다.</h1>

			<%
 				} else {
 			%>
	
			<table class="wish-list">
				<colgroup>

					<col width="10%" />
			
					<col width="10%" />
<!-- 				    인원수 -->
					<col width="10%" />
<!-- 				    이용일 -->
					<col width="20%" />
<!-- 					결제금액 -->
					<col width="20%" />
<!-- 					예약상태 -->
					<col width="10%" />
<!-- 					취소 -->
					<col width="10%" />
					
				</colgroup>
				<form name="list_form" method="post">
					<thead>
						<tr>
 							<th scope="row">예약코드</th>
							<th scope="row">펜션이름</th>
							<th scope="row">방이름</th>
							<th scope="row">인원수</th>
							<th scope="row">이용일</th>
							<th scope="row">예약상태</th>
							<th scope="row">결제금액</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>

						<%
 							for (int i = 0; i < resList.size(); i++) {
 									Reservation res = resList.get(i);
						%>
						<input id="resCode" type="hidden" name="resCode" value="<%=res.getResCode() %>">

						<tr>
							<td><%=res.getResCode() %></td>
							<td><%=res.getPension().getpName()%></td>
							<td><%=res.getRoom().getrName()%></td>
							<td><%=res.getResNop()%></td>
							<td>체크인 : <%=res.getResCheckIn()%><br> 체크아웃 : <%=res.getResCheckOut()%></td>
							

							<%
							if (res.getResState().equals("N")) {
							%>
							<td>
								<p style="color: #FF8F00;">
									예약미확정<br>(입금대기중)<br><%=payDate%>까지
								<p>
							</td>

							<%
							} else {
								%>

							<td><p style="color: #FF8F00;">
									예약확정<br>(결제완료)
								<p></td>
								

 							<% 
 								}
 							%>
 							<td><%=res.getRoom().getrPrice() + res.getRoom().getrAddPrice()%>&nbsp;원</td>
						    <td><input type="button" value="삭제" id="btn-resCancle" class="btn btn-warning"
						    	onclick="location.href='<%=request.getContextPath()%>/reservation/cancleRes?resCode=<%=res.getResCode()%>'"></td>

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


		<script>
		
	
		</script>
		<%@ include file="/views/common/footer.jsp"%>