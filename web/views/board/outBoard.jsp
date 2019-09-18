<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	int cmmNo=(int)request.getAttribute("cmmNo");
%>


<%@ include file="/views/common/header.jsp"%>


<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>

		<section>
			<div class="col-sm-9">
			<form method="post" action="<%=request.getContextPath()%>/board/SMTPout">
				<table>
					<tr>
						<th>신고글번호 :</th>
						<td>
							<input type="text" name="cmmNo" class="form-control" value="<%=cmmNo %>" readonly/>
						</td>
					</tr>
					<tr>
						<th>신고유형 :</th>
						<td>
							<input type="text" name="category" class="form-control" />
						</td>
					</tr>
					<tr>
						<th>신고내용 :</th>
						<td>
							<textarea row="5" col="20" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="제출" class="btn my-btn"/>
							<input type="reset" value="취소" class="btn my-btn" onclick="history.back();"/>
						</td>
					</tr>
				</table>
			</form>
			</div>
		</section>
	</div>
</div>



<%@ include file="/views/common/footer.jsp"%>

