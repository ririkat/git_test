<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

<%
	String pCode = (String)request.getAttribute("pCode");
	String oId = (String)request.getAttribute("oId");
	String pName = (String)request.getAttribute("pName");
	String pAddr = (String)request.getAttribute("pAddr");
%>


<div class="col-md-10">
<br><br><br>
	<section id="enroll-container">
		<div class="tit_contents">펜션정보 수정</div>
		<br><hr><br>

		<!--  -->
		<form name="modifyPension" method="post" enctype="multipart/form-data" onsubmit="return modify_validate();"
			action="<%=request.getContextPath()%>/owner/modifyPensionEnd">
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
							펜션 코드
						</th>
						<td>
							<%=pCode%><input type="hidden" name="pCode" value="<%=pCode%>">
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							펜션 이름
						</th>
						<td>
							<%=pName %><input type="hidden" name="pName" id="pName" style="width:200px" value="<%=pName%>">
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							펜션 소재지
						</th>
						<td>
							<%=pAddr %><input type="hidden" name="pAddr" style="width:200px" value="<%=pAddr%>">
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
                <input type="submit" value="수정">
            </div>
		</form>

	</section>
</div>


<script>
	function modify_validate(){
		//번호 빈칸
		if (modifyPension.tel2.value == "" || modifyPension.tel3.value == "") {
			alert("전화번호를 바르게 입력해 주세요.");
			tel2.focus();
			return false;
		}
		
		//첨부파일 없음
		if (modifyPension.panorama.value == "") {
			alert("첨부파일(펜션전경사진)을 추가해 주세요.");
			return false;
		}
	}
</script>



<%@ include file="/views/common/footer.jsp"%>