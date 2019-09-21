<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	int cmmNo=(int)request.getAttribute("cmmNo");
%>


<%@ include file="/views/common/header.jsp"%>
<!-- Latest compiled and minified CSS -->
<!-- jQuery library -->
<!-- Latest compiled JavaScript -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>

		<section>
			<div class="col-sm-9">
			<form method="post" action="<%=request.getContextPath()%>/board/SMTPout">
			<input type="hidden" value="<%=loginClient.getcId() %>" name="cId"/>
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
							    <select name="category" id="category" class="selectpicker">
							    	<option value="신고유형" disabled>신고유형</option>
							    	<option value="광고, 홍보성 글">광고, 홍보성 글</option>
							    	<option value="알맞지 않은 내용">알맞지 않은 내용</option>
							    	<option value="욕설, 비방글">욕설, 비방글</option>
							    	<option value="기타">기타</option>
							    </select>
						</td>
					</tr>					
					<tr>
						<th>신고내용 :</th>
						<td>
							<textarea name="content" style="resize:none;width:100%;height:100%"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="제출" class="btn my-btn" onclick="check();"/>
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





<!-- 				드롭다운으로 하기			<div class="dropdown"></div> -->
						   <!--  <button class="btn btn-default dropdown-toggle" name="category"
						    type="button" id="menu1" data-toggle="dropdown">신고유형<span class="caret"></span></button> -->
<!-- 						    <input type="hidden" id="saveC">
							    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								    <li role="presentation"><a role="menuitem" tabindex="-1">광고, 홍보성 글</a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1">알맞지 않은 내용</a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1">욕설, 비방글</a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1">기타</a></li>
							    </ul> -->
		<script>
// 		$('li[role=presentation]> a').on('click', function() {
// 			$("#menu1").html($(this).html());
// 		    $('#saveC').attr("value",$(this).html());
// 		});
		
// 		function check(){
// 			if(==null){
// 				alert("신고유형을 선택하세요");
// 				break;
// 			}
// 		}
		</script>