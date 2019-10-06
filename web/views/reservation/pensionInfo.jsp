<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jb.pension.model.vo.Pension"%>
<%@page import="com.jb.pension.model.vo.PensionFacilities"%>
<%@page import="com.jb.pension.model.vo.Room"%>
<%@page import="java.util.List"%>
<%
	Pension p = (Pension) request.getAttribute("pension");
	String from = (String) request.getAttribute("from");
	String to = (String) request.getAttribute("to");
%>
<%@ include file="/views/common/header.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<section>
	<div class="container">
		<!-- 여기는 펜션정보 -->
		<!-- 펜션사진(1장), 펜션정보(주소,번호,안내 등), 부대시설, 예약가능객실수, 머무르는날짜 -->
		<div class="row pension" style="margin-top: 30px;">
			<div class="col-xs-7">
				<div class="carousel-inner text-center thumbnail">
					<img
						src="<%=request.getContextPath()%>/upload/pension/<%=p.getPenFile().get(0).getpRenameFile()%>"
						style="width: 100%; height: 350px;" />
				</div>
				<!-- 펜션사진 -->
			</div>
			<div class="col-xs-5">
				<!-- 펜션정보 -->
				<div class="pInfo">
					<!-- 펜션이름, 주소 -->
					<h2><%=p.getpName()%></h2>
					<h4>
						(예매가능객실수 :
						<%=p.getRoomList().size()%>)
					</h4>
					<br />
					<p>
						<strong>주소 | </strong><%=p.getpAddr()%></p>
					<p>
						<strong>연락처 | </strong><%=p.getpTel()%></p>
				</div>
			</div>
		</div>

		<hr>

		<!-- 여기는 객실정보 -->
		<!-- 객실사진(대표사진한장,서브), 객실정보(구조,설명,평수 등), 부대시설, 기준인원, 최대인원, 추가인원당추가요금, 기본가격, 총가격 -->
		<div class="row room" style="padding: 30px;">
			<div class="row" style="margin-bottom: 20px">
				<strong>체크인</strong><input type="text" name="from" id="datepicker"
					value="<%=from%>" style="width: 100px;" class="text-center">
				<strong>체크아웃</strong><input type="text" name="to" id="datepicker2"
					value="<%=to%>" style="width: 100px;" class="text-center">
				<input type="button" name="datecheck" value="조회"
					onclick="CheckInch();" class="btn my-btn">
			</div>
			<%
				if (p.getRoomList() != null) {
					for (Room r : p.getRoomList()) {
			%>
			<div class="row thumbnail" style="padding: 10px 0px;">
				<div class="col-xs-5">
					<div class="carousel-inner text-center">
						<img
							src="<%=request.getContextPath()%>/upload/room/<%=r.getRfList().get(0).getrRenameFile()%>"
							style="width: 100%; height: 200px;" />
						<!-- 객실대표사진 -->
					</div>
				</div>
				<div class="col-xs-7">
					<div>
					<form>
						<strong class="title"> <!-- 객실이름 --> <%=r.getrName()%>
						</strong>
						<div class="rInfo">
							<!-- 객실상세정보 -->
							<table class="table table-borderless">
								<tr>
									<th class="text-left">가격</th>
									<td class="text-right price" >
										<input type="text" id="<%=r.getrNo()%>price" name="price" readonly/>
									</td>
								</tr>
								<tr>
									<th class="text-left">인원수</th>
									<td class="text-right">
										<input type="number" value="1" min="1" max="<%=r.getrMaxNop()%>" id="<%=r.getrNo()%>-nop" name="nop" onkeyup="NopKeyUp(this.value,this)" onclick="NopKeyUp(this.value,this)" />
									</td>
								</tr>

							</table>
							<input type="hidden" name="rno" value="<%=r.getrNo()%>"/>
								<input type="hidden" id="<%=r.getrNo()%>Price" value="<%=r.getrPrice()%>"/>
								<input type="hidden" id="<%=r.getrNo()%>addPrice" value="<%=r.getrAddPrice()%>"/>
								<input type="hidden" id="<%=r.getrNo()%>nop" value="<%=r.getrNop()%>"/>
								<input type="hidden" id="<%=r.getrNo()%>maxNop" value="<%=r.getrMaxNop()%>"/>
							<div class="row">
								<div class="col-xs-6">
									<input class="btn my-btn" type="button" name="roomName"
										id="<%=r.getrNo()%>" class="roomName_" value="상세보기" style="width:100%;"/>
								</div>
								<div class="col-xs-6">
									<input class="btn my-btn" type="submit" value="예매하기" style="width:100%;" />
								</div>
							</div>
						
						</div>
						</form>
					</div>

				</div>
				<div class="visible">
					<!-- 머라하지..? 펼쳤다 숨겼다 할 부분! ㅎㅎ -->
				</div>
			</div>
			<%
				}
				} else {
			%>
			<h2>예약 가능한 방이 없습니다 ㅠㅠ</h2>
			<%
				}
			%>

		</div>
	</div>
</section>
<script>
	
	function CheckInch(){
		var date1 = new Date($("#datepicker").datepicker("getDate"));
	     var date2 = new Date($("#datepicker2").datepicker("getDate"));
		     if(!$("#datepicker").val()) {
		    	 alert("시작날짜를 선택하세요");
		    	 return;
		     }else if(!$("#datepicker2").val()) {
		    	 alert("끝날짜를 선택하세요");  
		    	 return;
		    }else if (date2 - date1 < 0){
		      alert("끝 날짜가 시작날짜보다 이전일수 없습니다");
		      return;
		     }else{
		    	 location.href="<%=request.getContextPath()%>/search/detailView?pCode=<%=p.getpCode()%>&from="+$("#checkIn").val()+"&to="+$("#checkOut").val();
		     }
		/* var v=$('input[name=checkIn]').val();
		console.log(v); */
    }
	
	$(function() {
        //모든 datepicker에 대한 공통 옵션 설정
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
        });

        //input을 datepicker로 선언
        $("#datepicker").datepicker();
        var from='<%=from%>';
        $("#datepicker").datepicker();
        var from='<%=to%>';
		$("#datepicker2").datepicker();
		$("#datepicker2").datepicker();

	});
	
	//인원수 선택 시, 가격정보 변경 이벤트
	function NopKeyUp(nop,e){
		//**전체 로직**
		//rno=방 번호
		//받아온 객체 중 방번호와 일치하는 정보를 먼저 판별
		//그 방에 해당하는 기준 가격/인원추가시추가가가격/기준인원 정보를 가져옴.
		//입력받은 인원수가 기준인원보다 작으면 기준가격을 출력.
		//입력받은 인원수가 기준인원보다 크면 그 차이인원만큼 추가가격을 계산하여 출력.
		
		//1.입력한 인원수
		var inputNop=nop;
		//2.입력한 인원수 input 태그의 아이디 가져오기
		var id=$(e).attr("id");
		//2-1.아이디에서 방번호 추출하기
		var rno=id.split("-")[0];
		//2-2.방번호로 기준인원,최대인원 가져오기
		var rnop=$('#'+rno+"nop").val();
		var maxNop=$('#'+rno+"maxNop").val();
		//2-3.방번호로 인원추가가격 가져오기
		var rPrice=$('#'+rno+"Price").val();
		var addPrice=$('#'+rno+"addPrice").val();
		
		//3.입력인원수와 기준인원 비교하여 분기처리
		if(maxNop>=inputNop){
			$('#'+rno+'price').val(rPrice);
		}else{
			var interval=inputNop-maxNop;
			var totalPrice=rPrice+interval*addPrice;
			$('#'+rno+'price').val(totalPrice);
		}
		
	}
	
	//처리해야할 것들
	//1. 부대시설 표시 예쁘게
	//2. 상세보기 펼치기
	//3. 예매 넘기기
</script>

<%@ include file="/views/common/footer.jsp"%>