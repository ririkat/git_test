<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jb.faq.model.vo.Faq, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
	<%
		List<Faq> list=(List)request.getAttribute("list");
		String pageBar=(String)request.getAttribute("pageBar");
		int cPage=(int)request.getAttribute("cPage");
	%>
<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>
		<section id="notice-container">
			<div class="col-sm-9">
			    <br>
				<br>
				 <center><p class="title" style="color: #6a60a9;">FAQ</p></center>
				<br>
				<br>
				<hr>
				<br>
				<br><div class="container">
				<!-- <div id="search-container">
					<form method="get" action="<%=request.getContextPath()%>/faq/faqFinder">
						<input type="text" name="keyword" placeholder="키워드를 입력하세요(제목)"/>
						​​​​​​​<button type="submit">검색</button>
					</form>
				</div> -->
				
				<table id="tbl-notice" class="table table-striped table-hover">
					<thead>
						<tr>
							<th>게시글번호</th>
							<th>제목</th>
							<th>첨부파일</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (list != null && !list.isEmpty()) {
								for (Faq f : list) {
						%>
						<tr>
							<td><%=f.getfNo()%></td>
							<td><a
								href="<%=request.getContextPath()%>/faq/faqView?no=<%=f.getfNo()%>"><%=f.getfTitle()%></a></td>
							<td>
								<%
									if (f.getfOriginFilename() != null) {
								%>
								<img src="<%=request.getContextPath()%>/images/file.png" alt="첨부파일" width="16px" />
								<%
								 }
								%>
							</td>
							<td><%=f.getfEntDate()%></td>
							<td><%=f.getfReadCount()%></td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
				</table>
				<%
					if (loginClient != null && loginClient.getAuthority() == 1) {
				%>
				<input type="button" value="글쓰기" onclick="wirteFaq();" class="btn my-btn pull-right" />
				<%
					}
				%>
				<br>
				<br>
				<div id="pageBar" class="text-center">
					<ul class="pagination">
						<li><%=pageBar%></li>
					</ul>
				</div>
			</div>
			</div>

			<script>
		    function wirteFaq(){
		    	location.href="<%=request.getContextPath()%>/faq/faqWrite";
			}
			</script>
		</section>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>