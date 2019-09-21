<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.reservation.model.vo.Reservation"%>
<%@ page import="com.jb.reservation.model.vo.Payment"%>
<%@ page import="com.jb.pension.model.vo.Pension"%>
<%@ page import="com.jb.pension.model.vo.Room"%>
<%@ page import="java.util.Calendar" %>

<%
	/* Reservation res = (Reservation) request.getAttribute("reservation");
    Payment pay = res.getPayment();

	Pension p = res.getPension();
	Room r = res.getRoom();
	Client c = res.getClient();
	
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	
	Calendar now = Calendar.getInstance();
	int nowYear = now.get(Calendar.YEAR);			// 현재 년
	int nowMonth = now.get(Calendar.MONTH)+1;		// 현재 월
	int nowDate = now.get(Calendar.DATE);			// 현재 일
	out.print(nowYear+"년 "+nowMonth+"월 "+nowDate+"일"); */
	Reservation resInfo=(Reservation)request.getAttribute("resInfo");
%>

<!-- 결제API script -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<%@ include file="/views/common/header.jsp"%>


<section id='write-container'>


	<br> <br> <br> <br>
	<div id="mypagetitle" text-align="center">결제진행</div>
	<br> <br>

	<form method="post" class="container"  name="reservationFrm" id="reservationFrm" action="">

		
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
									<td><strong class="nanum f23 ltm1">
									
									<input type="text" name="rPrice" style="border:none" value="<%=resInfo.getRoom().getrPrice()%>">
									</strong>원</td>
								</tr>

								<tr>
									<th>인원추가</th>
									<td><strong class="nanum f23 ltm1">
									<input type="text" name="rAddPrice" style="border:none" value="<%=resInfo.getRoom().getrAddPrice()%>"></strong>원(추가인원 0명)</td>
								</tr>


							</tbody>
						</table>
					</td>

					<!-- 총결제금액 -->

					<td style="padding: 10px 20px; text-align: right;">
					<strong class="nanum f23 ltm1 cff" id="total_price_view">
					<input type="text" name="totalPrice" style="border:none" value="<%=resInfo.getTotalPrice()%>"></strong>원
					</td>
				</tr>

			</tbody>
		</table>

		<p class="blk h20">&nbsp;</p>

		<br> <br>

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
                    <th colspan="3">
                        <span style="margin-right:30px;"><input type="radio" name="payMethod" id="payAccount" value="account">계좌입금
                           </span>
                        <span style="margin-right:30px;"><input type="radio" name="payMethod" id="payCard" value="kakaopay">카카오페이
                           </span>

                    </th>
                </tr>
			</thead>


			<tbody id="bank_info">
				<tr>
					<th>입금자명</th>
					<td><input type="text" name="input_name" style="width: 100px;">
						<span class="cff">(입금하실 때 반드시 입금자명으로 입금 해 주세요)</span></td>
					<th rowspan="3">무통장입금 안내(꼭 기억해주세요)
						<p class="blk h05">&nbsp;</p>
						<div>
							<strong class="cff">1시간 이내 입금완료 하지 않을 경우 자동취소 됩니다.</strong><br>
							무통장 입금 선택시 <span class="cff">예약대기 상태</span>가 되며 예약대기는 예약 확정이
							아닙니다.<br> 예약대기 상태에서는 <span class="cff">입금을 먼저하신 분께 우선
								예약권</span>이 있습니다.
						</div>
					</th>
				</tr>

				<tr>
					<th>입금계좌</th>
					<td>1004-1004-1004 서현희 
					</td>
				</tr>

			</tbody>
		</table>
      
        <input type="hidden" name="resCode" value="<%=resInfo.getResCode()%>">
	
		 
	
			
       <input type="reset" onclick="preview();" class="btn btn-warning" value="뒤로가기">
        <input type="button" class="btn btn-warning" id="btn-pay" onclick="" value="결제하기">
			

	</form> 
	<input type="submit" name="pay" id="pay" value="결제하기">



</section>
<br>
<br>
<br>
<br>


  <script>
  
 /*  카드.카카오페이로 결제하기를 체크할 때  무통장입금정보 숨김*/
  /* 
        $(document).ready(function () {
            $("#payCard").click(function () {
                if ($("#payCard").prop("checked", true)) {

                    $("#bank_info").hide();
                 } else {

                     $("#bank_info").show();
                 
            }
 


            });

        });
  */
      
    	 
     
  
  /* 이전으로 버튼 */

  <%-- function preview(){
  	
	  var url="<%=request.getContextPath()%>/reservation/reservationInfoLoad?resCode="<%=res.getResCode()%>;
		location.href=url;
  
  }
   --%>
  /* 결제하기 버튼 */

   
 $("#pay").click(function () {
        var IMP = window.IMP;
        IMP.init('imp08945184'); 
       
        IMP.request_pay({
       
            pg:'kakao',
            pay_method: 'card',
            merchant_uid: new Date().getTime(),
            name: '자바방 펜션 결제',
            amount: 50000, 
            buyer_email: 'honey@honey.do',
            buyer_name: '서현희',
            buyer_tel: '010-1234-5678',
            buyer_addr: '경기도 어쩌구 저쩌구동'
        
    
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
              
            	var msg = '결제가 완료되었습니다.';
               
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                location.href='<%=request.getContextPath()%>/views/reservation/paySuccess.jsp';
             
                          /* 여기다가 쿼리스트링 써서 넘기기 */ 
                
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
           <%--  location.href='<%=request.getContextPath()%>/reservation/payComplete?msg='+msg; --%>
        });
        
        
        
    });
     
  
  
  
  
  
  </script>




<%@ include file="/views/common/footer.jsp"%>