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
%>

<!-- 결제API script -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%@ include file="/views/common/header.jsp"%>


<section id='write-container'>


	<br> <br> <br> <br>
	<div id="mypagetitle" text-align="center">결제정보확인</div>
	<br> <br>

	<form method="post" class="container"  name="reservationFrm" id="reservationFrm" action="">

		<table class="table_final_auction" id="final_input_table">
			<colgroup>
				<col width="20%">
				<col width="">
			</colgroup>
			<%-- <tbody>
				<tr>
					<th class="txt_left"><strong class="point">*예약자명</strong></th>
					<td class="txt_left">
					<input type="text" name="cName" value="<%=c.getcName()%>"> <span style="color: #FF8F00;">*
							예약자 실명을 입력하세요. 예약확인시 혼동이 될 수 있습니다.</span></td>
				</tr>
				<tr>
					<th class="txt_left"><strong class="point">*생년월일</strong></th>
					<td class="txt_left"><input type="text" name="cBirth" value="<%=c.getcBirth()%>" class="w80px" maxlength="10" onblur="">
						ex)94/02/07 <span id="bir_auth"></span></td>
				</tr>
				<tr>
					<th class="txt_left"><strong class="point">*연락처</strong></th>
					<td class="txt_left"><input type="text" name="cPhone"
						value="<%=c.getcPhone()%>" style="width: 120px;" class="num_only"
						placeholder="01012345678로 입력"> <span
						style="color: #FF8F00;">* 예약관련 정보가 문자메세지로 전송됩니다.</span></td>
				</tr>

				<tr>
					<th class="txt_left"><strong class="point">이메일</strong></th>
					<td class="txt_left"><input type="text" name="cEmail"
						value="<%=c.getcEmail()%>" style="width: 300px;">
						ex)honey@honey.com</td>
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
									<td><strong class="nanum f23 ltm1">
									
									<input type="text" name="rPrice" style="border:none" value="<%=r.getrPrice() %>">
									</strong>원</td>
								</tr>





								<tr>
									<th>인원추가</th>
									<td><strong class="nanum f23 ltm1">
									<input type="text" name="rAddPrice" style="border:none" value="<%=r.getrAddPrice() %>"></strong>원(추가인원 0명)</td>
								</tr>


							</tbody>
						</table>
					</td>



					<!-- 총결제금액 -->

					<td style="padding: 10px 20px; text-align: right;">
					<strong class="nanum f23 ltm1 cff" id="total_price_view">
					<input type="text" name="totalPrice" style="border:none" value="<%=totalPrice%>"></strong>원
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
        
        <input type="hidden" name="payCode" value="<%=pay.getPayCode()%>">
        <input type="hidden" name="rCode" value="<%=res.getResCode()%>">
		<input type="hidden" name="pCode" value="<%=p.getpCode()%>">
		 
	 
		<input type="hidden" name="cId" value="<%=c.getcId()%>">
		<input type="hidden" name="resState" value="<%=res.getResState()%>">
			
			
 --%>        <input type="reset" onclick="preview();" class="btn btn-warning" value="뒤로가기">
        <input type="submit" class="btn btn-warning" id="btn-pay" onclick="" value="결제하기">
			

	</form>



</section>
<br>
<br>
<br>
<br>


  <script>
  
 /*  카드.카카오페이로 결제하기를 체크할 때  무통장입금정보 숨김*/
  
        $(document).ready(function () {
            $("#payCard").click(function () {
                if ($("#payCard").prop("checked", true)) {

                    $("#bank_info").hide();
                 } else {

                     $("#bank_info").show();
                 
            }
 


            });

        });
 
      
    	 
     
  
  /* 이전으로 버튼 */

  <%-- function preview(){
  	
	  var url="<%=request.getContextPath()%>/reservation/reservationInfoLoad?resCode="<%=res.getResCode()%>;
		location.href=url;
  
  }
   --%>
  /* 결제하기 버튼 */

  $(function(){
	  
	  $('#btn-pay').click(function(){
		  
	  
       var IMP = window.IMP; // 생략가능
       IMP.init('imp08945184'); //가맹점 식별코드
       var msg;
       
       IMP.request_pay({
    	   
    	   
    	   //아래의 param값은 임의로 지정한게 아니라 i`m port에서 지정한 param값임
         
    	   pg : 'kakaopay',
           pay_method : 'card',
       // 가맹점에서 생성관리하는 고유 주문번호
           merchant_uid : 'merchant_' + new Date().getTime(),
           name : '자바방 펜션 결제',
           amount : <%=totalPrice%>,
           buyer_email : '<%=c.getcEmail()%>',
           buyer_name : '<%=c.getcName()%>',
           cId : '<%=c.getcId()%>',
           buyer_tel : '<%=c.getcPhone()%>',
           buyer_addr : '<%=c.getcAddr()%>',
           custom_data : '<%=pay.getPayCode()%>,<%=res.getResCode()%>,<%=c.getcId()%>,<%=r.getrNo()%>',
           resCode : '<%=res.getResCode()%>'
         
       }, function(rsp) {
           if ( rsp.success ) {
               //1. 서블릿에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
               jQuery.ajax({
                   url: "/reservation/payComplete",
                   type: 'POST',
                   dataType: 'json',
                   data: {
                      
                      //기타 필요한 데이터가 있으면 추가 전달
                        
                      // 아임포트 거래 고유번호 - 혀니가 임의지정한 값 아님. 아임포트에서 지정해준거니까 건들지마!!!!
                	   payCode : rsp.merchant_uid,
                	   payMethod : rsp.pay_method,
                	   resState : rsp.status,
                	   imp_uid: rsp.imp_uid,
                	   custom_data : rsp.custom_data
                	   
                	
                   }
               }).done(function(data) {
                   //2. 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                   if ( everythings_fine ) {
                       msg = '결제가 완료되었습니다.';
                       msg += '\n고유ID : ' + rsp.imp_uid;
                       msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                       msg += '\결제 금액 : ' + rsp.paid_amount;
                       msg += '카드 승인번호 : ' + rsp.apply_num;
                       
                       alert(msg);
                   } 
                   
                   
                   else {
                       //3. 아직 제대로 결제가 되지 않았습니다.
                       //4. 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                   }
               });
               //성공시 이동할 페이지
               location.href='<%=request.getContextPath()%>/reservation/payComplete?msg='+msg;
               
               //예매상태를 Y로 바꿔주기  in servlet 
               //카드결제는 하는순간 y 무통장입금은 n 
               
           } else {
               msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
              
               //실패시 이동할 페이지
               location.href="<%=request.getContextPath()%>/order/payFail";
               alert(msg);
           }
           
           
       }
	  }
           
       });
       
   
  
	  
	  
	  
	  
	  )};
	  
	  

  
  
  
  
  
  
  </script>




<%@ include file="/views/common/footer.jsp"%>