<%@page import="com.jb.pension.model.vo.PensionFacilities"%>
<%@page import="com.jb.pension.model.vo.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.jb.pension.model.vo.Pension" %>

<%
	Pension p = (Pension) request.getAttribute("pension"); 
%>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <SCRIPT type="text/javascript" src="http://www.blueb.co.kr/SRC/javascript/js/dhtmlgoodies_calendar.js?random=20060118"></script>
    <link rel="stylesheet" href="css/hotel.css">
    <link rel="stylesheet" href="css/bootstrap.css">
   
  <section>
      <nav class="navbar navbar-inverse navbar-fixed-top navbg">
    <div class="container nav">
        <div class="navbar-header ">
            <!-- 화면이 줄었을때 버튼생성,스펜포함 -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand mainfont" href="#">자바방</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right font2">
                <li><a class="aa" href="#">공지사항</a></li>
                <li><a class="aa" href="#">게시판</a></li>
                <li><a class="aa" href="#"><span class="glyphicon"></span> 로그인</a></li>
            </ul>
        </div>
    </div>
</nav>

</br></br></br></br></br></br>
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
            <div class="carousel-caption">
              <h3>Sell $</h3>
              <p>Money Money.</p>
            </div>      
          </div>
  
          <div class="item">
            <img src="https://placehold.it/800x400?text=Another Image Maybe" alt="Image">
            <div class="carousel-caption">
              <h3>More Sell $</h3>
              <p>Lorem ipsum...</p>
            </div>      
          </div>
        </div>
  
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
    
    
    <form class="reservation-form" method="post" action="<%=request.getContextPath()%>">
    <div class="col-sm-4">
    	<div class="well">
    	<input type="hidden" name="pcode" id="p_code" value="<%=p.getpCode()%>">
		<h1 style="text-align: center"><%=p.getpName()%></h1><br>
		<p>펜션주소 : <%=p.getpAddr()%></p>
		<p>예약문의 : <%=p.getpTel()%></p>
		<p>입퇴실 안내 : 입실 오후 3시부터 , 퇴실 11시까지<p>
		
		<p><%=p.getRoomList().get(0).getrPrice()%>원</p>
		
      </div>
<!--       <button class="btn btn-md btn-warning btn-block"> -->
<!--         찜</button> -->
<!--     <input type="submit" class="btn btn-sm btn-warning btn-block" value="예약" /> -->
  			
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
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
        <p>1</p>
      </div>
      <div class="col-sm-3"> 
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
        <p>2</p>    
      </div>
      <div class="col-sm-3"> 
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
        <p>3</p>    
      </div>
      <div class="col-sm-3"> 
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
        <p>4</p>    
      </div>
    </div>
    <hr>
  </div>
  
  	<div class="container text-center">
    <div class="well">
    <h3>펜션 정보</h3>
	<p>펜션 정보입니다.</p>
    </div>
    </div>
  
<%-- 	<form class="reservation-form" method="post" action="<%=request.getContextPath()%>/roomInfo"> --%>
  <div class="container text-center">
    <div class="well">
    <h3>방 정보</h3>
    
<%-- <input type="hidden" name="pcode" id="p_code" value="<%=p.getpCode()%>"> --%>
    	
   <%for(Room r : p.getRoomList()) { %>
		<input type="button" name="roomName" class="roomName_" value="<%=r.getrName()%>|<%=r.getrNo() %>" />
		<%-- <input type="button" name="roomNo" id="roomNo_" value="<%=r.getrNo()%>"/> --%>
<%--     	<%="'"+r.getrNo()+"'"%> --%>
		<div id="room"></div>
    <%} %>
    </div>
    </div>
    <hr>
<!-- </form> -->
  
  
  <div class="container text-center">
  	<div class="well">

    <h3>부대시설</h3><br><br>
    
  <p>매점<input type="checkbox" disabled name="penfac" id="fac1" value="<%=p.getPenFac().getStore()%>">
    와이파이<input type="checkbox" disabled name="penfac" id="fac2" value="<%=p.getPenFac().getWifi() %>">
    애견가능<input type="checkbox" disabled name="penfac" id="fac3" value="<%=p.getPenFac().getPet() %>">
    공용수영장<input type="checkbox" disabled name="penfac" id="fac4" value="<%=p.getPenFac().getPool() %>">
    어린이풀장<input type="checkbox" disabled name="penfac" id="fac5" value="<%=p.getPenFac().getsPool() %>">
    워터슬라이드<input type="checkbox" disabled name="penfac" id="fac6" value="<%=p.getPenFac().getSlide() %>">
    노천탕<input type="checkbox" disabled name="penfac" id="fac7" value="<%=p.getPenFac().getOpenBath() %>">
    그릴<input type="checkbox" disabled name="penfac" id="fac8" value="<%=p.getPenFac().getGrill() %>">
    바베큐<input type="checkbox" disabled name="penfac" id="fac9" value="<%=p.getPenFac().getSmoked() %>">
    카페<input type="checkbox" disabled name="penfac" id="fac10" value="<%=p.getPenFac().getCafe() %>">
    노래방<input type="checkbox" disabled name="penfac" id="fac11" value="<%=p.getPenFac().getSing() %>">
    족구장<input type="checkbox" disabled name="penfac" id="fac12" value="<%=p.getPenFac().getFoot() %>">
    농구장<input type="checkbox" disabled name="penfac" id="fac13" value="<%=p.getPenFac().getHand() %>">
    주차장<input type="checkbox" disabled name="penfac" id="fac14" value="<%=p.getPenFac().getCar() %>"></p>

    </div>
    </div>
    <hr>
    
    
    <div class="container text-center">
      <h3>리뷰게시판</h3>
      <p>리뷰</p>
    </div>

			
    <script src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    
    
    <script>    
		$(function(){
			$(".roomName_").click(function(){
				/* var rno=$(this).val().split("|")[1]; */
				
				$.ajax({
					url:"<%=request.getContextPath()%>/roomInfo",
					type:"post",
					data:{rno:rno},
					dataType:"html",
					success:function(data){
						$("#room").html(data);
						console.log(data);
					}
				});
				<%-- var rname=<%=p.getRoomList().get(0).getrName()%>
				var imgSrc=<%=p.getRoomList().get(0).get --%>
			});
		});
	
	
	</script>
    }

   
  <script>
  window.onload = function() {
	  var chkbox = document.getElementsByName('penfac');
	  
	  console.log("length: "+chkbox.length)
	  
	  for(var i =0; i<chkbox.length; i++){
		  if(chkbox[i].value=="Y") {
			  chkbox[i].checked = true;
		  }
		  else
		  {
		  chkbox[i].checked = false;
		  }
	  }

  }
  </script>  
    
  </section>
	
<%@ include file="/views/common/footer.jsp" %>


		