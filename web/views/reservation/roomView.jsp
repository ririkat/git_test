<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jb.pension.model.vo.PensionFacilities"%>
<%@page import="com.jb.pension.model.vo.Room"%>
<%@page import="java.util.List"%>
<%@page import="com.jb.pension.model.vo.Pension"%>
<%@ include file="/views/common/header.jsp"%>

<%
	Pension p = (Pension) request.getAttribute("pension");
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

<!-- 달력 css -->
<style>
#ui-datepicker-div {
	top: -999px;
	border: 0;
	font-size: 14px;
}

.ui-datepicker-header {
	font-size: 13px;
}

.ui-datepicker-calendar {
	background-color: #fff;
	border: 1px solid #ddd;
	tr
	{
	font-size
	:
	11px;
}
}
</style>
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
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="https://placehold.it/800x400?text=IMAGE" alt="Image">

							<%-- 		<img src="<%=request.getContextPath()%>/upload/pension/<%=p.getPenFile().get(0).getpRenameFile() %>"> --%>
							<div class="carousel-caption">
								<h3>Sell $</h3>
								<p>Money Money.</p>
							</div>
						</div>

						<div class="item">
							<img src="https://placehold.it/800x400?text=Another Image Maybe"
								alt="Image">
							<div class="carousel-caption">
								<h3>More Sell $</h3>
								<p>Lorem ipsum...</p>
							</div>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>

			<!--    펜션이름, 방이름, 최대인원수, 추가인원 , 달력, 최종가격 form -->
			<form name="res1" class="reservation-form" method="post" action="<%=request.getContextPath()%>">
				<div class="col-sm-4">
					<div class="well">
						<input type="hidden">
						<h1 style="text-align: center"><%=p.getpName()%></h1>
						<br> 방 : <select id="selectP" onchange="ChangePrice()">
							<%
								for (Room r : p.getRoomList()) {
							%>
							<option
								value="<%=r.getrPrice()%>|<%=r.getrMaxNop()%>|<%=r.getrAddPrice()%>"><%=r.getrName()%></option>
							<%
								}
							%>
						</select><br>
						<div id="Maxno">
							최대인원수 :
							<%=p.getRoomList().get(0).getrMaxNop()%>명
						</div>
						추가인원 <input type="text" id="addtext" value="0"
							onkeyup="OnKeyUp(this.value)" maxlength="2"
							style="width: 40px; height: 20px; font-size: 20px; text-align: center;">명

						
						<!-- 체크인/체크아웃 달력 -->
						<br>
						<br>
						<div class="wrap">
							<div>체크인</div>
							<div>
								<input type="text" id="from">
							</div>
							<div>~체크아웃</div>
							<div>
								<input type="text" id="to">
							</div>
						</div>
						<button class="btn">조회</button>


						<br>
						<br>
						<div id="PriceInfo">
							가격 :
							<%=p.getRoomList().get(0).getrPrice()%>원
						</div>
					</div>
					
<!-- 	클라이언트 로그인 if으로 막기 -->
					<input type="button" class="btn btn-lg btn-warning btn-block" value="예약하기"><br>

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
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
				<p>1</p>
			</div>
			<div class="col-sm-3">
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
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

			<h3>방 정보</h3>
			<%
				for (int i = 0; i < p.getRoomList().size(); i++) {
			%>
			<!-- 1 -->
			<div>
				<h1><%=p.getRoomList().get(i).getrName()%></h1>
				


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
											<%--           <img src="<%=request.getContextPath()%>/upload/pension/<% %>" alt="Image"> --%>
											<img src="https://placehold.it/800x400?text=IMAGE"
												alt="Image">
											<div class="carousel-caption"><!-- 9 --></div>
										</div>
									</div>
								</div>

							</div>

							<div class="col-sm-4"><!-- 5-2 -->
								<h1><%=p.getRoomList().get(i).getrName()%></h1>
								<h3>
									가격 :
									<%=p.getRoomList().get(i).getrPrice()%></h3>

							</div><!-- 5-2 끝 -->
							<input type="button" name="roomName" id="<%=p.getRoomList().get(i).getrNo()%>" class="roomName_"
								value="상세보기" />
						</div><!-- 4 끝 -->
						<hr>
					</div><!--3 끝  -->
					<div id="room<%=i%>">
					</div>
				
			</div><!-- 1 끝 -->
			<%
				}
			%>

		</div>
	</div>






	<hr>
	<div class="well">
		<div class="container text-center">
			<h3 style="text-align: left">리뷰게시판</h3>
			<p>리뷰</p>
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
			var addtext = document.getElementById("addtext");
			addtext.value = "";

			var selectText = selectP.options[selectP.selectedIndex].text;
			console.log(selectText + "의 가격은 " + price + "입니다.")
			console.log(selectText + "의 최대인원수는 " + maxno + "입니다.")

			var PI = document.getElementById("PriceInfo");
			PI.innerText = "가격 : " + price + "원";

			var MI = document.getElementById("Maxno");
			MI.innerText = "최대인원수 : " + maxno + "명";

		}

		function OnKeyUp(text) {

			var addtext = document.getElementById("addtext");
			var selectP = document.getElementById("selectP");
			var selectValue = selectP.options[selectP.selectedIndex].value
					.split("|");

			var price = selectValue[0]
			var maxno = selectValue[1]
			var addprice = selectValue[2]

			var AP = Number(text) * addprice
			var TP = AP + Number(price)

			var PI = document.getElementById("PriceInfo");
			PI.innerText = "가격 : " + TP + "원";

			var regMax = /^[0-9]{1,2}$/;
			if (!regMax.test(res1.addtext.value)) {
				alert("숫자만 입력해주세요");
				return false;
			}

		}

		var rangeDate = 31; // set limit day
		var setSdate, setEdate;
		$("#from").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : 0,
			onSelect : function(selectDate) {
				console.log(selectDate)
				var stxt = selectDate.split("-");
				stxt[1] = stxt[1] - 1;
				var sdate = new Date(stxt[0], stxt[1], stxt[2]);
				var edate = new Date(stxt[0], stxt[1], stxt[2]);
				edate.setDate(sdate.getDate() + rangeDate);

				//              $('#to').datepicker('option', {
				//                  minDate: selectDate,
				//                  beforeShow : function () {
				//                      $("#to").datepicker( "option", "maxDate", edate );                
				//                      setSdate = selectDate;
				//                      console.log(setSdate)
				//              }});
				//to 설정
			}
		//from 선택되었을 때
		});

		$("#to").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : 1,
			onSelect : function(selectDate) {
				setEdate = selectDate;
				console.log(setEdate)
			}
		});
		$('.btn').on('click', function(e) {
			if ($('input#from').val() == '') {
				alert('체크인 선택해주세요.');
				$('input#from').focus();
				return false;
			} else if ($('input#to').val() == '') {
				alert('체크아웃을 선택해주세요.');
				$('input#to').focus();
				return false;
			}

			var t1 = $('input#from').val().split("-");
			var t2 = $('input#to').val().split("-");
			var t1date = new Date(t1[0], t1[1], t1[2]);
			var t2date = new Date(t2[0], t2[1], t2[2]);
			var diff = t2date - t1date;
			var currDay = 24 * 60 * 60 * 1000;
			if (parseInt(diff / currDay) > rangeDate) {
				alert('로그 조회 기간은 ' + rangeDate + '일을 초과할 수 없습니다.');
				return false;
			}

		});
	</script>
</section>

<%@ include file="/views/common/footer.jsp"%>


