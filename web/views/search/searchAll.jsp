<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.Pension" %>
<%
	List<Pension> list=(List)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<div class="container">
		<!--리스트컨테이너-->
		<div class="row">
			<!--검색바-->
			<div class="col-md-12">
				<div id="search-container">
					<form method="get" action="<%=request.getContextPath()%>/search/pensionFinder">
						<table>
							<colgroup>
								<col width="10%">
								<col width="">
							</colgroup>
							<tr>
								<th class="text-center">펜션 옵션</th>
								<td class="checkbox pull-left" id="pen_fac">
										<label>
											<input type="checkbox" name="pen_fac" value="STORE">매점
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="WIFI">와이파이
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="PET">애견가능
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="POOL">공용수영장
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="S_POOL">어린이풀장
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="SLIDE">워터슬라이드
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="OPEN_BATH">노천탕
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="GRILL">그릴
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="SMOKED">바베큐
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="CAFE">카페
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="SING">노래방
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="FOOT">족구장
										</label>
										<label>
											<input type="checkbox" name="pen_fac"value="HAND">농구장
										</label>
										<label>
											<input type="checkbox" name="pen_fac" value="CAR">주차장
										</label>
								</td>
							</tr>
							<tr>
								<th class="text-center">방 옵션</th>
								<td class="checkbox pull-left" id="room_fac">
									<label>
										<input type="checkbox" name="room_fac" value="BED">침대
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="DRESS_TABLE">화장대
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="RTABLE">테이블
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="SOFA">소파
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="DRESS_CASE">옷장
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="BATH">욕조
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="SPA">스파
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="WASH_KIT">세면도구
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="TV">티비
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="BEAM">빔프로젝터
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="AIRCON">에어컨
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="FRIDGE">냉장고
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="COOK_FAC">조리시설
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="COOK_UTEN">조리기구
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="RICE">밥솥
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="MICROWAVE">전자레인지
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="R_SMOKED">개별바베큐
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="CHILD">유아시설
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="O_VIEW">오션뷰
									</label>
									<label>
										<input type="checkbox" name="room_fac" value="I_POOL">인피니티풀
									</label>
								</td>
							</tr>

						</table>
						<div class="checkbox" id="pen_fac">

							<hr>

						</div>

						<input type="text" name="keyword" placeholder="방 or펜션 이름을 입력하세요" />
						<input type="text" name="area" placeholder="지역입력" />

					<input type="submit" value="검색" />
					</form>
				</div>
			</div>
		</div>
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
									<a href="#" class="btn btn-primary" role="button">찜♥</a>
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

<%@ include file="/views/common/footer.jsp"%>