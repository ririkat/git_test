a<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client"%>


<%@ include file="/views/common/header.jsp"%>

<!-- <section onload="init()"> -->

	<div class="container-fluid">
		<div class="row content">
		<!-- nav -->
			<%@ include file="/views/common/sideMypage.jsp"%>
			<br> <br> <br> <br>
			<section id="enroll-container">
				<div class="tit_contents">회원정보수정</div>
				<br>
				<hr>
				<br>
				<!-- 전체수정 폼(회원수정) 시작 -->
				<form id="clientFrm" method="post" onsubmit="return update_validate();">
					<!-- 전체 테이블 시작 -->
					<table class="updateTable">
						<colgroup>
							<col width="160px">
							<col width="">
						</colgroup>
						<tbody>
							<tr>
								<th class="point" style="vertical-align: middle"><strong
									class="point">*</strong>이름</th>
								<td><input type="text" name="cName" id="cName"
									value="<%=loginClient.getcName()%>" required></td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>아이디</th>
								<td><input type="text" value="<%=loginClient.getcId()%>"
									name="cId" id="cId" readonly> 
										</td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>생년월일</th>
								<td>
									<!--  <input check-join-date input-number type="number" name="cBirthYY" id="cBirthYY" min="1900" max="2005" maxlength="4">년                            
                              <input check-join-date input-number type="number" name="cBirthMM" id="cBirthMM" min="01" max="12" maxlength="2" >월                            
                              <input check-join-date input-number type="number" name="cBirthDD" id="cBirthDD" min="01" max="31" maxlength="2"  >일                           
                            -->
								</td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>성별</th>
								<td>
									<%if("M"==loginClient.getcGender()){ %> <input type="radio"
									name="cGender" id="cGender0" value="M" checked> <label
									for="cGender0">남</label> <input type="radio" name="cGender"
									id="cGender1" value="F"> <label for="cGender1">여</label>

									<%} else{ %> <input type="radio" name="cGender" id="cGender0"
									value="M"> <label for="cGender0">남</label> <input
									type="radio" name="cGender" id="cGender1" value="F" checked>
									<label for="cGender1">여</label> <%} %>
								</td>
							</tr>

							<%-- <tr>
								<th class="point"><strong class="point">*</strong>이메일</th>
								<td>
								<input type="text" name="cEmailId" style="IME-MODE: disabled" value="<%=cEmailId %>" id="cEmailId"> @ 
								<input type="text" name="cEmail2" id="cEmail2"style="IME-MODE: disabled" value="<%=cEmailSelect%>"> 
						<select name="cEmailSelect" id="cEmailSelect" onchange="mailChange(this.value,'uemail02');">
							<option id="cEmailSelectnull">메일을 선택하세요</option>
							<option value="naver" <%="naver".equals(cEmailSelect) ? "selected" : ""%>>naver.com</option>
							<option value="hanmail" <%="hanmail".equals(cEmailSelect) ? "selected" : ""%>>hanmail.net</option>
							<option value="nate" <%="nate".equals(cEmailSelect) ? "selected" : ""%>>nate.com</option>
							<option value="gmail" <%="gmail".equals(cEmailSelect) ? "selected" : ""%>>gmail.com</option>
							<option value="hotmail" <%="hotmail".equals(cEmailSelect) ? "selected" : ""%>>hotmail.com</option>
							<option value="writeEmail">직접입력</option>
					</select>
					</td>
							</tr> --%>
							<tr>
								<th class="point"><strong class="point">*</strong>휴대폰번호</th>
								<td><input type="tel" placeholder="(-없이)01012345678"
									name="cPhone" id="cPhone" onkeyup="onlynumber();"
									value='<%=loginClient.getcPhone()%>'> <br /></td>
							</tr>
							<tr>
								<th class="point">지역</th>
								<td><input type="text" name="cAddr" id="cAddr"
									value="<%=loginClient.getcAddr()%>" required> <!-- <td><select name="cAddr" id="cAddr">
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
								</select></td> --></td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>이메일 수신여부</th>
								<td><input type="radio" name="email_auth" value="Y">예
									&nbsp; <input type="radio" name="email_auth" value="N"
									checked="checked">아니요</td>
							</tr>
							<tr>
								<th class="point"><strong class="point">*</strong>SMS 수신여부</th>
								<td><input type="radio" name="sms_auth" value="Y">예
									&nbsp; <input type="radio" name="sms_auth" value="N"
									checked="checked">아니요 &nbsp; <span class="cdf">*
										수신여부에 상관없이 예약관련 문자는 발송됩니다*</span></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="cId"
						value='<%=(String)request.getAttribute("cId")%>' />
					<div class="button">
						<input type="submit" class="btn btn-warning" id="btn-update"
							onclick="updateClient();" value="수정"> <input type="reset"
							onclick="" class="btn btn-warning" value="뒤로가기">
					</div>
					<!-- 전체 테이블 끝 -->
				</form>
				<!-- 전체수정 폼(회원수정) 끝 -->
			
				<br> <br>
				<hr>
		</div>
</section>
</div>

<script>
	function update_validate(){
		return true;
	}
	function updateClient(){
		
		var frm=$('#clientFrm');
		var url="<%=request.getContextPath()%>/client/clientUpdate?cId=<%=loginClient.getcId()%>";
		frm.attr("action",url);
		frm.submit();			
	}
</script>
<%@ include file="/views/common/footer.jsp"%>