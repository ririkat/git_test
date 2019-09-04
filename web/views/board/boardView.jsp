<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.board.model.vo.Board, java.util.List"%>
<%
	Board b=(Board)request.getAttribute("board");
%>


<%@ include file="/views/common/header.jsp"%>

<section>
	<h2>게시판</h2>
	<table>
		<tr>
			<td>제목</td>
			<td><%=b.getTitle() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=b.getcId() %></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=b.getViewCnt() %></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
<%-- 				<%if(b.getOriginalFilename()!=null) { %> --%>
<%-- 							<a href="<%=request.getContextPath()%>/notice/noticeFileDown?fileName=<%=n.getFilePath()%>"> --%>
<%-- 						<a href="javascript:fn_filedown('<%=b.getOriginalFilename() %>','<%=b.getRenameFilename() %>')"> --%>
<%-- 						<img src="<%=request.getContextPath()%>/images/file.png" width="16px"/><%=b.getOriginalFilename() %> --%>
<!-- 					</a> -->
<%-- 				<% } %> --%>
<!-- 				<script> -->
// 					function fn_filedown(ori, re){
// 						var file=encodeURIComponent(filename);
<%-- 						location.href="<%=request.getContextPath()%>/board/boardFileDown?orifileName="+file+"&refileName="+re; --%>
// 					};
					
<!-- 				</script> -->
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=b.getContent() %></td>
		</tr>
<%-- 		<%if(memberLogin!=null && (memberLogin.getUserId().equals(b.getBoardWriter()) || memberLogin.getUserId().equals("admin"))) { %> --%>
<!-- 		<tr> -->
<!-- 			<td colspan="2"><input type="button" value="수정하기" onclick="" /> -->
<!-- 				<input type="button" value="삭제하기" onclick="" /></td> -->
<!-- 		</tr> -->
<%-- 		<%} %> --%>





	</table>


</section>




<%@ include file="/views/common/footer.jsp"%>
