<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.owner.model.vo.Owner"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>


		<div class="col-sm-9">
			<section id="container">
				<br> <br> <br> <br> <br>
				<center><p class="title" style="color: #6a60a9;">업주탈퇴</p></center>
				<br>
				<hr>
				<br>

				<form action="" name="deleteFrm" method="post">
					<table class="updateTable">
						<colgroup>
							<col width="160px">
							<col width="">
						</colgroup>
						<tbody>
							<tr>
								<th class="point">아이디</th>
								<td><input type="hidden" name="oId"
									value="<%=o.getoId()%>" readonly><%=o.getoId()%></td>
							</tr>
							<tr>
								<th class="point"><strong class="point"></strong>비밀번호</th>
								<td><input type="password" id="oPw" name="oPw" title="비밀번호"
									required></td>
							</tr>
						<input type="hidden" id="loadoPw" name="loadoPw" value="<%=o.getoPw()%>">
<!-- 						hidden으로 패스워드를 받아와 입력한패스워드와 비교 (id를 이용하여 dao에서 Owner를 가져올때 pw도 가져와야함) -->
							<tr>
								<th class="point"><strong class="point"></strong>탈퇴사유</th>
								<td>


									<p>
										<input type="radio" id="" name="usece" title="탈퇴사유"
											value="이용X"> <label for="">중개사이트를 이용하지 않아서</label>
									</p>
									<p>
										<input type="radio" id="" name="usece" title="탈퇴사유"
											value="혜택X"> <label for="">이용에 대한 혜택사항이 적어서</label>
									</p>
									<p>
										<input type="radio" id="" name="usece" title="탈퇴사유"
											value="어려움"> <label for="">사이트 이용방법이 어려워서</label>
									</p>
									<p>
										<input type="radio" id="" name="usece" title="탈퇴사유"
											value="불친절"> <label for="">고객상담이 불친절해서</label>
									</p>
									<p>
										<input type="radio" id="" name="usece" title="탈퇴사유" value="기타">
										<label for="">기타</label> <input class="mgl5" type="text"
											name="nreason" title="기타 탈퇴사유" style="width: 300px;">
									</p>
								</td>
							</tr>
						</tbody>
					</table>

					<br> <br>

					<div class="button">
						<input type="button" id="btn-delete" class="btn btn-warning"
							name="btn-delete" onclick="deleteOwner();" value="탈퇴"> 
						<input type="reset" class="btn btn-warning"
							onclick="<%=request.getContextPath()%>/owner/ownerInfo" value="취소">
					</div>
					<hr>

				</form>
			</section>
		</div>


<script>

	$(function(){
		$('#mypageList li').removeClass("active");
		$('#mypageList li').eq(3).addClass("active");
	});
    
    function deleteOwner(){
		var pwck = $('#oPw').val();
		var loadpw = $('#loadoPw').val();
		console.log(pwck);
		console.log(loadpw);
		
		if(pwck!=loadpw){
			alert("비밀번호가 일치하지 않습니다.");
			$('#oPw').val("");
			$('#oPw').focus();
		}
		else{
			if(confirm("정말로 탈퇴하시겠습니까?")){
				var url="<%=request.getContextPath()%>/owner/deleteOwnerEnd?oId=<%=o.getoId()%>";
				location.href=url;
			}
		}
	}
	</script>

<%@ include file="/views/common/footer.jsp"%>