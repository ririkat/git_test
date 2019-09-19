<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.Pension" %>
<%
	List<Pension> list=(List)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<div class="container">
	<h2 class="text-center">펜션 검색</h2>
		<!--리스트컨테이너-->
		<div class="row">
			<!--검색바-->
			<div class="col-xs-12">
				<div id="search-container">
					<form method="get" action="<%=request.getContextPath()%>/search/pensionFinder" onsubmit="return find_validate();">
						<table class="table table-bordered">
							<colgroup>
								<col width="10%" >
								<col width="90%" >
							</colgroup>
							<tbody>
							<tr>
								<th class="text-center">펜션 옵션</th>
								<td class="text-left" id="pen_fac">
										<label for="pen_fac">
											<input type="checkbox"  id="pf_all" value="all">전체선택
										</label>
										<label for="pen_fac">
											<input type="checkbox"  id="pf_not" value="not">선택안함
										</label>
										<br>
										<div class="thumbnail" style="margin:0px;">
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="STORE">매점
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="WIFI">와이파이
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="PET">애견가능
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="POOL">공용수영장
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="S_POOL">어린이풀장
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="SLIDE">워터슬라이드
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="OPEN_BATH">노천탕
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="GRILL">그릴
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="SMOKED">바베큐
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="CAFE">카페
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="SING">노래방
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="FOOT">족구장
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac"value="HAND">농구장
											</label>
											<label for="pen_fac">
												<input type="checkbox" name="pen_fac" value="CAR">주차장
											</label>
										</div>
										
								</td>
							</tr>
							<tr>
								<th class="text-center">방 옵션</th>
								<td class="text-left" id="room_fac">
									<label for="room_fac">
											<input type="checkbox" id="rf_all" value="all">전체선택
									</label>
									<label for="room_fac">
											<input type="checkbox" id="rf_not" value="not">선택안함
									</label>
										<br>
									<div class="thumbnail" style="margin:0px;">
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="BED">침대
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="DRESS_TABLE">화장대
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="TABLE">테이블
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="SOFA">소파
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="DRESS_CASE">옷장
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="BATH">욕조
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="SPA">스파
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="WASH_KIT">세면도구
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="TV">티비
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="BEAM">빔프로젝터
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="AIRCON">에어컨
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="FRIDGE">냉장고
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="COOK_FAC">조리시설
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="COOK_UTEN">조리기구
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="RICE">밥솥
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="MICROWAVE">전자레인지
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="R_SMOKED">개별바베큐
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="CHILD">유아시설
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="O_VIEW">오션뷰
									</label>
									<label for="room_fac">
										<input type="checkbox" name="room_fac" value="I_POOL">인피니티풀
									</label>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									지역 <input type="text" name="area" placeholder="지역입력" style="width:15%;" />&nbsp;&nbsp;
									펜션명 <input type="text" name="keyword" placeholder="키워드를 입력하세요 ex)사랑 -> 사랑펜션" style="width:40%;"/>&nbsp;&nbsp;
									인원수 <input type="number" name="nop" id="nop" class="" min="1" max="50" value="1">   
									<br>
									
								</td>
							</tr>
							</tbody>
						</table>
						<input class="btn my-btn" type="submit" value="검색" style="width:100%"/>
					</form>
				</div>
			</div>
		</div>
		<br><br><br><br>
		<h2>검색 결과</h2>
		<hr>
		<div class="row">
			<!--한 행에 들어갈 아이들-->
			<div class="col-sm-12 col-md-12">
				<div class="row">
					<!-- 여기부터 포문 돌려~~ -->
					<%if(list!=null){ 
					for(int i=0; i<list.size(); i++){%>
					<!-- 펜션하나~~ for문 돌려서 알아서 잘 써라잉~~~~-->
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="<%=request.getContextPath()%>/upload/pension/<%=list.get(i).getPenFile().get(0).getpRenameFile()%>"
								alt="이미지준비중" style="width:500px; height:300px;">
							<div class="caption">
								<h3><%=list.get(i).getpName() %></h3>
								<p><%=list.get(i).getpAddr() %></p>
								<p>
									<a href="#" class="btn my-btn" role="button">찜♥</a>
									<a href="<%=request.getContextPath()%>/search/detailView?pCode=<%=list.get(i).getpCode() %>"
										class="btn btn-default" role="button">예매상세</a>
								</p>
							</div>
						</div>
					</div>
					<!--  -->
					<!-- 여기가 포문 끝~~ -->
					<%}
				}%>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
$(document).ready(function(){
	$("#pf_all").click(function(){
		 if ($("#pf_all").is(':checked')) {
             $("input[name=pen_fac]").prop("checked", true);
             $("input[name=pen_fac]").click(function(){
            	 $("#pf_all").prop("checked", false);
        	})
        	
         } else {
             $("input[name=pen_fac]").prop("checked", false);
         }
		 if ($("#pf_not").is(':checked')){
			 $("#pf_not").prop("checked", false);
		 }
	})
	$("#rf_all").click(function(){
		 if ($("#rf_all").is(':checked')) {
             $("input[name=room_fac]").prop("checked", true);
             $("input[name=room_fac]").click(function(){
            	 $("#rf_all").prop("checked", false);
        	})
         } else {
             $("input[name=room_fac]").prop("checked", false);
         }
		 if ($("#rf_not").is(':checked')){
			 $("#rf_not").prop("checked", false);
		 }
	})
	$("#pf_not").click(function(){
		 if ($("#pf_not").is(':checked')) {
             $("input[name=pen_fac]").prop("checked", false);
             $("#pf_all").prop("checked", false);
             $("input[name=pen_fac]").click(function(){
            	 $("#pf_not").prop("checked", false);
        	})
         }
	})
	$("#rf_not").click(function(){
		 if ($("#rf_not").is(':checked')) {
             $("input[name=room_fac]").prop("checked", false);
             $("#rf_all").prop("checked", false);
             $("input[name=room_fac]").click(function(){
            	 $("#rf_not").prop("checked", false);
        	})
         }
	})
})

function find_validate(){
	if($("#nop").val()==""){
		$("#nop").val(1);
	}
	
	return true;
}
	
</script>

<%@ include file="/views/common/footer.jsp"%>