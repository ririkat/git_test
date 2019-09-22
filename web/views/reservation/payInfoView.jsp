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
   

    %>

    
<%@ include file="/views/common/header.jsp"%>

<section id='write-container'>


	<br> <br> <br> <br>
	<div id="mypagetitle" text-align="center">결제정보확인</div>
	<br> <br>
 
	<form method="post" class="container"  name="reservationFrm" id="reservationFrm" action="">
	<input type="hidden" name="resCode" value="<%=resInfo.getResCode()%>">

		<table class="table_final_auction" id="final_input_table">
			<colgroup>
				<col width="20%">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th class="txt_left"><strong class="point">예약자명</strong></th>
					<td class="txt_left">
					<input type="text" name="cName" value="<%=resInfo.getClient().getcName()%>"> <span style="color: #FF8F00;">*
							예약자 실명을 입력하세요. 예약확인시 혼동이 될 수 있습니다.</span></td>
				</tr>
				
				<tr>
					<th class="txt_left"><strong class="point">*연락처</strong></th>
					<td class="txt_left"><input type="text" name="cPhone"
						value="<%=resInfo.getClient().getcPhone()%>" style="width: 120px;" class="num_only"
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
									<td><strong class="nanum f23 ltm1">
									
									<input type="text" name="rPrice" style="border:none" value="<%=resInfo.getRoom().getrPrice()%>">
									</strong>원</td>
								</tr>


								<tr>
									<th>인원추가금액</th>
									<td><strong class="nanum f23 ltm1">
									<input type="text" name="rAddPrice" style="border:none" value="<%=resInfo.getRoom().getrAddPrice()%>"></strong>원(추가인원 0명)</td>
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

		


		</table>
        
 <!--  
        <input type="button" onclick="preview();" id="pay" class="btn btn-warning" value="결제하기">  -->
       
        <input type="button" class="btn btn-warning" onclick="" value="나중에하기">
        
			

	</form>
	 <input type="button" name="pay" id="pay" value="결제하기">
	
	


</section>

<script>

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