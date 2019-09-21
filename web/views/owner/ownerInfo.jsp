<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>



<section id="enroll-container">
	<div class="tit_contents">업주정보수정</div>
	<br>
	<hr>
	<br>

	<form id="ownerFrm" method="post" onsubmit="return update_validate();">
		<table class="updateTable">
			<colgroup>
				<col width="160px">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th class="point" style="vertical-align: middle"><strong
						class="point">*</strong>이름</th>
					<%
						Date form = new Date();
						SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
						String str = transFormat.format(o.getoBirth());
						String obirthYY = str.substring(0, 4);
						String obirthMM = str.substring(5, 7);
						String obirthDD = str.substring(8, 10);
					%>
					<td><input type="text" name="oName" id="oName"
						value="<%=o.getoName()%>" required></td>
				</tr>
				<tr>
					<th class="point"><strong class="point">*</strong>아이디</th>
					<td><input type="hidden" value="<%=o.getoId()%>" name="oId"
						id="oId" readonly><%=o.getoId()%></td>
				</tr>
				<tr>
					<th class="point"><strong class="point">*</strong>생년월일</th>
					<td><input value="<%=obirthYY%>" check-join-date input-number
						type="number" name="oBirthYY" id="oBirthYY" min="1900" max="2005"
						maxlength="4">년 <input value="<%=obirthMM%>"
						check-join-date input-number type="number" name="oBirthMM"
						id="oBirthMM" min="01" max="12" maxlength="2">월 <input
						value="<%=obirthDD%>" check-join-date input-number type="number"
						name="oBirthDD" id="oBirthDD" min="01" max="31" maxlength="2">일
					</td>
				</tr>

				<tr>
					<th class="point"><strong class="point">*</strong>성별</th>
					<td>
						<%
							if (o.getoGender().trim().equals("M")) {
						%> <input type="radio" name="oGender" id="oGender0" value="M"
						checked> <label for="oGender0">남</label> <input
						type="radio" name="oGender" id="oGender1" value="F"> <label
						for="oGender1">여</label> <%
 	} else {
 %> <input type="radio" name="oGender" id="oGender0" value="M">
						<label for="oGender0">남</label> <input type="radio" name="oGender"
						id="oGender1" value="F" checked> <label for="oGender1">여</label>
						<%
							}
						%>
					</td>
				</tr>

				<tr>
					<th class="point"><strong class="point">*</strong>이메일</th>
					<td>
					<input type="text" name="oEmailId"
						style="IME-MODE: disabled"
						value="<%=o.getoEmail().substring(0, o.getoEmail().indexOf("@"))%>"
						id="oEmailId"> @ <input type="text" name="oEmail2"
						id="oEmail2" style="IME-MODE: disabled" value="<%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1)%>">
						<select name="oEmailSelect" id="oEmailSelect">
							<option id="oEmailSelectnull" value="choice">메일을 선택하세요</option>
							<option value="naver.com"
								<%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1 , o.getoEmail().indexOf(".")).equals("naver") ? "selected" : ""%>>
								네이버</option>
							<option value="hanmail.net"
								<%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1 , o.getoEmail().indexOf(".")).equals("hanmail") ? "selected" : ""%>>
								한메일</option>
							<option value="nate.com"
								<%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1 , o.getoEmail().indexOf(".")).equals("nate") ? "selected" : ""%>>
								네이트</option>
							<option value="gmail.com"
								<%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1 , o.getoEmail().indexOf(".")).equals("gmail") ? "selected" : ""%>>
								지메일</option>
							<option value="hotmail.com"
								<%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1 , o.getoEmail().indexOf(".")).equals("hotmail") ? "selected" : ""%>>
								핫메일</option>
							<option value="writeEmail">직접입력</option>
					</select>
					</td>
				</tr>

				<tr>
					<th class="point"><strong class="point">*</strong>휴대폰번호</th>
					<td><input type="tel" placeholder="(-없이)01012345678"
						name="oPhone" id="oPhone" onkeyup="onlynumber();"
						value='<%=o.getoPhone()%>'> <br /></td>
				</tr>



				<tr>
					<th class="point">주소</th>
					<td>
						<%--<input type="text" name="cAddr" id="cAddr" value="<%=loginClient.getcAddr()%>" required> --%>
						<%-- 							<%System.out.println("테스트: "+ o.getoAddr().substring(o.getoAddr().indexOf("^")+1 ,o.getoAddr().indexOf("|")) ); %> --%>
						<input id="zonecode" name="zonecode" type="text"
						value="<%=o.getoAddr().substring(o.getoAddr().indexOf("우") + 2, o.getoAddr().indexOf("|"))%>"
						style="width: 70px;" readonly /> &nbsp; <input type="button"
						onclick="openDaumZipAddress();" class="btn btn-warning"
						value="주소 찾기" /> <br /> <input type="text" id="address"
						name="address"
						value="<%=o.getoAddr().substring(o.getoAddr().indexOf("|") + 1, o.getoAddr().lastIndexOf("|"))%>"
						style="width: 240px;" required readonly /> <input type="text"
						placeholder="상세주소입력" name="address_etc" id="address_etc"
						value="<%=o.getoAddr().substring(o.getoAddr().lastIndexOf("|") + 1)%>"
						style="width: 200px;" />
					</td>
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



		<input type="hidden" name="oId"
			value='<%=(String) request.getAttribute("oId")%>' />
	</form>






	<br> <br>
	<div class="button">

		<input type="submit" class="btn btn-warning" id="btn-update"
			onclick="updateOwner();" value="수정"> <input type="reset"
			onclick="" class="btn btn-warning" value="뒤로가기">

	</div>


	<hr>
	</div>
</section>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

		$(function(){
			$('#mypageList li').removeClass("active");
			$('#mypageList li').eq(1).addClass("active");
		});

		
		//메일select
		$('#oEmailSelect').change(function(){
				console.log($('#oEmailSelect').val() );
			if($('#oEmailSelect').val()!='writeEmail' && $('#oEmailSelect').val()!='choice'){
				$('#oEmail2').val($('#oEmailSelect').val());
			}
			else
				$('#oEmail2').val("");
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
		return true;
	}
	
	
	function updateOwner(){
		if(confirm('정말로 수정하시겠습니까?')){
			var frm=$('#ownerFrm');
			var url="<%=request.getContextPath()%>/owner/ownerUpdate?oId=<%=o.getoId()%>";
			frm.attr("action", url);
			frm.submit();
		}
	}
</script>

<%@ include file="/views/common/footer.jsp"%>