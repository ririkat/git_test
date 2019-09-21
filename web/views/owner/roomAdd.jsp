<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

<%
	String imgSrc = (String)request.getAttribute("imgSrc");
	String pCode = (String)request.getAttribute("pCode");
	String pName = (String)request.getAttribute("pName");
%>

<div class="col-md-10">
<br><br><br>
	<section id="enroll-container">
		<div class="tit_contents">객실추가</div>
		<br><hr><br>

		<form name="addRoom" method="post" enctype="multipart/form-data" onsubmit="return add_validate();"
			action="<%=request.getContextPath()%>/owner/addRoomEnd">
			<table class="updateTable">
				<colgroup>
					<col width="160px">
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<th class="point" style="vertical-align: middle">
							펜션 코드
						</th>
						<td>
							<%=pCode%><input type="hidden" name="pCode" value="<%=pCode%>"><input type="hidden" name="imgSrc" value="<%=imgSrc%>">
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							펜션 이름
						</th>
						<td>
							<%=pName%><input type="hidden" name="pName" value="<%=pName%>">
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 객실명
						</th>
						<td>
							<input type="text" name="rName" id="rName" style="width:200px" required>
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 기준인원
						</th>
						<td>
							<input type="text" name="rNop" id="rNop" maxlength="2" style="width:50px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>명
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 최대인원
						</th>
						<td>
							<input type="text" name="rMaxNop" id="rMaxNop" maxlength="2" style="width:50px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>명
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 가격
						</th>
						<td>
							<input type="text" name="rPrice" id="rPrice"  style="width:100px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>원
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 추가인원당 추가요금
						</th>
						<td>
							<input type="text" name="rAddPrice" id="rAddPrice" style="width:100px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>원
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 객실 평수
						</th>
						<td>
							<input type="text" name="rSize" id="rSize" maxlength="3" style="width:50px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>평
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							객실구조
						</th>
						<td>
							<input type="text" name="rStruc" id="rStruc" style="width:500px">
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							객실설명
						</th>
						<td>
							<input type="text" name="rInfo" id="rInfo" style="width:500px">
						</td>
					</tr>
					
					<tr>
						<th class="point"><strong class="point">*</strong> 객실사진</th>
						<td>
							<input type="button" id="addFile" value="파일추가">
						</td>
					</tr>
					
					<tr>
						<th class="point"> 부대시설</th>
						<td>
							<label><input type="checkbox" name="facilities" value="bed">침대</label>
							<label><input type="checkbox" name="facilities" value="dressTable">화장대</label>
							<label><input type="checkbox" name="facilities" value="table">테이블</label>
							<label><input type="checkbox" name="facilities" value="sofa">소파</label>
							<label><input type="checkbox" name="facilities" value="dressCase">옷장</label>
							<label><input type="checkbox" name="facilities" value="bath">욕조</label>
							<label><input type="checkbox" name="facilities" value="spa">스파</label>
							<label><input type="checkbox" name="facilities" value="washKit">세면도구</label>
							<br/>
							<label><input type="checkbox" name="facilities" value="tv">TV</label>
							<label><input type="checkbox" name="facilities" value="beam">빔프로젝터</label>
							<label><input type="checkbox" name="facilities" value="aircon">에어컨</label>
							<label><input type="checkbox" name="facilities" value="fridge">냉장고</label>
							<label><input type="checkbox" name="facilities" value="cookFac">조리시설</label>
							<label><input type="checkbox" name="facilities" value="cookUten">조리기구</label>
							<br/>
							<label><input type="checkbox" name="facilities" value="rice">밥솥</label>
							<label><input type="checkbox" name="facilities" value="microwave">전자레인지</label>
							<label><input type="checkbox" name="facilities" value="rSmoked">개별바베큐</label>
							<label><input type="checkbox" name="facilities" value="child">유아시설</label>
							<label><input type="checkbox" name="facilities" value="oView">오션뷰</label>
							<label><input type="checkbox" name="facilities" value="iPool">인피니티풀</label>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div class="button">
                <input type="submit" value="등록">
                <input type="reset" value="취소">
            </div>
		</form>

	</section>
</div>


<script>
	$("#addFile").click(function(){		
		var input = $('<input>').attr({"type":"file", "name":"roomImg"});
		$(this).parent().append(input);
	})

	//첨부파일 없음
	function add_validate(){
		if ($('input[type="file"]').length<=0) {
			alert("첨부파일(객실사진)을 추가해 주세요.");
			return false;
		}		
		else{
			var cnt = 0;
			$('input[type="file"]').each(function(idx,item){
				if($(this).val()==""){
					alert("첨부파일(객실사진)을 업로드해 주세요.");
					cnt++;
					return false;
				}
			});
			if(cnt>0){
				return false;
			}
		}
	}
</script>



<%@ include file="/views/common/footer.jsp"%>