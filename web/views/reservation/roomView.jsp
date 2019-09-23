<%@page import="oracle.net.aso.r"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jb.pension.model.vo.PensionFacilities"%>
<%@page import="com.jb.pension.model.vo.Room"%>
<%@page import="java.util.List"%>
<%@page import="com.jb.pension.model.vo.RoomFile" %>
<%@page import="com.jb.pension.model.vo.Pension"%>
<%@ include file="/views/common/header.jsp"%>

<%
	Pension p = (Pension)request.getAttribute("pension");
%>


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<SCRIPT type="text/javascript"
	src="http://www.blueb.co.kr/SRC/javascript/js/dhtmlgoodies_calendar.js?random=20060118"></script>
<link rel="stylesheet" href="css/hotel.css">
<link rel="stylesheet" href="css/bootstrap.css">


<section>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div id="myCarousel" class="thumbnail">
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
<!-- 							<img src="https://placehold.it/800x400?text=IMAGE" alt="Image"> -->
								<img src="<%=request.getContextPath()%>/upload/pension/<%=p.getPenFile().get(0).getpRenameFile()%>"
								style="width:1000px; height:500px;">
<%-- 									<img src="<%=p.getPenFile().get(0).getpRenameFile()%>"> --%>
							<div class="carousel-caption">
								<h3><%=p.getpName()%></h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<!--    펜션이름, 방이름, 최대인원수, 추가인원 , 달력, 최종가격 form -->
			
			<form name="res1" class="reservation-form" method="post" action="<%=request.getContextPath()%>/reservation" onsubmit="return res_validate();">
				<div class="col-sm-4">
					<div class="well">
						<input type="hidden">
						<h1 style="text-align: center"><%=p.getpName()%></h1>
						<br> 방 : <select id="selectP" onchange="ChangePrice()">
							<%for (Room r : p.getRoomList()) { %>
							<option value="<%=r.getrPrice()%>|<%=r.getrMaxNop()%>|<%=r.getrAddPrice()%>|<%=r.getrNo()%>"><%=r.getrName()%></option>
							<% } %>

						</select><br>
						<div id="Maxno"> 최대인원수 : <%=p.getRoomList().get(0).getrMaxNop()%>명 </div>
						인원 수 입력 : <input type="text" name="resNo_" id="addtext" value="0" onkeyup="OnKeyUp(this.value)" maxlength="2"
						style="width: 40px; height: 20px; font-size: 20px; text-align: center;">명
						<br>
						체크인<input type="date" name="checkIn"  disabled style="width: 130px; height: 20px;" ><br>
						체크아웃<input type="date" name="checkOut" style="width: 130px; height: 20px;">
						<br><br><br><br>
						<div id="pe">총 인원 수 : 0명</div>
						
						<input type="hidden" name="resNop" id="m_p">
						<br>
						<br>

						<div id="PriceInfo">가격 : <%=p.getRoomList().get(0).getrPrice()%>원 </div>
						<input type="hidden" name="totalPrice" value="<%=p.getRoomList().get(0).getrPrice()%>">
						<input type="hidden" value="<%=p.getRoomList().get(0).getrNo()%>">
						
						<%if(loginClient!=null) {%>
						<input type="hidden" name="cId" value="<%=loginClient.getcId()%>">
						<%} %>
						
						<div id="rNo_" style="display: none;"></div>
						<input type="hidden" name="rNo" id="rnno" value="">
						
					</div>
					
					
					<input type="submit" class="btn btn-lg btn-warning btn-block" value="예약하기"><br>
				</div>
			</form>
		</div>
	</div>
	<hr>

	<div class="container text-center">
		<h3>펜션이미지</h3>
		<br>
		<div class="row">
			<div class="col-sm-3">
				<img src="<%=request.getContextPath()%>/upload/pension/<%=p.getPenFile().get(0).getpRenameFile()%>"
					class="img-responsive" style="width: 100%" alt="Image">
				<p>1</p>
			</div>
			<div class="col-sm-3">
				<img src="<%=request.getContextPath()%>/upload/pension/<%=p.getPenFile().get(0).getpRenameFile()%>"
					class="img-responsive" style="width: 100%" alt="이미지준비중">
				<p>2</p>
			</div>
			<div class="col-sm-3">
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
				<p>3</p>
			</div>
			<div class="col-sm-3">
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
				<p>4</p>
			</div>
		</div>
		<hr>
	</div>

	<!--   펜션안내 -->
	<div class="container text-center">
		<div class="well">
			<h3>펜션 정보</h3>
			<p>
				펜션주소 :
				<%=p.getpAddr()%></p>
			<p>
				예약문의 :
				<%=p.getpTel()%></p>
			<p>입퇴실 안내 : 입실 오후 3시부터 , 퇴실 11시까지
			<p>
		</div>
	</div>
	<hr>

	<div class="container text-center">
		<div class="well">

			<h3>부대시설</h3>
			<br>
			<br>

			<p>
				매점<input type="checkbox" disabled name="penfac" id="fac1"
					value="<%=p.getPenFac().getStore()%>"> 와이파이<input
					type="checkbox" disabled name="penfac" id="fac2"
					value="<%=p.getPenFac().getWifi()%>"> 애견가능<input
					type="checkbox" disabled name="penfac" id="fac3"
					value="<%=p.getPenFac().getPet()%>"> 공용수영장<input
					type="checkbox" disabled name="penfac" id="fac4"
					value="<%=p.getPenFac().getPool()%>"> 어린이풀장<input
					type="checkbox" disabled name="penfac" id="fac5"
					value="<%=p.getPenFac().getsPool()%>"> 워터슬라이드<input
					type="checkbox" disabled name="penfac" id="fac6"
					value="<%=p.getPenFac().getSlide()%>"> 노천탕<input
					type="checkbox" disabled name="penfac" id="fac7"
					value="<%=p.getPenFac().getOpenBath()%>"> 그릴<input
					type="checkbox" disabled name="penfac" id="fac8"
					value="<%=p.getPenFac().getGrill()%>"> 바베큐<input
					type="checkbox" disabled name="penfac" id="fac9"
					value="<%=p.getPenFac().getSmoked()%>"> 카페<input
					type="checkbox" disabled name="penfac" id="fac10"
					value="<%=p.getPenFac().getCafe()%>"> 노래방<input
					type="checkbox" disabled name="penfac" id="fac11"
					value="<%=p.getPenFac().getSing()%>"> 족구장<input
					type="checkbox" disabled name="penfac" id="fac12"
					value="<%=p.getPenFac().getFoot()%>"> 농구장<input
					type="checkbox" disabled name="penfac" id="fac13"
					value="<%=p.getPenFac().getHand()%>"> 주차장<input
					type="checkbox" disabled name="penfac" id="fac14"
					value="<%=p.getPenFac().getCar()%>">
			</p>

		</div>
	</div>

	<hr>

	<div class="container text-center">
		<div class="well">

			<h3>객실 정보</h3><%for (int i = 0; i < p.getRoomList().size(); i++) {%>
			<!-- 1 -->			
			<div><h1><%=p.getRoomList().get(i).getrName()%></h1>
					<br>
					<br>
					<br>
					<br>
					<div class="container"><!-- 2 -->
						<div class="row"><!-- 3 -->
							<div class="col-sm-8"><!-- 4-1 -->
								<div id="myCarousel" class="carousel"><!-- 5 -->
									<div class="carousel-inner"><!--6-->
										<div class="item active"><!-- 7 -->
											<img src="<%=request.getContextPath()%>/upload/room/<%=p.getRoomList().get(i).getRfList().get(0).getrRenameFile()%>" alt="객실사진">
											<div class="carousel-caption"><!-- 9 --></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4"><!-- 5-2 -->
							<br><br><br><br><br><br>
								<h1><%=p.getRoomList().get(i).getrName()%></h1>
								<h3>가격 :<%=p.getRoomList().get(i).getrPrice()%></h3>
							</div><!-- 5-2 끝 -->
							<input type="button" name="roomName" id="<%=p.getRoomList().get(i).getrNo()%>" class="roomName_"
								value="상세보기" />
						</div><!-- 4 끝 -->
						<hr>
					</div><!--3 끝  -->
					<div id="room<%=i%>">
					</div>
			</div><!-- 1 끝 -->
			<%}%>
		</div>
	</div>

	<hr>
	<div class="well">
		<div class="container text-center">
			<h3 style="text-align: left">리뷰게시판</h3>
			<p>리뷰</p>
			<p><p>
		</div>
	</div>

	<script src="js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>



	<script>    
    
    //룸뷰 ajax
		$(function(){
			$(".roomName_").click(function(){
				var rno=$(this).attr('id');
				var sel=$(this).parent().parent().siblings('div');
				//선택된 방버튼 형제 div 태그 찾아오기
				$.ajax({
					url:"<%=request.getContextPath()%>/roomInfo",
					type : "post",
					data : {
						rno : rno
					},
					dataType : "html",
					success : function(data) {
						sel.html(data);
						//그 형제 태그 안에 ajax 결과값을 출력해줌
						
					}
				});
	<%-- var rname=<%=p.getRoomList().get(0).getrName()%>
				var imgSrc=<%=p.getRoomList().get(0).get --%>
		});
		});

		// 펜션부대시설
		window.onload = function() {
			var chkbox = document.getElementsByName('penfac');

			console.log("length: " + chkbox.length)

			for (var i = 0; i < chkbox.length; i++) {
				if (chkbox[i].value == "Y") {
					chkbox[i].checked = true;
				} else {
					chkbox[i].checked = false;
				}
			}

		}

		function ChangePrice() {
			
			//
			var selectP = document.getElementById("selectP");
			var selectValue = selectP.options[selectP.selectedIndex].value
					.split("|");

			var price = selectValue[0]
			var maxno = selectValue[1]
			var addprice = selectValue[2]
			var selectrno = selectValue[3]			
			
		
			var addtext = document.getElementById("rNo_");
			addtext.innerText = "방번호" + selectrno
			console.log("방번호" + selectrno)
			
			var selectText = selectP.options[selectP.selectedIndex].text;
			console.log(selectText + "의 가격은 " + price + "입니다.")
			console.log(selectText + "의 최대인원수는 " + maxno + "입니다.")

			var PI = document.getElementById("PriceInfo");
			PI.innerText = "가격 : " + price + "원";

			var MI = document.getElementById("Maxno");
			MI.innerText = "최대인원수 : " + maxno + "명";
			

			var rnno = document.getElementById("rnno");
			rnno.value = selectrno;
			
		}

		
		function res_validate() {
			
			if(<%=loginClient==null%>){
				alert("로그인이 필요한 서비스 입니다");
				return false;
			}
			
			if (res1.resNo_.value=="" || res1.resNo_.value==0) {
	            alert("인원수를 입력해주세요.")
	            resNo_.focus()
	            return false;
	        }
			
			if(res1.checkIn.value==""||res1.checkOut.value=="") {
				alert("체크인/체크아웃 날짜를 선택해주세요.")
				checkIn.focus()
				return false;
			}
				return true;
		}
		
		
		function OnKeyUp(text) {

			var txt = document.getElementById("addtext");
			var addtext = document.getElementById("addtext");
			var selectP = document.getElementById("selectP");
			var selectValue = selectP.options[selectP.selectedIndex].value.split("|");

			var price = selectValue[0]
			var maxno = selectValue[1]
			var addprice = selectValue[2]
			var selectrno = selectValue[3]
			
			var regMax = /^[0-9]{1,2}$/;
			if(text!="")
			{
				if (!regMax.test(res1.addtext.value)) {
					txt.value = "";		
					alert("숫자만 입력해주세요.");
					return false;
				}
				
				if(Number(maxno)<Number(text))
				{
					txt.value = "";
					
					alert("선택 인원이 최대인원을 초과했습니다.");
					return false;
				}
			}
// 			var AP = Number(text) * addprice
// 			var TP = AP + Number(price)

// 			var PI = document.getElementById("PriceInfo");
// 			PI.innerText = "가격 : " + TP + "원";

			var PE = document.getElementById("pe");
			PE.innerText = "총 인원수 : "+Number(text)+"명"
			
			var m_p = document.getElementById("m_p");
			m_p.value = text
			
			var TE = document.getElementById("PriceInfo");
			TE.innerText = "가격 : " + price +"원"
			
			var t_p = document.getElementById("totalpirce");
			t_p.value = text

		}

	</script>
</section>

<%@ include file="/views/common/footer.jsp"%>


