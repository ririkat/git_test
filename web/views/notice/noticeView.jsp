<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jb.notice.model.vo.Notice"%>
<%
    	Notice n = (Notice)request.getAttribute("notice");
    %>
<%@ include file="/views/common/header.jsp"%>
<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-3 sidenav">
			<br> <br>
			<h4 id="mypagetitle">
				<a href="mypage.html">게시판</a>
			</h4>

			<div id="boardList">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="mypage.html">공지사항</a></li>
					<li><a href="jjim.html">커뮤니티</a></li>
					<li><a href="updateUserInfo.html">FAQ</a></li>
				</ul>
				<br>
			</div>

		</div>
		<section id="notice-container" class="container">
			<div class="col-sm-9">
				<h2>공지사항</h2>
				<table id="tbl-notice" class="table table-bordered">
					<tr>
						<th>제 목</th>
						<td><%=n.getnTitle()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>관리자</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<%if(n.getnOriginFile()!=null){%> <a
							href="javascript:fn_filedown('<%=n.getnOriginFile()%>')"> <img
								src="<%=request.getContextPath()%>/images/file.png" width="16px" /></a>
							<%}%> <script>
        	function fn_filedown(filename){
        		var file=encodeURIComponent(filename);
        		location.href="<%=request.getContextPath()%>/notice/noticeFileDown?filename="+file;
        	}
        </script>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=n.getnContent()%></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
						<input type="button" value="수정하기" onclick="" class="btn my-btn"/>
						<input type="button" value="삭제하기" onclick="" class="btn my-btn" /></td>
					</tr>
				</table>
			</div>
		</section>
	</div>
	<%@ include file="/views/common/footer.jsp"%>