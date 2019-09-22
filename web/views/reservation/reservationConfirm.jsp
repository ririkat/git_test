<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.jb.reservation.model.vo.Reservation"%>
<%@ page import="com.jb.reservation.model.vo.Payment"%>
<%@ page import="com.jb.pension.model.vo.Pension"%>
<%@ page import="com.jb.pension.model.vo.Room"%>
<%@ page import="java.util.List"%>


<%
Reservation resInfo=(Reservation)request.getAttribute("resInfo");

/* int totalPrice = (int)request.getAttribute("totalPrice"); */

   
%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%@ include file="/views/common/header.jsp"%>

<section>

	<br> <br> <br> <br>
	<br> <br> <br> <br> <br>
	<div id="mypagetitle" style="text-align: center">예약내역확인</div>
	<br> <br> <br> <br> <br> <br>



	<form method="post" class="container" name="reservationFrm" id="reservationFrm" action="<%=request.getContextPath()%>/reservation/payInfoLoad">

		<table class="table_final_auction">

			<tbody>
				<tr>
					<th>펜션명</th>
					<th>객실명</th>
					<th>기준/최대</th>
					<th>이용기간</th>
					<th>인원수</th>
					<th>요금합계</th>
				</tr>

				

				<!-- 테이블 가로 늘리는것  지우지마세용..... -->
				<input type="hidden" name="span[]" value="1">

				<tr>
					<!-- 펜션명 td -->
					<td rowspan="1">
					<input type="text" name="pName" style="border:none" value="<%=resInfo.getPension().getpName()%>"><br>
					(<input type="text" name="pAddr" style="border:none" value="<%=resInfo.getPension().getpAddr()%>">)
					</td>
					 
				

					<!--객실명 td-->
					<td rowspan="1"><input type="text" name="rName"  style="border:none" value="<%=resInfo.getRoom().getrName()%>"></td>
					


					<!--기준/최대 인원수 td-->
					<td rowspan="1"><input type="text" name="rNop" style="border:none" value="<%=resInfo.getRoom().getrNop()%>">/
					<input type="text" name="rMaxNop" style="border:none" value="<%=resInfo.getRoom().getrMaxNop()%>"></td>
					
					


					<!--이용일 td-->
					<td style="color: #FF9C00; font-weight: bold;">
					<input type="text" name="resCheckIn" style="border:none" value="<%=resInfo.getResCheckIn()%>">부터
						<br>
					<br><input type="text" name="resCheckOut" style="border:none" value="<%=resInfo.getResCheckOut()%>">까지
					</td>


					<!--인원수 td-->
					<td><input type="text" name="rNop" style="border:none"  value="<%=resInfo.getResNop()%>">
					<br>추가인원수 :  <input type="text" name="rAddNop" style="border:none" value="추가인원몇명"></td>
					
				
				
					<!--요금합계 td-->ㄴ
					<td>객실요금: <input type="text" name="rPrice" style="border:none"  value="<%=resInfo.getRoom().getrPrice()%>">원<br> 
					   추가인원요금 : <input type="text" name="rAddPrice" style="border:none" value="<%=resInfo.getRoom().getrAddPrice()%>">원<br>
					   요금 합계 : <input type="text" name="totalPrice" style="border:none"  value="아직못받아옴나중에쓰기">원
					   
					  
			    
			    
					   
					 
					</td>


				</tr>

			</tbody>
		</table>







		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

		<p class="blk h20">&nbsp;</p>
		<table class="table_room2">
			<tbody>
				<tr>
					<td class="txt_left bg line2"><strong>■ 이용시 유의사항</strong>
						<p class="blk h20">&nbsp;</p>
						<p style="margin: 0px; line-height: 1.8">
							<font color="#0c0c0c" size="2">﻿﻿-펜션 연락처는 예약과 동시에 고객님의 핸드폰
								번호로 자동 발송됩니다﻿. ﻿﻿﻿<br>
							<strong> <font color="#ff0000">-예약완료 문자를 전송받지
										못한경우 꼭 고객센터로 연락주시기 바랍니다(1004-1004)</font>
							</strong><br>-자바방에 등록된 펜션은 펜션주가 직접운영하는 펜션입니다﻿. ﻿<br>
							<strong> <font color="#ff0000">-자바방은 통신판매﻿
										﻿중계자로써﻿, ﻿현장에서 일어나는 일에 대해 책임을 지지 않습니다﻿.</font>
							</strong>
							</font>
						</p> <font size="2"> <font color="#0c0c0c"></font>
					</font>
						<p style="margin: 0px; line-height: 1.8">
							<font color="#0c0c0c" size="2">&nbsp;</font>
						</p> <font size="2"> <font color="#0c0c0c"></font>
					</font>
						<p style="margin: 0px; line-height: 1.8">
							<font color="#0c0c0c" size="2">﻿<strong>※요금 및 정보
									관련 유의사항</strong><br>﻿﻿-펜션에 사정에 따라 현장정보는 변경될 수 있으며, 변경된 정보 오류 기재에 대해
								자바방은 어떤 책임도 지지 않습니다.﻿﻿<br>﻿-자바방 사이트에 기재된 요금(객실료, 인원 및 애견
								추가요금 등), 숯불비용, 부대시설 요금, 부대시설 이용시간 등의 ﻿<br>﻿ 세부적인 내용확인은
								변경&nbsp; 될 수 있으며 예약완료 문자를 받으신 후 ﻿﻿문자에 안내된 펜션 연락처로 유선상 확인을 해주세요.﻿<br>﻿-펜션별
								판매기간 미확정, 요금 수정사항이 미반영되어 이용요금이 오기재 된 경우 최종 예약완료된 예약의 건이어도 ﻿<br>&nbsp;﻿예약이
								취소되﻿며 정상금액으로의 재예약 또는 취소 및 환불이 가능합니다. 이와 관련하여 자바방 어떤 책임도 지지 않습니다.
							</font>
						</p> <font size="2"> <font color="#0c0c0c"></font>
					</font>
						<p style="margin: 0px; line-height: 1.8">
							<font color="#0c0c0c" size="2">&nbsp;</font>
						</p> <font size="2"> <font color="#0c0c0c"></font>
					</font>
						<p style="margin: 0px; line-height: 1.8">
							<font color="#0c0c0c" size="2">﻿<strong>※중복예약 및
									기타 유의사항</strong><br>﻿﻿-실시간 예약 특성상 중복예약이 발생될 수 있으며﻿, 중복예약시 선결제가 완료된
								예약건에 우선권이 주어집니다.﻿<br>﻿-중복예약 발생시 결제요금은 100% 환불해드리며, 환불처리 이외에
								자바방과 펜션측에선 어떤 책임도 지지 않습니다.﻿<br>﻿-별도로 기재되어 있는 애견동반가능 펜션 외 모든
								펜션은 애견동반시 현장에서 입실이 거부될 수 있으며 예약금은 환불되지 않습니다.﻿<br>-미성년자는 법적인
								보호자 동의 없이 입실 및 혼숙이 불가능 하며, 현장에서 미성년자 적발시 예약금은 어떠한 경우에도 환불되지
								않습니다.
							</font>
						</p> <font size="2"> <font color="#0c0c0c"></font>
					</font>
						<p style="margin: 0px; line-height: 1.8">
							<font color="#0c0c0c" size="2">&nbsp;</font>
						</p> <font size="2"> <font color="#0c0c0c"></font>
					</font>
						<p style="margin: 0px; line-height: 1.8">
							<font color="#0c0c0c" size="2">﻿<strong>※찾ㅇㅇㅇㅇㄴ왜이렇게
									써져 ㅇ글씨가 왜이렇게 써져글씨가 왜 이어렇게 써져 글씨가 왜글씨가 왜 이렇게 써져 ﻿</strong><br>﻿﻿-네이게이션
								이용시 가급적 펜션명을 찍으시고﻿, ﻿검색이 안되시면 펜션주와 통화하셔서 위치를 파악해주세요.<br>-대중교통
								배차시간은 계속 바뀝니다﻿. ﻿반드시 해당 터미널 및 역에 배차시간을 문의하세요.<br>-픽업요청은 이용일
								전에 펜션주와 꼭 통화해 주세요﻿.﻿
							</font>
						</p>
						<p class="blk h20">&nbsp;</p> <strong>■ 취소 환불규정</strong>
						<p class="blk h20">&nbsp;</p>
						<div style="line-height: 1.8">
							<font size="2"><span style="color: #0c0c0c">﻿﻿-</span> <font
								color="#0c0c0c">자바방에서 예약취소시에는 기간에 따라 </font> <font
								color="#ff0000">취소수수료가 부과되므로 예약시에는 신중하게</font> <font
								color="#0c0c0c"> 이용해 주시기 바랍니다.</font><br style="color: #0c0c0c">
							<span style="color: #0c0c0c">-</span> <font color="#0c0c0c">예약변경을
									위한 취소시에도 취소수수료가 부과되오니 신중하게 예약하시기 바랍니다.</font><br
								style="color: #0c0c0c">
							<span style="color: #0c0c0c">-</span> <font color="#0c0c0c">예약취소시
									결제하신 금액에서 취소수수수료를 제외한 금액을 환불에 드립니다.</font> </font>
						</div>
						<div style="line-height: 1.8">
							<font size="2"><span style="color: #0c0c0c">-</span> <font
								color="#0c0c0c">취소수수료가 100%인 경우 전액 환불되지 않습니다.</font><br
								style="color: #0c0c0c"> <font color="#ff0000">-예약당일
									취소시에도 숙박이용일자 기준대로 취소수수료가 적용됩니다.</font> </font>
						</div>
						<div style="line-height: 1.8">
							<font size="2"><span style="color: #0c0c0c">-</span> <font
								color="#0c0c0c">자바방은 건전한 예약문화 정책을 위하여 예약취소시 아래와 같이 취소수수료를
									부과합니다.</font><br style="color: #0c0c0c"> <font color="#ff0000">-아래
									환불규정은 소비자 보호법보다 우선합니다..</font> </font>
						</div>
						<p class="blk h20">&nbsp;</p>




						<table class="table_final_auction">
							<colgroup>
								<col width="20%">
								<col width="">
							</colgroup>
							<tbody>


								<tr>
									<th>숙박이용 당일 예약 취소(환불없음)</th>
									<td>전체금액의 100% 공제후 환불</td>

								</tr>

								<tr>
									<th>숙박이용 1일 전 예약취소</th>
									<td>전체금액의 70% 공제후 환불</td>

								</tr>

								<tr>
									<th>숙박이용 2일 전 예약취소</th>
									<td>전체금액의 50% 공제후 환불</td>

								</tr>

								<tr>
									<th>숙박이용 3일 전 예약취소</th>
									<td>전체금액의 30% 공제후 환불</td>

								</tr>

								<tr>
									<th>숙박이용 4일 전 예약취소</th>
									<td>전체금액의 20% 공제후 환불</td>

								</tr>

								<tr>
									<th>숙박이용 5일 전 예약취소</th>
									<td>전체금액의 10% 공제후 환불</td>

								</tr>

								<tr>
									<th>기본취소수수료</th>
									<td>전체금액의 10% 공제후 환불</td>

								</tr>

								<tr>
									<th>숙박이용 6일전 &amp;예약일 기준으로 7일이내 예약취소<br>(동시만족시에만)
									</th>
									<td>전체금액의 0% 공제후 환불</td>

								</tr>
							</tbody>
						</table>
						<p class="blk h20">&nbsp;</p> <strong>■ 무통장 입금 안내</strong>
						<p class="blk h20">&nbsp;</p>
						<div>
							무통장입금계좌: <strong>KH은행 1004-1004-1004 예금주:서현희(자바방)</strong>
						</div> <br>
						<div>무통장 입금으로 결제시 계좌번호와 인증번호가 핸드폰으로 발송됩니다.</div>
						<div>핸드폰으로 받은 인증번호를 입력한 후 정해진 시간내에 입금하시면 예약이 완료 됩니다.</div>
						<div>무통장 입금시 예약자명으로 입금하셔야 합니다.</div>
						<div>입금하기 전까지는 입금대기 상태로 먼저 입금한 사람에게 우선권이 주어지니 빠른 입금 부탁드립니다.</div>
						<div>
							<font color="#ff0000"><strong>입금대기인 상태에서 먼저
									입금한사람에게 우선권이 주어질 수 있이니 빠른 입금 부탁드립니다.</strong> </font>
						</div>

						<p class="blk h20">&nbsp;</p> <strong>■ 개인정보 수집, 이용 및 제공
							안내</strong>

						<div class="box join_agree"
							style="width: auto; margin: 20px 0 0 0; overflow-y: scroll;">


							<p>
								“자바방”(이하 “회사”)는 이용자의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호에 관한 법률" 및
								“개인정보보호법”과 “전자상거래 등에서의 소비자 보호에 관한 법률”을 준수하고 있습니다. 회사는 본인확인서비스(이하
								“서비스”) 이용자로부터 아래와 같이 개인정보를 수집 및 이용합니다.<br> <br> 1.
								개인정보의 수집 및 이용목적<br> 회사는 다음과 같은 목적 하에 “서비스”와 관련한 이용자의 개인정보를
								수집합니다.<br> - 서비스 제공 계약의 성립, 유지, 종료를 위한 본인 식별 및 실명확인<br>

								- 서비스 제공 과정 중 본인 식별, 인증, 실명확인 및 회원에 대한 각종 안내/고지<br> - 서비스
								제공 및 관련 업무처리에 필요한 동의 또는 철회 등 의사확인<br> - 이용 빈도 파악 및 인구통계학적
								특성에 따른 서비스 제공 및 CRM<br> <br> 2. 수집하는 개인정보 항목<br>

								가. 개인정보의 수집 및 이용목적에 따라 회사가 수집하는 이용자의 개인정보의 항목은 다음과 같습니다<br>

								- 이용자의 생년월일, 성명, 성별, 내/외국인, 본인 명의로 가입한 이동통신사와 휴대폰 번호 등의 정보<br>

								나. 상기 명시된 개인정보 항목 이외의 “서비스” 이용과정이나 “서비스” 처리 과정에서 다음과 같은 추가 정보들이
								자동 혹은 수동으로 생성되어 수집 될 수 있습니다.<br> - 이용자의 IP, 서비스 접속 일시, 서비스
								이용기록, 불량 혹은 비정상 이용기록<br> <br> 3. 개인정보의 보유 및 이용기간<br>

								이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기 합니다. 단, 다음의 정보에
								대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.<br> <br> 가. 회사 내부 방침의
								의한 정보보유<br> - 보존항목: 서비스 이용 기록<br> - 보존이유: 서비스 이용 내역 안내
								및 분쟁이 발생 할 경우 소명자료 활용<br> - 보존기간: 6개월<br> <br> 나.
								관련법령에 의한 정보보유<br> 상법, 전자상거래 등에서의 소비자보호에 관한 법률, 전자금융거래법 등
								관련법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관련법령에서 정한 일정한 기간 동안 정보를 보관합니다. 이
								경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br> - 계약
								또는 청약철회 등에 관한 기록<br> 보존기간: 5년 / 보존근거: 전자상거래 등에서의 소비자보호에 관한
								법률<br> - 본인확인에 관한 기록<br> 보존기간: 6개월 / 보존근거: 정보통신 이용촉진 및
								정보보호 등에 관한 법률<br> - 방문에 관한 기록<br> 보존기간: 3개월 / 보존근거:
								통신비밀보호법<br> <br> 4. 이용자의 개인정보의 수집 및 이용 거부<br>

								이용자는 회사의 개인정보 수집 및 이용 동의를 거부할 수 있습니다. 단, 동의를 거부 하는 경우 서비스 이용이
								정상적으로 완료 될 수 없음을 알려 드립니다.<br>

							</p>
						</div></td>
				</tr>
			</tbody>
		</table>


		

		<p class="blk h20">&nbsp;</p>
		<br> &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="chk"
			value="Y" id="check1"><label for="check1">이용시 유의사항,
			환불/취소수수료 안내, 개인정보 수집, 이용 및 제공 안내를 확인하였고 이에 동의합니다.</label><br> <br>
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="chk" value="Y"
			id="check2"><label for="check2">이용자가 미성년자가 아니며 성인임에
			동의합니다.</label> <br>
		<p class="blk h20">&nbsp;</p>
		<br> <br> <br> 
		
		 <input type="hidden" name="resCode" value="<%=resInfo.getResCode()%>"> 
		 <input type="hidden" name="cId" value="<%=loginClient.getcId()%>"> 
		 
		 
		  
		  
		  <input type="reset" onclick="" class="btn btn-warning" value="이전단계"> 
		 <input type="submit" class="btn btn-warning" id="pay" onclick="payInfo();" value="다음단계">
		<!-- <input type="button" name="pay" id="pay" value="카카오페이결제"> -->

	</form>

</section>

<script>

//  function payInfo() {
<%-- 	 location.href="<%=request.getContextPath()%>/reservation/payInfoLoad?resCode=<%=resInfo.getResCode()%>"; --%>
//  }



<%-- function submitReservation() {
	location.href='<%=request.getContextPath()%>/views/reservation/paymentView.jsp';
	 --%>
	<%-- var chkbox = document.getElementsByName('chk');
	var num = 0;
	
	for (var i = 0; i < chkbox.length; i++) {
		if (chkbox[i].checked==true) {
			num += 1;	
		}
	}
	
	if (num == 2 ) {
		
		location.href='<%=request.getContextPath()%>/reservation/payInfoLoad?resCode=<%=resInfo.getResCode()%>';
		location.href='<%=request.getContextPath()%>/views/reservation/paymentView.jsp';
			return false;
		} else {
			alert("모든 약관에 동의해 주세요.");
		} --%>
	/* } */
</script>




<%@ include file="/views/common/footer.jsp"%>