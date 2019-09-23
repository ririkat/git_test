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
						<center><p class="title" style="color: #6a60a9;">FAQ작성</p></center>
						<br><br><br><br><br><br><br>
						</thead>
						<tbody>
							<form action="<%=request.getContextPath() %>/faq/faqWriteEnd"
					method="post" enctype="multipart/form-data">
								<tr>
									<th style="vertical-align:middle;"><center>제목 </center></th>
									<td><input type="text" placeholder="제목을 입력하세요. "
										name="title" class="form-control" /></td>
								</tr>
								<tr>
								<tr>
									<th style="vertical-align:middle;"><center>작성자 </center></th>
									<td><input type="text"  value="<%=loginClient.getcId()%>" readonly
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
								<input type="button" value="취소" class="btn btn-warning" onclice="history.back();" />
								</center>
			</div>
			</form>
		</section>
	</div>
</div>


<!-- 					<table id="tbl-notice" class="table table-bordered"> -->
<!-- 						<tr> -->
<!-- 							<th>제목</th> -->
<!-- 							<td><input type="text" name="title" required></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>작성자</th> -->
<%-- 							<td><input type="text" name="writer" value="<%=loginClient.getcId()%>" readonly/></td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>첨부파일</th> -->
<!-- 							<td><input type="file" name="up_file"></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>내용</th> -->
<!-- 							<td><textarea rows="5" cols="20" name="content"></textarea></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td colspan="2" style="text-align: center"> -->
<!-- 							<input type="submit" value="등록" class="btn my-btn"> -->
<!-- 							<input type="reset" value="취소" class="btn my-btn" onclick="history.back();"></td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</form> -->
<!-- 				</div> -->
<!-- 		</section> -->
<!-- 		</div> -->
<!-- 	</div> -->
<%@ include file="/views/common/footer.jsp"%>