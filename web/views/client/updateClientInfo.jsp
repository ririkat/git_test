a<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>


<%@ include file="/views/common/header.jsp"%>

<%

Client c=(Client)request.getAttribute("client");

Date form = new Date();
SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
String str = transFormat.format(c.getcBirth());
String cBirthYY=str.substring(0, 4);
String cBirthMM=str.substring(5,7);
String cBirthDD=str.substring(8, 10);

%>

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
								<td><input type="text" name="cName" id="cName" value="<%=c.getcName()%>" required></td>
							</tr>
						<tr>
							<th class="point"><strong class="point">*</strong>아이디</th>
							<td><input type="hidden" value="<%=c.getcId()%>" name="cId" id="cId" readonly><%=c.getcId()%>
					   
									
							</td>
						</tr>
				 <tr>
                             <th class="point"><strong class="point">*</strong>생년월일</th>
                             <td>
                              <input value="<%=cBirthYY %>" check-join-date input-number type="number" name="cBirthYY" id="cBirthYY" min="1900" max="2005" maxlength="4" >년                            
                              <input value="<%=cBirthMM %>" check-join-date input-number type="number" name="cBirthMM" id="cBirthMM" min="01" max="12" maxlength="2" >월                            
                              <input value="<%=cBirthDD %>" check-join-date input-number type="number" name="cBirthDD" id="cBirthDD" min="01" max="31" maxlength="2"  >일                           
                            
                            
                            
                                      
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
				       onkeyup="onlynumber();" value='<%=c.getcPhone()%>'>
				       
				       <br/>
				      
				             </td>
	            </tr>



						 <tr>
                        <th class="point">지역</th>
                        <td>
                      <%--<input type="text" name="cAddr" id="cAddr" value="<%=loginClient.getcAddr()%>" required> --%>
							<%System.out.println("테스트: "+ c.getcAddr().substring(c.getcAddr().indexOf("^")+1 ,c.getcAddr().indexOf("|")) ); %>
						   <input id="zonecode" name="zonecode" type="text" value="<%=c.getcAddr().substring(c.getcAddr().indexOf("우")+2, c.getcAddr().indexOf("|"))%>" style="width:70px;" readonly/>
						   &nbsp;
						   <input type="button"  onclick="openDaumZipAddress();" class="btn btn-warning" value = "주소 찾기" />
						   <br/>
						   <input type="text" id="address" name="address" value="<%=c.getcAddr().substring(c.getcAddr().indexOf("|")+1 ,c.getcAddr().lastIndexOf("|"))%>" style="width:240px;"  required  readonly/>
						   <input type="text" placeholder="상세주소입력"  name="address_etc" id="address_etc" value="<%=c.getcAddr().substring(c.getcAddr().lastIndexOf("|")+1)%>" style="width:200px;"/>
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

<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//주소 API
			$(function(){
			$('#mypageList li').removeClass("active");
			$('#mypageList li').eq(2).addClass("active");
		});

		//주소 API
		function openDaumZipAddress() {
		new daum.Postcode({
		   oncomplete:function(data) {
		   /*    jQuery("#postcode1").val(data.postcode1);
		      jQuery("#postcode2").val(data.postcode2); */
		      jQuery("#zonecode").val(data.zonecode);
		      jQuery("#address").val(data.address);
		      jQuery("#address_etc").val("");
		      jQuery("#address_etc").focus();
		      console.log(data);
		  	 }
			}).open();
		}
	
	 function update_validate(){
		
		 /* var cBirthYY=$("#cBirthYY").val(); 
		  var cBirthMM=$("#cBirthMM").val();
		  var cBirthDD=$("#cBirthDD").val();
		  var cGender1=$('#cGender1').val();
		  var cGender2=$('#cGender2').val();
		  var cEmailId=$('#cEmailId').val();
		  var cEmail2=$('#cEmail2').val();
		  var cEmailSelectnull=$('#cEmailSelectnull').val();
		  var cAddr=$('#cAddr').val();
		  var cPhone=$('#cPhone').val();
		  
			if(cBirthYY==""){
				alert("생년월일을 입력해 주십시오.");
				cBirthYY.focus();
				return false;
				
			}else if(cBirthMM==""){
				alert("생년월일을 입력해 주십시오.");
				cBirthMM.focus();
				return false;
			}else if(cBirthMM==""){
				alert("생년월일을 입력해 주십시오.");
				cBirthDD.focus();
				return false;
			}else if(!cGender1.checked&&!cGender2.checked){
				alert("성별을 선택해 주십시오.");
				cGender1.focus();
				return false; */
			/* }else if(cEmailId==""){
				alert("이메일을 입력해 주십시오.");
				cEmailId.focus();
				return false; */
			/* }else if(!cEmailSelectnull.selected||cEmail2==""){
				alert("이메일을 입력해 주십시오.");
				cEmail2.focus();
				return false; */
	/* 		}else if(cAddr==""){
				alert("주소를 입력해 주십시오.");
				cAddr.focus();
				return false;
			}else if(cPhone==""){
				alert("휴대폰 번호를 입력해 주십시오.");
				cPhone.focus();
				return false;
				
			} */
	
		return true;
	}
	
	
	 function updateClient(){
			if(confirm('정말로 수정하시겠습니까?')){
				var frm=$('#clientFrm');
				var url="<%=request.getContextPath()%>/client/clientUpdate?cId=<%=c.getcId()%>";
				frm.attr("action",url);
				frm.submit();			
			}
		}
	

	 // 휴대폰번호에 숫자만 입력받게 

	 function onlynumber() {

		var regexp = /^[0-9]*$/


		v = $('#cPhone').val();

		if( !regexp.test(v) ) {

			alert("숫자만 입력하세요.");

			$('#cPhone').val(v.replace(regexp,""));
		    $('#cPhone').val("");

		}

		}
	 

	//메일 뒤에 선택하면 바뀌게 

	function mailChange(val,id_name){
		
		obj = document.getElementById(id_name);
		obj.value = val;
		obj.focus();
	}

	










</script>













<%@ include file="/views/common/footer.jsp"%>