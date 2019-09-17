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
		</div>
	</div>
	
	<br><br>
	<div>
		<h3 align="center">객실 목록</h3><hr>
		<button id="addBtn">객실추가</button>
		<button id="deleteBtn" class="pull-right">객실삭제</button>
		<table id="tbl-clientList" class="table table-hover">
			<thead>
				<tr>
					<th style="text-align:left"><input type="checkbox" name="selected_all"></th>
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
					<td style="text-align:left"><input type="checkbox" name="selected" value="ROW"></td>
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
</div>

<script>

</script>


<%@ include file="/views/common/footer.jsp"%>