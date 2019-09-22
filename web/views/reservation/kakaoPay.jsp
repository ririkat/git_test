<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="com.jb.reservation.model.vo.Reservation"%>
<%@ page import="com.jb.reservation.model.vo.Payment"%>
<%@ page import="com.jb.pension.model.vo.Pension"%>
<%@ page import="com.jb.pension.model.vo.Room"%>
<%@ page import="java.util.List"%>



<%
    
    Reservation resInfo=(Reservation)request.getAttribute("resInfo");
     int totalPrice = (int)request.getAttribute("totalPrice");
     String resCode = (String)request.getAttribute("resCode");
     String resName=(String)request.getAttribute("resName");
     String resPhone=(String)request.getAttribute("resPhone");
    
    %>


<%@ include file="/views/common/header.jsp"%>

<!-- kakaoPay결제 API니까 지우지말아줬으면해!! -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<section id='write-container'>

	<br> <br> <br> <br>
	<div id="mypagetitle" text-align="center">결제정보확인</div>
	<br> <br>

	<form method="post" class="container" name="payFrm" id="payFrm" action="<%=request.getContextPath()%>/reservation/kakaoPaySuccess">
		<input type="hidden" name="resCode" value="<%=resInfo.getResCode()%>">

		<table class="table_final_auction" id="final_input_table">
			<colgroup>
				<col width="20%">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th class="txt_left"><strong class="point">예약자명</strong></th>
					<td class="txt_left"><input type="text" name="resName"
						value="<%=resInfo.getClient().getcName()%>"> <span
						style="color: #FF8F00;">* 예약자 실명을 입력하세요. 예약확인시 혼동이 될 수
							있습니다.</span></td>
				</tr>

				<tr>
					<th class="txt_left"><strong class="point">*연락처</strong></th>
					<td class="txt_left"><input type="text" name="resPhone"
						value="<%=resInfo.getClient().getcPhone()%>" style="width: 120px;"
						placeholder="01012345678로 입력"> <span
						style="color: #FF8F00;">* 예약관련 정보가 문자메세지로 전송됩니다.</span></td>
				</tr>

			</tbody>
		</table>

		<p class="blk h20">&nbsp;</p>
		<br> <br>
		<div id="mypagetitle" text-align="center">결제금액</div>
		<br> <br>

		<table class="table_final_auction" style="table-layout: fixed;">

			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>

			<tbody>
				<tr>
					<th>
						<div class="left">
							<strong>객실금액</strong>
						</div>

					</th>

					<th class="txt_left">총 결제금액</th>

				</tr>

				<tr>
					<td
						style="padding: 10px 20px; text-align: right; position: relative;">


						<table class="table_zava">
							<tbody>
								<tr>
									<th>기본가</th>
									<td><strong class="nanum f23 ltm1"> <input
											type="text" name="rPrice" style="border: none"
											value="<%=resInfo.getRoom().getrPrice()%>">
									</strong>원</td>
								</tr>

								<tr>
									<th>인원추가금액</th>
									<td><strong class="nanum f23 ltm1"> <input
											type="text" name="rAddPrice" style="border: none"
											value="<%=resInfo.getRoom().getrAddPrice()%>"></strong>원(추가인원
										0명)</td>
								</tr>

							</tbody>
						</table>
					</td>

					<!-- 총결제금액 -->

					<td style="padding: 10px 20px; text-align: right;"><strong
						class="nanum f23 ltm1 cff" id="total_price_view"> <input
							type="text" name="totalPrice" style="border: none"
							value="<%=totalPrice%>"></strong>원</td>
				</tr>

			</tbody>
		</table>

		<p class="blk h20">&nbsp;</p>

		<br> <br>

		</table>

		<div id="mypagetitle" text-align="center">결제방법</div>
		<br> <br>
		<p class="blk h10">&nbsp;</p>

		<table width="100%" class="table_pay_type">
			<colgroup>
				<col width="100">
				<col width="440">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th colspan="3"><span style="margin-right: 30px;"> <input
							type="radio" name="pay" id="payAccount" value="account" checked>무통장입금
					</span> <span style="margin-right: 30px;"> <input type="radio"
							name="pay" id="payCard" value="kakaoPay" checked>카카오페이결제
					</span></th>
				</tr>
			</thead>

			<tbody id="bank_info">
				<tr>
					<th>입금자명</th>
					<td><input type="text" name="accountName"
						style="width: 100px;" value=""> <span class="cff">(입금하실
							때 반드시 입금자명으로 입금 해 주세요)</span></td>
					<th rowspan="3">무통장입금 안내(꼭 기억해주세요)
						<p class="blk h05">&nbsp;</p>
						<div>
							<strong class="cff">정해진 기간 이내 입금완료 하지 않을 경우 자동취소 됩니다.</strong><br>
							무통장 입금 선택시 <span class="cff">예약대기 상태</span>가 되며 예약대기는 예약 확정이
							아닙니다.<br> 예약대기 상태에서는 <span class="cff">입금을 먼저하신 분께 우선
								예약권</span>이 있습니다.
						</div>
					</th>
				</tr>

			</tbody>
		</table>

		         <input type="hidden" name="resCode" value="<%=resInfo.getResCode()%>"> 
		         <input type = "hidden" name ="cId" value="<%=loginClient.getcId()%>">

		<input type="button" class="btn btn-warning" onclick="" value="나중에하기">

<!-- 	<input type="submit" name="payment_btn" class="btn btn-warning"	id="payment"  onclick="payment();" value="결제하기"> -->

	</form>

</section>

<script>


$(window).load(function(){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp08945184'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    
    IMP.request_pay({
        pg : 'kakao',
        pay_method : 'card',
        merchant_uid : new Date().getTime(),
        name : '자바방 펜션 결제',
        amount : <%=totalPrice%>,
        buyer_email : '<%=resInfo.getClient().getcEmail()%>',
        buyer_name : '<%=resInfo.getClient().getcName()%>',
        buyer_tel : '<%=resInfo.getClient().getcPhone()%>',
        buyer_addr : '<%=resInfo.getClient().getcAddr()%>'
        
      
    }, function(rsp) {
        if ( rsp.success ) {
            
            jQuery.ajax({
                url: '/reservation/kakaoPaySuccess',
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            //성공시 이동할 페이지
<%--             location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
<%--             location.href="<%=request.getContextPath()%>/order/payFail"; --%>
            alert(msg);
        }
    });
    
});





</script>
    



<%@ include file="/views/common/footer.jsp"%>