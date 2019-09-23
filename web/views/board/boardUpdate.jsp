<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.jb.board.model.vo.Board, java.util.List"%>
<%
	Board b=(Board)request.getAttribute("board");
%>

<%@ include file="/views/common/header.jsp"%>

<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>
		<section>
			<div class="col-sm-9">
				<div class="container">
					<table class="table table-bordered">
						<thead>
						<center><p class="title" style="color: #6a60a9;">게시글수정</p></center>
						</thead>
						<tbody>
							<form action="<%=request.getContextPath() %>/board/boardUpdateEnd" method="post" encType="multipart/form-data"
							onsubmit="return sendData();">
								<tr>
									<th>제목 :</th>
									<td>
										<input type="hidden" value="<%=b.getCmmNo() %>" name="cmmNo" />
										<input type="text" value="<%=b.getTitle() %>" name="title" class="form-control" />
									</td>
								</tr>
								<tr>
								<tr>
									<th>작성자 :</th>
									<td>
										<input type="text" value="<%=loginClient.getcId() %>" name="writer" class="form-control" readonly /></td>
								</tr>
								<th>내용 :</th>
									<td>
										<textarea cols="10" name="content" class="form-control"><%=b.getContent() %></textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일 :</th>
									<td>
										<input type="file" placeholder="파일을 선택하세요. "name="up_file">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="수정완료" class="btn btn-default pull-right" />
										<input type="button" value="취소" class="btn btn-default pull-right" onclick="cancel()" />
									</td>
								</tr>
							</form>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
</div>

<script>
	function cancel(){
		var result=confirm("작성한 내용은 저장되지 않습니다. 정말 취소하시겠습니까?");
		if(result) location.href="<%=request.getContextPath() %>/board/boardList";
	}
	function sendData(){
		if($("#career").val().trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
	}
</script>
<%@ include file="/views/common/footer.jsp"%>