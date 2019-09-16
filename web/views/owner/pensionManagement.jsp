<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.Pension" %>
<%
	int cPage = (int)request.getAttribute("cPage");
	List<Pension> waitPensions = (List)request.getAttribute("waitPensions");
%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>


<span>
	<h2>나의 펜션 리스트</h2>
</span>
<br><br>

<div class="col-md-10">
	<div>
		<button id="addBtn">펜션추가</button>
		<script>
			$("#addBtn").click(function(){
				location.href="<%=request.getContextPath()%>/owner/addPension?oId=<%=loginOwner.getoId()%>";
			});
		</script>
		<table id="tbl-clientList" class="table table-hover">
			<thead>
				<tr>
					<th style="text-align: center">펜션이름</th>
					<th style="text-align: center">주소</th>
					<th style="text-align: center">번호</th>
					<th style="text-align: center">등록날짜</th>
					<th style="text-align: center">승인여부</th>
				</tr>
			</thead>
			<tbody>
				<% if(waitPensions!=null && !waitPensions.isEmpty()) {
					for(Pension p : waitPensions) { %>
				<tr>
					<td><%=p.getpName() %></td>
					<td><%=p.getpAddr() %></td>
					<td><%=p.getpTel() %></td>
					<td><%=p.getpEnrollDate() %></td>
					<td><%=p.getEnrollYn() %></td>
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
	
	<br><br>
	<div>
		<div class="col-lg-6 col-md-6">
			<a href="#">
				<img class="img-responsive" src="http://placehold.it/700x300" alt="">
			</a>
		</div>
		<div class="col-lg-6 col-md-6">
			<h3>펜션이름</h3>
			<h4>주소</h4>
			<h4>전화번호</h4>
			<h4>영업시작일</h4>
			<p>부대시설</p>
			<a class="btn btn-primary" href="#">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>

</div>


<%@ include file="/views/common/footer.jsp"%>