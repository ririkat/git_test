<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.reservation.model.vo.Reservation"%>
<%@ include file="/views/common/header.jsp"%>

<%
	Reservation resInfo = (Reservation) request.getAttribute("resInfo");
	String resName = (String) request.getAttribute("resName");
	String resPhone = (String) request.getAttribute("resPhone");
	String resCode = (String) request.getAttribute("resCode");
 	int totalPrice = (int)request.getAttribute("totalPrice");
%>

<section>

	<br> <br> <br> <br> <br> <br> <br> <br>
	<br>
	<div id="mypagetitle" style="text-align: center">카드결제가 완료되었습니다.</div>
	<br> <br> <br> <br> <br> <br>
	<form method="post" class="container" name="reservationFrm" id="reservationFrm" action="<%=request.getContextPath()%>">

		<h3>예약펜션정보</h3>

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
					<td rowspan="1"><input type="text" name="pName"
						style="border: none" value="<%=resInfo.getPension().getpName()%>"><br>
						(<input type="text" name="pAddr" style="border: none"
						value="<%=resInfo.getPension().getpAddr()%>">)</td>

					<!--객실명 td-->
					<td rowspan="1"><input type="text" name="rName"
						style="border: none" value="<%=resInfo.getRoom().getrName()%>"></td>

					<!--기준/최대 인원수 td-->
					<td rowspan="1"><input type="text" name="rNop"
						style="border: none" value="<%=resInfo.getRoom().getrNop()%>">/
						<input type="text" name="rMaxNop" style="border: none"
						value="<%=resInfo.getRoom().getrMaxNop()%>"></td>

					<!--이용일 td-->
					<td style="color: #FF9C00; font-weight: bold;"><input
						type="text" name="resCheckIn" style="border: none"
						value="<%=resInfo.getResCheckIn()%>">부터 <br> <br>
						<input type="text" name="resCheckOut" style="border: none"
						value="<%=resInfo.getResCheckOut()%>">까지</td>

					<!--인원수 td-->
					<td><input type="text" name="rNop" style="border: none"
						value="<%=resInfo.getResNop()%>"> <br>추가인원수 : <input
						type="text" name="rAddNop" style="border: none" value="추가인원몇명"></td>

					<!--요금합계 td-->
					<td>객실요금: <input type="text" name="rPrice"
						style="border: none" value="<%=resInfo.getRoom().getrPrice()%>">원<br>
						추가인원요금 : <input type="text" name="rAddPrice" style="border: none"
						value="<%=resInfo.getRoom().getrAddPrice()%>">원<br>
						요금 합계 : <input type="text" name="totalPrice" style="border: none"
						value="왜 null떠 시벌스">원
					</td>

				</tr>

			</tbody>
		</table>

		<h3>결제방법</h3>

		<table class="table_final_auction">

			<tbody>
				<tr>
					<th>결제방법</th>
				</tr>

				<!-- 테이블 가로 늘리는것 -->
				<input type="hidden" name="span[]" value="1">

				<tr>
					<td rowspan="1">KakaoPay(Card)</td>
				</tr>
			</tbody>
		</table>

			<h3>고객정보</h3>
		<br> <br> <br> <br> <br> <br> <br> <br>

		<table class="table_final_auction" id="final_input_table">
			<colgroup>
				<col width="20%">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th class="txt_left"><strong class="point">예약자명</strong></th>
					<td class="txt_left"><input type="text" name="cName"
						style="border: none" value="<%=resName%>"></td>
				</tr>

				<tr>
					<th class="txt_left"><strong class="point">*연락처</strong></th>
					<td class="txt_left"><input type="text" name="cPhone"
						style="border: none" value="<%=resPhone%>" style="width:120px;"
						placeholder="01012345678로 입력"> <span
						style="color: #FF8F00;">* 예약관련 정보가 문자메세지로 전송됩니다.</span></td>
				</tr>

			</tbody>
		</table>


		<h1><%=resName%></h1>
		님의
		<p><%=resInfo.getPension().getpName()%>펜션
		</p>
		예약이 완료되었습니다.<br> <br> 예약해주셔서 감사합니다. 
		
		
		<input type="submit" onclick="paySuccessfully" name="goMainView" value="예약목록확인">

	</form>

</section>

<script>
	
</script>




<%@ include file="/views/common/footer.jsp"%>