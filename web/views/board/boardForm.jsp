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
						<br><br><br><br><br><br>
						<center><p class="title" style="color: #6a60a9;">게시글작성</p></center>
						<br><br><br><br><br><br><br>
						</thead>
						<tbody>
							<form action="<%=request.getContextPath() %>/board/boardFormEnd" method="post" encType="multipart/form-data"
							onsubmit="return sendData();">
								<tr>
									<th style="vertical-align:middle;"><center>제목 </center></th>
									<td><input type="text" placeholder="제목을 입력하세요. "
										name="title" class="form-control" /></td>
								</tr>
								<tr>
								<tr>
									<th style="vertical-align:middle;"><center>작성자 </center></th>
									<td><input type="text" value="<%=loginClient.getcId() %>"
										name="writer" class="form-control" readonly />
									</td>
								</tr>
								<th style="vertical-align:middle;"><center>내용 </center></th>
								<td><textarea cols="10" placeholder="내용을 입력하세요. "
										name="content" id="career" class="form-control"></textarea></td>
								</tr>
								<tr>
									<th style="vertical-align:middle;"><center>첨부파일 </center></th>
									<td><input type="file"placeholder="파일을 선택하세요." name="up_file"></td>
								</tr>
								<tr>
									<td colspan="2"> 
										<input type="button" value="글 목록으로 "
										class="btn btn-default pull-right" onclick="toList()" ;/></td>
								</tr>
								
								
							
						</tbody>
					</table>
				</div>
				<br><br><br><br><br><br>
				<center>
								<input type="submit"value="등록" 	class="btn btn-warning" />
								<input type="button" value="취소" class="btn btn-warning" />
								</center>
			</div>
			</form>
		</section>
	</div>
</div>
<script>
	function toList(){
		location.href="<%=request.getContextPath() %>/board/boardList";
	}
	function sendData(){
		if($("#career").val().trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
	}
</script>

<%@ include file="/views/common/footer.jsp"%>
