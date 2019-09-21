<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.RoomFile, com.jb.pension.model.vo.RoomFacilities" %>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

<%
	String rNo = (String)request.getAttribute("rNo");
	String pCode = (String)request.getAttribute("pCode");
	String imgSrc = (String)request.getAttribute("imgSrc");
	String pName = (String)request.getAttribute("pName");
	String rName = (String)request.getAttribute("rName");
	String rNop = (String)request.getAttribute("rNop");
	String rMaxNop = (String)request.getAttribute("rMaxNop");
	String rPrice = (String)request.getAttribute("rPrice");
	String rAddPrice = (String)request.getAttribute("rAddPrice");
	String rSize = (String)request.getAttribute("rSize");
	String rStruc = (String)request.getAttribute("rStruc");
	String rInfo = (String)request.getAttribute("rInfo");
	List<RoomFile> rImgs = (List)request.getAttribute("rImgs");
	RoomFacilities rfc = (RoomFacilities)request.getAttribute("rFacs");
%>

<div class="col-md-10">
<br><br><br>
	<section id="enroll-container">
		<div class="tit_contents">객실수정</div>
		<br><hr><br>

		<form name="modifyRoom" method="post" enctype="multipart/form-data" onsubmit="return modify_validate();"
			action="<%=request.getContextPath()%>/owner/modifyRoomEnd">
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
							<%=pCode%><input type="hidden" name="pCode" value="<%=pCode%>">
							<input type="hidden" name="imgSrc" value="<%=imgSrc%>">
							<input type="hidden" name="rNo" value="<%=rNo%>">
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
							<input type="text" name="rName" id="rName" value="<%=rName %>" style="width:200px" required>
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 기준인원
						</th>
						<td>
							<input type="text" name="rNop" id="rNop" value="<%=rNop %>" maxlength="2" style="width:50px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>명
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 최대인원
						</th>
						<td>
							<input type="text" name="rMaxNop" id="rMaxNop" value="<%=rMaxNop %>" maxlength="2" style="width:50px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>명
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 가격
						</th>
						<td>
							<input type="text" name="rPrice" id="rPrice" value="<%=rPrice %>" style="width:100px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>원
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 추가인원당 추가요금
						</th>
						<td>
							<input type="text" name="rAddPrice" id="rAddPrice" value="<%=rAddPrice %>" style="width:100px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>원
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							<strong class="point">*</strong> 객실 평수
						</th>
						<td>
							<input type="text" name="rSize" id="rSize" value="<%=rSize %>" maxlength="3" style="width:50px"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>평
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							객실구조
						</th>
						<td>
							<input type="text" name="rStruc" id="rStruc" value="<%=rStruc %>" style="width:500px">
						</td>
					</tr>
					
					<tr>
						<th class="point" style="vertical-align: middle">
							객실설명
						</th>
						<td>
							<input type="text" name="rInfo" id="rInfo" value="<%=rInfo %>" style="width:500px">
						</td>
					</tr>
					
					<tr>
						<th class="point"><strong class="point">*</strong> 객실사진</th>
						<td>
							<input type="button" id="fakeBtn" value="파일추가">
						</td>
					</tr>
					
					<tr>
						<th class="point"> 부대시설</th>
						<td>
							<label><input type="checkbox" name="facilities" value="bed" <%=rfc.getBed().equals("Y")?"checked":""%>>침대</label>
							<label><input type="checkbox" name="facilities" value="dressTable" <%=rfc.getDressTable().equals("Y")?"checked":""%>>화장대</label>
							<label><input type="checkbox" name="facilities" value="table" <%=rfc.getTable().equals("Y")?"checked":""%>>테이블</label>
							<label><input type="checkbox" name="facilities" value="sofa" <%=rfc.getSofa().equals("Y")?"checked":""%>>소파</label>
							<label><input type="checkbox" name="facilities" value="dressCase" <%=rfc.getDressCase().equals("Y")?"checked":""%>>옷장</label>
							<label><input type="checkbox" name="facilities" value="bath" <%=rfc.getBath().equals("Y")?"checked":""%>>욕조</label>
							<label><input type="checkbox" name="facilities" value="spa" <%=rfc.getSpa().equals("Y")?"checked":""%>>스파</label>
							<label><input type="checkbox" name="facilities" value="washKit" <%=rfc.getWashKit().equals("Y")?"checked":""%>>세면도구</label>
							<br/>
							<label><input type="checkbox" name="facilities" value="tv" <%=rfc.getTv().equals("Y")?"checked":""%>>TV</label>
							<label><input type="checkbox" name="facilities" value="beam" <%=rfc.getBeam().equals("Y")?"checked":""%>>빔프로젝터</label>
							<label><input type="checkbox" name="facilities" value="aircon" <%=rfc.getAircon().equals("Y")?"checked":""%>>에어컨</label>
							<label><input type="checkbox" name="facilities" value="fridge" <%=rfc.getFridge().equals("Y")?"checked":""%>>냉장고</label>
							<label><input type="checkbox" name="facilities" value="cookFac" <%=rfc.getCookFac().equals("Y")?"checked":""%>>조리시설</label>
							<label><input type="checkbox" name="facilities" value="cookUten" <%=rfc.getCookUten().equals("Y")?"checked":""%>>조리기구</label>
							<br/>
							<label><input type="checkbox" name="facilities" value="rice" <%=rfc.getRice().equals("Y")?"checked":""%>>밥솥</label>
							<label><input type="checkbox" name="facilities" value="microwave" <%=rfc.getMicrowave().equals("Y")?"checked":""%>>전자레인지</label>
							<label><input type="checkbox" name="facilities" value="rSmoked" <%=rfc.getrSmoked().equals("Y")?"checked":""%>>개별바베큐</label>
							<label><input type="checkbox" name="facilities" value="child" <%=rfc.getChild().equals("Y")?"checked":""%>>유아시설</label>
							<label><input type="checkbox" name="facilities" value="oView" <%=rfc.getoView().equals("Y")?"checked":""%>>오션뷰</label>
							<label><input type="checkbox" name="facilities" value="iPool" <%=rfc.getiPool().equals("Y")?"checked":""%>>인피니티풀</label>
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
	$(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/owner/rImgsDelete",
			type:"post",
			data:{rNo:"<%=rNo%>"},
			dataType:"html",
			success:function(data){console.log("원본삭제완료")},
			error:function(data){console.log("원본삭제실패")}
		})
	})
	
	$("#fakeBtn").click(function(){
		var addBtn = $('<input>').attr({"type":"button", "id":"addFile", "value":"파일추가"});
		var input = $('<input>').attr({"type":"file", "name":"roomImg"});
		$("#fakeBtn").parent().append(addBtn);
		$("#addFile").parent().append(input);
		$("#fakeBtn").attr({"style":"display:none"});
		
		$("#addFile").click(function(){
			var input = $('<input>').attr({"type":"file", "name":"roomImg"});
			$(this).parent().append(input);
		})
	})
	

	//첨부파일 없음
	function modify_validate(){
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