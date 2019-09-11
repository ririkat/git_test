a<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client"%>


<%@ include file="/views/common/header.jsp"%>

<section onload="init()">

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
						<%-- 
                        <li><a href="<%=request.getContextPath()%>/client/mypageHome?cId=<%=c.getcId()%>">&nbsp;&nbsp;예약확인/취소</a></li>
                        
                        <li><a href="<%=request.getContextPath()%>/client/myFavoriteRoom?cId=<%=c.getcId()%>">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li  class="active"><a href="<%=request.getContextPath()%>/client/updateClientInfo?cId=<%=c.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=c.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteClient?cId=<%=c.getcId()%>">회원탈퇴</a></li> --%>
                  
                        <li><a href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li class="active"><a href="<%=request.getContextPath()%>/client/infoLoad?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteLoad?cId=<%=loginClient.getcId()%>">회원탈퇴</a></li>
                        
                        
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

				<form id="clientFrm" method="post" onsubmit="return update_validate();">
					<table class="updateTable">
						<colgroup>
							<col width="160px">
							<col width="">
						</colgroup>
						<tbody>
							<tr>
								<th class="point" style="vertical-align: middle"><strong
									class="point">*</strong>이름</th>
								<td><input type="text" name="cName" id="cName" value="<%=loginClient.getcName()%>" required></td>
							</tr>
						<tr>
							<th class="point"><strong class="point">*</strong>아이디</th>
							<td><input type="text" value="<%=loginClient.getcId()%>" name="cId" id="cId" readonly>
							   
							   
			        <!-- Trigger the modal with a button -->
			        <button type="button" id="btn-cIdCheck"class="btn btn-warning" data-toggle="modal" onclick="cIdCheck();" data-target="#cIdCheck">중복확인</button>
			      
			        <!-- Modal -->
			        <div class="modal fade" id="cIdCheck" role="dialog">
			          <div class="modal-dialog modal-sm">
			            <div class="modal-content">
			              <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal">&times;</button>
			                <h4 class="modal-title" text-align="center">아이디 중복확인</h4>
			              </div>
			          
			           
			          
			              <div class="modal-body">
			           <%--       <%
						if (isUseable) {
					        %>
			          
			                <p><strong class="point"><%=loginClient.getcId() %></strong>는 사용할 수 있는 아이디 입니다.</p>
			                <%
			              } else {
	                     	%> --%>
	                     	
	                     	<p><strong class="point"><%=loginClient.getcId() %></strong>는 이미 사용중인 아이디 입니다.</p>
	                     	<br>
		<form action="<%=request.getContextPath()%>/client/checkIdDuplicate"
			method="post" name="checkId">
			<input type="text" name="cId" id="cId" placeholder="아이디를 입력하세요" />&nbsp;&nbsp;
			<button type='button' class="btn btn-warning"  onclick="checkIdDuplicate();">중복검사</button>
		</form>
	<%-- 	<%
			}
		%>
			    --%>          
			             
			             
			              </div>
			              
			           
			              <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			              </div>
			            </div>
			          </div>
			        </div>
   
							
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
	                	<%if("M"==loginClient.getcGender()){ %>
	                    <input type="radio" name="cGender" id="cGender0" value="M" checked>
	                    <label for="cGender0">남</label>
	                   
	                    <input type="radio" name="cGender" id="cGender1" value="F">
	                    <label for="cGender1">여</label>
	                   
	                    <%} else{ %>
	                   
	                    <input type="radio" name="cGender" id="cGender0" value="M">
	                    <label for="cGender0">남</label>
	                   
	                    <input type="radio" name="cGender" id="cGender1" value="F" checked>
	                    <label for="cGender1">여</label>
	                    <%} %>
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
				     <td>
				       <input type="tel" placeholder="(-없이)01012345678" name="cPhone" id="cPhone" 
				       onkeyup="onlynumber();" value='<%=loginClient.getcPhone()%>'>
				       
				       <br/>
				      
				             </td>
	            </tr>

							<tr>
								<th class="point">지역</th>
								<td>
								<input type="text" name="cAddr" id="cAddr" value="<%=loginClient.getcAddr()%>" required>
								<!-- <td><select name="cAddr" id="cAddr">
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
								</select></td> -->
								</td>
							</tr>
							
							 <tr>
                                    <th class="point"><strong class="point">*</strong>이메일 수신여부</th>
                                    <td>
                                        <input type="radio" name="email_auth" value="Y">예 &nbsp;
                                        <input type="radio" name="email_auth" value="N" checked="checked">아니요
                                    </td>
                                </tr>
                                <tr>
                                    <th class="point"><strong class="point">*</strong>SMS 수신여부</th>
                                    <td>
                                        <input type="radio" name="sms_auth" value="Y">예 &nbsp;
                                        <input type="radio" name="sms_auth" value="N" checked="checked">아니요 &nbsp;
                                        <span class="cdf">* 수신여부에 상관없이 예약관련 문자는 발송됩니다*</span>
                                    </td>
                                </tr>


						</tbody>
					</table>

         


				</form>
				
				
				
	<form name="cIdCheckFrm" method="post">
		<input type="hidden" name="cId" value='<%=(String)request.getAttribute("cId")%>'/>
	</form>
				<br>
				<br>
				<div class="button">

					<input type="submit" class="btn btn-warning" id="btn-update"  onclick="updateClient();" value="수정"> 
					<input
						type="reset" onclick="" class="btn btn-warning"  value="뒤로가기">

				</div>


				<hr>
		</div>
</section>

</section>

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