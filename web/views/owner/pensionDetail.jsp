<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.Pension, com.jb.pension.model.vo.Room" %>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>
<%
	Pension pInfo = (Pension)request.getAttribute("pInfo");
	String imgSrc = (String)request.getAttribute("imgSrc");
	List<Room> roomList = (List)request.getAttribute("roomList");
	String pFac = (String)request.getAttribute("pFac");
%>

<div class="col-md-10">
	<br><br><br>
	<div class="tit_contents"><%=pInfo.getpName() %></div>
	<br><br>

	<div class="row pensionList">
		<div class="col-lg-6 col-md-6">
			<p>
				<img class="img-responsive" src="<%=request.getContextPath() %>/upload/pension/<%=imgSrc%>" alt="이미지 준비중" style="width:500px; height:300px;">
			</p>
		</div>
		<div class="col-lg-6 col-md-6">
			<h2><%=pInfo.getpName() %></h2>
			<h6><br></h6>
			<h4>주소 : <%=pInfo.getpAddr()%></h4>
			<h4>전화번호 : <%=pInfo.getpTel()%></h4>
			<h4>영업시작일 : <%=pInfo.getpEnrollDate()%></h4>
			<h4>블랙카운트 : <%=pInfo.getpBlcount()%></h4>
			<h4>부대시설 : <%=pFac %></h4>
			<br>
			<button id="pModify">수정</button>
			<button id="pDelete">삭제</button>
		</div>
	</div>
	
	<br><br>
	<div>
		<hr><br><h3 align="center">객실 목록</h3>
		<button id="addBtn">객실추가</button>
		<table id="tbl-clientList" class="table table-hover">
			<thead>
				<tr>
					<th style="text-align:center">객실번호</th>
					<th style="text-align: center">객실명</th>
					<th style="text-align: center">기준인원</th>
					<th style="text-align: center">최대인원</th>
					<th style="text-align: center">평수</th>
					<th style="text-align: center">가격</th>
				</tr>
			</thead>
			<tbody>
				<% if(roomList!=null && !roomList.isEmpty()) {
					for(Room r : roomList) { %>
				<tr>
		    		<td style="cursor:pointer">
		            	<a href="#">
		                	<%=r.getrNo() %>
		            	</a>
		            </td>
		    		<td><%=r.getrName() %></td>
					<td><%=r.getrNop() %></td>
					<td><%=r.getrMaxNop() %></td>
					<td><%=r.getrSize() %></td>
					<td><%=r.getrPrice() %></td>
				</tr>
				<%	}
			    }%>
			</tbody>
		</table>
	
		<!-- 페이지바 -->
		<div class="text-center">
			<ul class="pagination">
				<li><%=request.getAttribute("pageBar") %></li>
			</ul>
		</div>
	</div>
	
	
	<br>
	<div>
		<table class="table_room2">
			<colgroup>
				<col width="150">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="*">
			</colgroup>

			<tbody>
				<!-- 객실 부대시설, 객실 파일 가져오기 필요! for문 돌리기 -->
				<tr>
					<th class="bl2 br2 bb0px pdb0px">
						<p class="imgBox">
							<img
								src="https://www.pensionzava.com/_psjava/_data/ykpension/room/G_1563845206_15643899645.jpg"
								class="room_img">
						</p>
					</th>
				</tr>

				<tr>
					<th class="bl2 br2 bb2 pdt5px f0 lsm1">
						<div id="thum_img">
							<img src="/_psjava/_image/img/popup/btn_arrow_left.png"
								style="opacity: 0;">
							<div class="arrow_gap_left">&nbsp;</div>
							<img
								src="/_psjava/_data/ykpension/room/G_1563845206_15643899630.jpg"
								class="room_sum_off" id="sImg"
								onmouseover="showPhoto(this.src,1)">
							<img
								src="/_psjava/_data/ykpension/room/G_1563845206_15643899631.jpg"
								class="room_sum_off" id="sImg"
								onmouseover="showPhoto(this.src,2)">
							<img
								src="/_psjava/_data/ykpension/room/G_1563845206_15643899632.jpg"
								class="room_sum_off" id="sImg"
								onmouseover="showPhoto(this.src,3)"> 
							<img
								src="/_psjava/_data/ykpension/room/G_1563845206_15643899643.jpg"
								class="room_sum_off" id="sImg"
								onmouseover="showPhoto(this.src,4)"> 
							<img
								src="/_psjava/_data/ykpension/room/G_1563845206_15643899644.jpg"
								class="room_sum_off" id="sImg"
								onmouseover="showPhoto(this.src,5)"> 
							<img
								src="/_psjava/_data/ykpension/room/G_1563845206_15643899645.jpg"
								class="room_sum_off" id="sImg"
								onmouseover="showPhoto(this.src,6)"> 
							<img
								src="/_psjava/_data/ykpension/room/G_1563845206_15643899646.jpg"
								class="room_sum_off" id="sImg"
								onmouseover="showPhoto(this.src,7)">
							<div class="arrow_gap_right">&nbsp;</div>
							<img src="/_psjava/_image/img/popup/btn_arrow_right.png"
								style="opacity: 0;">
						</div>
						<!-- MOBON Shop Log Tracker v3.0 strat -->
					</th>
				</tr>
				
			</tbody>
		</table>
	</div>
</div>

<script>
	function showPhoto(val,page){
		$(".room_img").attr("src",val);
		$(".imgBox .img_page").text(page);
	}
	
	//펜션 수정
	$("#pModify").click(function(){
		location.href="<%=request.getContextPath()%>/owner/modifyPension?pCode=<%=pInfo.getpCode()%>&oId=<%=pInfo.getoId()%>&pName=<%=pInfo.getpName()%>&pAddr=<%=pInfo.getpAddr()%>";
	});
	
	//펜션 삭제
	$("#pDelete").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="<%=request.getContextPath()%>/owner/oneDelete?pCode=<%=pInfo.getpCode()%>&oId=<%=pInfo.getoId()%>";
		}
	})
	
	//객실 추가
	$("#addBtn").click(function(){
		location.href="<%=request.getContextPath()%>/owner/addRoom?pCode=<%=pInfo.getpCode()%>&imgSrc=<%=imgSrc%>";
	});
</script>


<%@ include file="/views/common/footer.jsp"%>