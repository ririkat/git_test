<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client"%>
<%
	Client c = (Client) request.getAttribute("client");
/* String id = (String)session.getAttribute("cId");  */
 String cEmailSelect = (String)request.getAttribute("cEmailSelect");
    

    
    
%>


<%@ include file="/views/common/header.jsp"%>

<section onload="init()">

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<br> <br>
				<h4 id="mypagetitle">
					<a href="mypage.html" >&nbsp;&nbsp;회원정보수정</a>
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

				<form name="clientFrm" method="post" action=""
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
								<td><input type="hidden" name="cName" id="cName" value="<%=c.getcName()%>" required></td>
							</tr>
						<tr>
							<th class="point"><strong class="point">*</strong>아이디</th>
							<td><input type="text" value="<%=c.getcId()%>" name="cId" id="cId" readonly></td>
						</tr>
				<tr>
                             <th class="point"><strong class="point">*</strong>생년월일</th>
                             <td>
                              <input check-join-date input-number type="number" name="cBirthYY" id="cBirthYY" min="1900" max="2005" maxlength="4">년                            
                              <input check-join-date input-number type="number" name="cBirthMM" id="cBirthMM" min="1" max="12" maxlength="2" >월                            
                              <input check-join-date input-number type="number" name="cBirthDD" id="cBirthDD" min="1" max="31" maxlength="2"  >일                           
                           
                                      
                            </td>
                         </tr>
									
							<tr>
								<th class="point"><strong class="point">*</strong>성별</th>
								<td>
	                	<%if("M"==c.getcGender()){ %>
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
					
						<tr>
								<th class="point"><strong class="point">*</strong>이메일</th>
								<td>
								<input type="text" name="cEmailId" style="IME-MODE: disabled" value="" id="cEmailId"> @ 
								<input type="text" name="email2" id="cEmail2"style="IME-MODE: disabled" value=""> 
								
									
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
							</tr>

				 <tr>
				      <th class="point"><strong class="point">*</strong>휴대폰번호</th>
				     <td>
				       <input type="tel" placeholder="(-없이)01012345678" name="cPhone" id="cPhone" 
				       onkeyup="onlynumber();" value='<%=c.getcPhone()%>'>
				       
				       <br/>
				      
				             </td>
	            </tr>

							<tr>
								<th class="point">지역</th>
								<td><select name="cAddr" id="cAddr">
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

         <input type="hidden" name="cId" value='<%=(String)request.getAttribute("cId")%>'/>


				</form>
				<br>
				<br>
				<div class="button">

					<input type="submit" id="btn-update" onclick="updateClient();" value="수정"> 
					<input
						type="reset" onclick="" value="뒤로가기">

				</div>


				<hr>
		</div>
</section>

</section>

<script>



//메일 뒤에 선택하면 바뀌게 

function mailChange(val,id_name){
	
	obj = document.getElementById(id_name);
	obj.value = val;
	obj.focus();
}

function updateClient(){
	
	var frm=$('#clientFrm');
	var url="<%=request.getContextPath()%>/client/clientUpdate";
	frm.attr("action",url);
	frm.submit();
}


function update_validate(){

	return true;
}

  //화면 전환되면 회원의 이메일 가져옴 

window.onload = function(){
	
	var cEmailSelect = document.getElementsByName("cEmailSelect")[0];
	for(var i = 0;i<cEmailSelect.length;i++){
		if(cEmailSelect[i].value ==="<%=c.getcEmail()%>"){
			cEmailSelect[i].selected = true;
		}
	}
	
	//위에꺼 안뜨면 밑에 로직으로 
	
	/* window.onload=function(){
		
		var cEmailSelect = document.getElementById('cEmailSelect');
		for(i=0, j=selectMail.length ; i<j ; i++){
			
			if(cEmailSelect.options[i].value==val) {
				
				cEmailSelect.options[i].selected=true;
				break;
			}
		}

	} */
	
	
function updateClient(){
	
	  var cBirthYY=$("#cBirthYY").val(); 
	  var cBirthMM=$("#cBirthMM").val();
	  var cBirthDD=$("#cBirthDD").val();
	  var cGender1=$('#cGender1').val();
	  var cGender2=$('#cGender2').val();
	  var cEmailId=$('#cEmailId').val();
	  var cEmail2=$('#cEmail2').val();
	  var cEmailSelectnull=$('#cEmailSelectnull').val();
	  var cAddr=$('#cAddr').val();
	  
		if(cBirthYY==""){
			alert("생년월일을 입력해 주십시오.");
			cBirthYY.focus();
			return;
		}else if(cBirthMM==""){
			alert("생년월일을 입력해 주십시오.");
			cBirthMM.focus();
			return;
		}else if(cBirthMM==""){
			alert("생년월일을 입력해 주십시오.");
			cBirthDD.focus();
			return;	
		}else if(!cGender1.checked&&!cGender2.checked){
			alert("성별을 선택해 주십시오.");
			cGender1.focus();
			return;
		}else if(cEmailId==""){
			alert("이메일을 입력해 주십시오.");
			cEmailId.focus();
			return;
		}else if(!cEmailSelectnull.selected||cEmail2==""){
			alert("이메일을 입력해 주십시오.");
			cEmail2.focus();
			return;
		}else if(cAddr==""){
			alert("주소를 입력해 주십시오.");
			cAddr.focus();
			return;
		}
		
}
			
			
			
			

		


		
		
/* 숫자만 입력받기 */
function only_number() {
    var key = event.keyCode;
    var messageArea = document.getElementById("ssnMessage");

    if (!(key == 8 || key == 9 || key == 13 || key == 46 || key == 144 || (key >= 48 && key <= 57) || (key >=  96 && key <= 105) || key == 110 || key == 190)) {
        alert("숫자만 입력하세요.");
        event.returnValue = false;
    }
}
	
	
	







</script>



<%@ include file="/views/common/footer.jsp"%>