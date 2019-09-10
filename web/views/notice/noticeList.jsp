<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.notice.model.vo.Notice, java.util.List"%>
<%
	List<Notice> list = (List) request.getAttribute("list");
	String pageBar = (String) request.getAttribute("pageBar");
	int cPage = (int) request.getAttribute("cPage");
%>
<%@ include file="/views/common/header.jsp"%>
<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>
		<section id="notice-container">
			<div class="col-sm-9">
				<h2>공지사항</h2>
				<div id="search-container">
					<form method="get" action="<%=request.getContextPath()%>/notice/noticeFinder">
						<input type="text" name="keyword" placeholder="키워드를 입력하세요(제목)"/>
						​​​​​​​<button type="submit">검색</button>
					</form>
				</div>
				
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
								for (Notice n : list) {
						%>
						<tr>
							<td><%=n.getnNo()%></td>
							<td><a
								href="<%=request.getContextPath()%>/notice/noticeView?no=<%=n.getnNo()%>"><%=n.getnTitle()%></a></td>
							<td>
								<%
									if (n.getnOriginFile() != null) {
								%>
								<img src="<%=request.getContextPath()%>/images/file.png" alt="첨부파일" width="16px" />
								<%
								 }
								%>
							</td>
							<td><%=n.getnEntDate()%></td>
							<td><%=n.getnViewCnt()%></td>
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
				<input type="button" value="글쓰기" onclick="wirteNotice();" class="btn my-btn pull-right" />
				<%
					}
				%>
				<div id="pageBar" class="text-center">
					<ul class="pagination">
						<li><%=pageBar%></li>
					</ul>
				</div>
			</div>

			<script>
		    function wirteNotice(){
		    	location.href="<%=request.getContextPath()%>/notice/noticeWrite";
			}
			</script>
		</section>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>