<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client"%>
<%
	Client c = (Client) request.getAttribute("client");
%>


<%@ include file="/views/common/header.jsp"%>

<section>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<br> <br>
				<h4 id="mypagetitle">
					<a href="mypage.html" >&nbsp;&nbsp;마이페이지</a>
				</h4>

				<div id="mypageList">

					<ul class="nav nav-pills nav-stacked">
						<br>
						<li><a href="mypage.html">&nbsp;&nbsp;예약확인/취소</a></li>
						<li><a href="jjim.html">&nbsp;&nbsp;내가찜한객실</a></li>
						<li class="active"><a href="updateUserInfo.html">&nbsp;&nbsp;회원정보수정</a></li>
						<li><a href="DeleteUserInfo.html">&nbsp;&nbsp;회원탈퇴</a></li>
					</ul>
					<br>
				</div>

			</div>



			<!-- 회원정보 수정 form -->
			<br>
			<br>
			<br>
			<br>


			<section id="enroll-container">



				<div class="tit_contents">회원정보수정</div>
				<br>
				<hr>
				<br>

				<form name="clientFrm" method="post"
					onsubmit="return update_validate();">
					<table class="updateTable">
						<colgroup>
							<col width="160px">
							<col width="">
						</colgroup>
						<tbody>
							<tr>
								<th class="point" style="vertical-align: middle"><strong
									class="point">*</strong>이름</th>
								<td>서현희<input type="hidden" name="cId"
									value="<%=c.getcId()%>" required></td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>생년월일</th>
								<td><input type="text" name="cBirth" value="<%=c.getcBirth() %>"
									class="input_real datepicker2 hasDatepicker" readonly=""
									id="dp1566713371282"></td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>성별</th>
								<td>
	                	<%if("M"==c.getcGender()){ %>
	                    <input type="radio" name="cGender" 
	                    id="gender0" value="M" checked>
	                    <label for="gender0">남</label>
	                   
	                    <input type="radio" name="cGender" 
	                    id="gender1" value="F">
	                    <label for="gender1">여</label>
	                    <%} else{ %>
	                   
	                    <input type="radio" name="cGender" 
	                    id="gender0" value="M">
	                    <label for="gender0">남</label>
	                   
	                    <input type="radio" name="cGender" 
	                    id="gender1" value="F" checked>
	                    <label for="gender1">여</label>
	                    <%} %>
	                </td>
							</tr>
							
							
							<tr>
								<th class="point"><strong class="point">*</strong>아이디</th>
								<td>  <input type="text" value="<%=c.getcId() %>"
	                     name="cId" id="cId" readonly></td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>현재비밀번호</th>
								<td><input type="password" name="cPw" id="cPw" required="required"/></td>
							</tr>
						
							<tr>
								<th class="point"><strong class="point">*</strong>변경할비밀번호</th>
								<td><input type="password" name="cPwNew" required="required"> 정보보호를 위해
									6~20자로 사용(영문/숫자 조합)</td>
							</tr>
						
							<tr>
								<th class="point"><strong class="point">*</strong>비밀번호확인</th>
								<td><input type="password" name="cPwCk" required/></td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>이메일</th>
								<td><input type="text" name="emailId"
									style="IME-MODE: disabled" value=""> @ <input
									type="text" name="email2" id="email3"
									style="IME-MODE: disabled" value=""> 
									<select
									name="email3" id="email"
									onchange="mailChange(this.value,'uemail02');">
										<option>메일을 선택하세요</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net" selected="selected">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="">직접입력</option>
								</select></td>
							</tr>

							<tr>
								<th class="point"><strong class="point">*</strong>핸드폰번호</th>
								<td><select name="hp1" id="hp1" onchange="changePC('hp2')">
										<option value="">선택</option>
										<option value="010" selected="">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> <input type="text" name="hp2" id="hp2" class="w50px"
									maxlength="4" onkeyup="FocusNext('hp2','hp3',4)"
									style="IME-MODE: disabled" value="9376"> <input
									type="text" name="hp3" id="hp3" class="w50px" maxlength="4"
									style="IME-MODE: disabled" value="8120"></td>
							</tr>

							<tr>
								<th class="point">지역</th>
								<td><select name="addr">
										<option value="서울">서울</option>
										<option value="경기도" selected="">경기도</option>
										<option value="강원도">강원도</option>
										<option value="충청북도">충청북도</option>
										<option value="충남남도">충남남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="제주도">제주도</option>
								</select></td>
							</tr>


						</tbody>
					</table>

 <input type="hidden" name="cId" value='<%=(String)request.getAttribute("cId")%>'/>


				</form>
				<br>
				<br>
				<div class="button">

					<input type="submit" onclick="updateUser();" value="수정"> <input
						type="reset" onclick="location.href='mypage.html' " value="취소">

				</div>


				<hr>
		</div>
</section>

</section>

<script>

function updateClient(){
	
	var frm=$('#clientFrm');
	var url="<%=request.getContextPath()%>/client/clientUpdate";
}






</script>



<%@ include file="/views/common/footer.jsp"%>