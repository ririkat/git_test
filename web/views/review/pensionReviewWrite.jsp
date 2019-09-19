<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client" %>
<%
	Client c = (Client) request.getAttribute("client");
	String pCode = (String) request.getAttribute("pCode");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMypage.jsp"%>




		<section id="review-container" class="container">
			<div class="col-sm-9">
				<h2 class="text-center">리뷰 작성</h2>
				  <form action="<%=request.getContextPath() %>/review/reviewWriteEnd"
					method="post" enctype="multipart/form-data">

					<table id="tbl-review" class="table table-bordered">
						
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" required></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writer" value="<%=c.getcId()%>" readonly/></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="up_file"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="5" cols="30" name="content"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
							<input type="submit" value="등록" class="btn my-btn">
							<input type="reset" value="취소" class="btn my-btn" onclick="history.back();"></td>
						</tr>
					</table>
					
					<input type="hidden" name="pCode" id="pCode" value="<%=pCode%>">
					
				</form>
				</div>
		</section>













<%@ include file="/views/common/footer.jsp"%>