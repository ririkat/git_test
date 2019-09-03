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
								<td><input type="hidden" name="cId"
									value="<%=c.getcId()%>" required></td>
							</tr>
							<tr>
                                    <th class="point"><strong class="point">*</strong>생년월일</th>
                                    <td>
                                            <input check-join-date input-number type="number" name="cBirthYY" class="" min="1900" max="2005" maxlength="4">년                            
                                            <input check-join-date input-number type="number" name="cBirthMM" class="" min="1" max="12" maxlength="2" >월                            
                                            <input check-join-date input-number type="number" name="cBirthDD" class="" min="1" max="31" maxlength="2"  >일                           
                                         
                                             
                                            </td>
                                </tr>
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
									style="IME-MODE: disabled" value="<%=c.getcEmailSelect()%>"> 
									
									
									
									<select
									name="cEmailSelect" id="cEmailSelect"
									onchange="mailChange(this.value,'uemail02');">
										<option>메일을 선택하세요</option>
										<option value="naver" <%="naver".equals(cEmailSelect) ? "selected" : ""%>>naver.com</option>
										<option value="hanmail" <%="hanmail".equals(cEmailSelect) ? "selected" : ""%>>hanmail.net</option>
										<option value="nate" <%="nate".equals(cEmailSelect) ? "selected" : ""%>>nate.com</option>
										<option value="gmail" <%="gmail".equals(cEmailSelect) ? "selected" : ""%>>gmail.com</option>
										<option value="hotmail" <%="hotmail".equals(cEmailSelect) ? "selected" : ""%>>hotmail.com</option>
										<option value="writeEmail">직접입력</option>
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
							 <tr>
                                    <th class="point"><strong class="point">*</strong>이메일 수신여부</th>
                                    <td>
                                        <input type="radio" name="email_auth" value="Y">예
                                        &nbsp;
                                        <input type="radio" name="email_auth" value="N" checked="checked">아니요
                                    </td>
                                </tr>
                                <tr>
                                    <th class="point"><strong class="point">*</strong>SMS 수신여부</th>
                                    <td>
                                        <input type="radio" name="sms_auth" value="Y">예
                                        &nbsp;
                                        <input type="radio" name="sms_auth" value="N" checked="checked">아니요
                                        &nbsp;<span class="cdf">* 수신여부에 상관없이 예약관련 문자는 발송됩니다*</span>
                                    </td>
                                </tr>


						</tbody>
					</table>

 <input type="hidden" name="cId" value='<%=(String)request.getAttribute("cId")%>'/>


				</form>
				<br>
				<br>
				<div class="button">

					<input type="submit" onclick="updateClient();" value="수정"> 
					<input
						type="reset" onclick="location.href='mypage.html' " value="취소">

				</div>


				<hr>
		</div>
</section>

</section>

<script>

//메일 뒤에바뀌게 

function mailChange(val,id_name){
	obj = document.getElementById(id_name);
	obj.value = val;
	obj.focus();
}

function updateClient(){
	
	var frm=$('#clientFrm');
	var url="<%=request.getContextPath()%>/client/clientUpdate";
}


<%-- window.onload = function(){
	//이메일가져오기
	var emailSite = document.getElementsByName("email3")[0];
	for(var i = 0;i<emailSite.length;i++){
		if(emailSite[i].value ==="<%=c.getcEmail()%>"){
			emailSite[i].selected = true;
		}
	} --%>
	
	/* var pattern = /^[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
    if(!pattern.test(document.form1.email3.value)){ 
      
        document.form1.email3.focus(); 
        return; 
    } 
    var email = document.form1.email1.value + "@" + document.form1.email3.value; 
} else { 
    var email = document.form1.email1.value + "@" + document.form1.email2.value; 
} */
	
	
/* function checkphone(input_obj, num, title, require) {
    var regexp = /^(0\d{1,2}|\d{3,4})-?\d{3,4}-?\d{4}$/;
    var msg_string = '';
    if (regexp.test(num) || require === false) {
        return true;
    }
 */
   
	
	function init(){
		
	setEmail("<%=c.getcEmailSelect()%>");
	
	}
	
	function setEmail(val){
		
		var selectEmail = document.getElementById('cEmailSelect');
		for(i=0, j=selectMail.length ; i<j ; i++){
			
			if(selectEmail.options[i].value==val) {
				
				selectEmail.options[i].selected=true;
				break;
			}
		}

		
	}
	
	
function updateClient()
{

		var form=document.clientFrm;

		if(form.cBirth.value==""){
				alert("생년월일을 입력해 주십시오.");
				form.ubirth.focus();
				return;
		}
		else if(!form.cGender[0].checked && !form.cGender[1].checked){
				alert("성별을 선택해 주십시오.");
				form.cGender[0].focus();
				return;
		}

		//수정이라 비밀번호를 수정해야만 스크립트 작동함
		else if((form.cPw.value =="") && form.cPw.value && form.cPwNew.value){
				alert("비밀번호를 입력해 주십시오.");
				form.cPw.focus();
				return;
		}
		else if((form.cPw.value.length < 6) && form.cPw.value && form.cPwNew.value){
				alert("비밀번호는 6자리 이상 입력해 주십시오");
				form.cPw.focus();
				return;
		}
		else if((form.cPwNew.value =="") && form.cPw.value && form.cPwNew.value){
				alert("비밀번호 확인을 입력해 주십시오.");
				form.cPwNew.focus();
				return;
		}
		else if((form.cPwNew.value.length < 6) && form.cPw.value && form.cPwNew.value){
				alert("비밀번호는 4자리 이상 입력해 주십시오");
				form.cPwNew.focus();
				return;
		}
		else if((form.cPw.value !=form.cPwNew.value) && form.cPw.value && form.cPwNew.value){
				alert("비밀번호가 올바르지 않습니다.");
				form.cPw.focus();
				return;
		}

		//////////////////////////// 비밀번호 수정 /////



/*
		else if(form.zip1.value==""){
				alert("주소를 입력해 주십시오.");
				popContents('form1', 'zip1', 'zip2', 'addr1');
				return;
		}

		
		
/* 숫자만 입력받기 */
function only_number() {
    var key = event.keyCode;
    var messageArea = document.getElementById("ssnMessage");

    if (!(key == 8 || key == 9 || key == 13 || key == 46 || key == 144 || (key >= 48 && key <= 57) || (key >=  96 && key <= 105) || key == 110 || key == 190)) {
        alert("Please enter telephone number with only numbers.");
        event.returnValue = false;
    }
}
	
	
	







</script>



<%@ include file="/views/common/footer.jsp"%>