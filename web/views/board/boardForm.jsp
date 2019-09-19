<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/views/common/header.jsp"%>

<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>
		<section>
			<div class="col-sm-9">
				<div class="container">
					<table class="table table-bordered">
						<thead>
						<caption>게시글 작성</caption>
						</thead>
						<tbody>
							<form action="<%=request.getContextPath() %>/board/boardFormEnd" method="post" encType="multipart/form-data">
								<tr>
									<th>제목 :</th>
									<td><input type="text" placeholder="제목을 입력하세요. "
										name="title" class="form-control" /></td>
								</tr>
								<tr>
								<tr>
									<th>작성자 :</th>
									<td><input type="text" value="<%=loginClient.getcId() %>"
										name="writer" class="form-control" readonly />
									</td>
								</tr>
								<th>내용 :</th>
								<td><textarea cols="10" placeholder="내용을 입력하세요. "
										name="content" class="form-control"></textarea></td>
								</tr>
								<tr>
									<th>첨부파일 :</th>
									<td><input type="file" placeholder="파일을 선택하세요. " name="up_file"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="등록"
										onclick="sendData()" class="btn btn-default pull-right" /> <input
										type="button" value="취소" class="btn btn-default pull-left" />
										<input type="button" value="글 목록으로 "
										class="btn btn-default pull-right" onclick="toList()" ;/></td>
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
	function toList(){
		location.href="<%=request.getContextPath() %>/board/boardList";
	}
</script>

<%@ include file="/views/common/footer.jsp"%>
