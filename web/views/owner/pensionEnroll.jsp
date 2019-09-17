<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

<%
	String oId = (String)request.getAttribute("oId");
%>


<div class="col-md-10">
<br><br><br>
	<section id="enroll-container">
		<div class="tit_contents">펜션등록</div>
		<br><hr><br>

		<!--  -->
		<form name="addPension" method="post" enctype="multipart/form-data" onsubmit="return enroll_validate();"
			action="<%=request.getContextPath()%>/owner/addPensionEnd">
			<table class="updateTable">
				<colgroup>
					<col width="160px">
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<th class="point" style="vertical-align: middle">
							업주 아이디
						</th>
						<td>
							<%=oId%><input type="hidden" name="oId" value="<%=oId%>">
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 펜션 이름
						</th>
						<td>
							<input type="text" name="pName" id="pName" style="width:200px" required>
						</td>
					</tr>
					
					<tr>
						<th class="point">
							<strong class="point">*</strong> 펜션 소재지
						</th>
						<td>
							<input id="postcode1" name="postcode1" type="text" value="" style="width:50px;" readonly/>
							-
							<input id="postcode2" name="postcode2" type="text" value="" style="width:50px;" readonly/>
							&nbsp;&nbsp;&nbsp;
							<input type="button" onClick="openDaumZipAddress();" value="주소찾기" />
							<br/>
							<input type="text" id="address" name="address" value="" style="width:240px" readonly/>
							<input type="text" id="address_etc" name="address_etc" value="" style="width:200px" placeholder="상세주소"/>
							<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
								//다음 주소 API
								function openDaumZipAddress() {
									new daum.Postcode({
										oncomplete:function(data) {
											jQuery("#postcode1").val(data.postcode1);
											jQuery("#postcode2").val(data.postcode2);
											jQuery("#zonecode").val(data.zonecode);
											jQuery("#address").val(data.address);
											jQuery("#address_etc").focus();
											console.log(data);
										}
									}).open();
								}
							</script>
						</td>
					</tr>
					
					<tr>
						<th class="point"><strong class="point">*</strong> 전화번호</th>
						<td><select name="tel1" id="tel1" style="height:26px">
								<option value="02" selected="">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
							</select>
							-
							<input type="text" name="tel2" id="tel2" maxlength="4" style="width:60px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							-
							<input type="text" name="tel3" id="tel3" maxlength="4" style="width:60px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</td>
					</tr>
					
					<tr>
						<th class="point"><strong class="point">*</strong> 펜션전경사진</th>
						<td>
							<input type="file" name="panorama">
						</td>
					</tr>
					
					<tr>
						<th class="point"> 부대시설</th>
						<td>
							<label><input type="checkbox" name="facilities" value="store">매점</label>
							<label><input type="checkbox" name="facilities" value="wifi">와이파이</label>
							<label><input type="checkbox" name="facilities" value="pet">애견가능</label>
							<label><input type="checkbox" name="facilities" value="pool">공용수영장</label>
							<label><input type="checkbox" name="facilities" value="s_pool">어린이풀장</label>
							<label><input type="checkbox" name="facilities" value="slide">워터슬라이드</label>
							<label><input type="checkbox" name="facilities" value="open_bath">노천탕</label>
							<br/>
							<label><input type="checkbox" name="facilities" value="grill">그릴</label>
							<label><input type="checkbox" name="facilities" value="smoked">바베큐세트</label>
							<label><input type="checkbox" name="facilities" value="cafe">카페</label>
							<label><input type="checkbox" name="facilities" value="sing">노래방</label>
							<label><input type="checkbox" name="facilities" value="foot">족구장</label>
							<label><input type="checkbox" name="facilities" value="hand">농구장</label>
							<label><input type="checkbox" name="facilities" value="car">주차장</label>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div class="button">
                <input type="submit" value="등록">
            </div>
		</form>

	</section>
</div>


<script>
	function enroll_validate(){
		//펜션이름 빈칸
		if (addPension.pName.value == "") {
			alert("이름을 입력해 주세요.");
			pName.focus();
			return false;
		}

		//주소 빈칸
		if (addPension.postcode1.value == "" || addPension.postcode2.value == "" || addPension.address.value == "") {
			alert("우편번호를 입력해 주세요.");
			postcode1.focus();
			return false;
		}
		if (addPension.address_etc.value == "") {
			alert("상세주소를 입력해 주세요.");
			address_etc.focus();
			return false;
		}
		
		//번호 빈칸
		if (addPension.tel2.value == "" || addPension.tel3.value == "") {
			alert("전화번호를 바르게 입력해 주세요.");
			tel2.focus();
			return false;
		}
		
		//첨부파일 없음
		if (addPension.panorama.value == "") {
			alert("첨부파일(펜션전경사진)을 추가해 주세요.");
			return false;
		}
	}
</script>



<%@ include file="/views/common/footer.jsp"%>