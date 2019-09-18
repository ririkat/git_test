<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.review.model.vo.Review, com.jb.pension.model.vo.Pension,java.util.List"%>
<%
	Pension p = (Pension)request.getAttribute("pension");
	String pCode = (String)request.getAttribute("pCode");
	List<Review> list = (List) request.getAttribute("list");
	String pageBar = (String) request.getAttribute("pageBar");
	int cPage = (int) request.getAttribute("cPage");
%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

	<style>
        th{
            text-align: center;
        }	
    </style>

	<div class="col-sm-9">
				<h2><%=p.getpName() %>에 대한 리뷰</h2>
				<div id="review-container">
<%-- 					<form method="get" action="<%=request.getContextPath()%>/notice/noticeFinder"> --%>
<!-- 						<input type="text" name="keyword" placeholder="키워드를 입력하세요(제목)"/> -->
<!-- 						​​​​​​​<button type="submit">검색</button> -->
<!-- 					</form> -->
				</div>
				
				<table id="tbl-review" class="table table-striped table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>첨부파일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (list != null && !list.isEmpty()) {
								for (Review r : list) {
						%>
						<tr>
							<td style="width: 40px;"><%=r.getrNo()%></td>
							<td style="width: 100px;">
								<a href="<%=request.getContextPath()%>/owner/reviewView?rNo=<%=r.getrNo() %>">
									<%=r.getrTitle()%></a>
							</td>
							<td style="width: 450px;"><%=r.getrContent()%></td>
							<td>(x)</td>
							<td><%=r.getcId() %></td>
						</tr>
							<%}
								}%>
					</tbody>
				</table>
				
				<div id="pageBar" class="text-center">
					<ul class="pagination">
						<li><%=pageBar%></li>
					</ul>
				</div>
			</div>

	<script>
		$(function(){
	  		$('#mypageList li').removeClass("active");
			$('#mypageList li').eq(1).addClass("active");
	  	 });
	</script>

<%@ include file="/views/common/footer.jsp"%>