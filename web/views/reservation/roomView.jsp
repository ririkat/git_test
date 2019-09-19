<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.jb.pension.model.vo.Room" %>

<%
	Room r = (Room) request.getAttribute("room"); 
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
    
    
    <form class="reservation-form" method="post" action="<%=request.getContextPath() %>/reservation">
    <div class="col-sm-4">
    	<div class="well">
			<!-- 방번호 -->
    		<input type="hidden" name="rno" id="r_no" value="<%=r.getrNo()%>">
    		방이름<p name="rname" id="r_name"><%=r.getrName()%></p>
    		
    		
    		가격<p><%=r.getrPrice()%></p>
    		<input type="hidden" name="rprice" id="r_price" value="<%=r.getrPrice()%>">
    		
    		인원수<p><%=r.getrNop()%></p>
  			<input type="hidden" name="rnop" id="r_nop" value="<%=r.getrNop()%>">
  			
  			
  			최대인원<p name="rmaxnop" id="r_maxnop"><%=r.getrMaxNop()%></p>
  			평수<p name="rsize" id="r_size"><%=r.getrSize()%></p>
			<!--펜션코드 -->
  			<input type="hidden" name="pcode" id="p_code" value="<%=r.getpCode()%>">
    
      </div>
      <button class="btn btn-md btn-warning btn-block">
        찜</button>
    <input type="submit" class="btn btn-sm btn-warning btn-block" value="예약" />
  			
      </div>
     
    <!-- <button class="btn btn-md btn-warning btn-block" type="submit">
        날짜선택</button> -->
   	
   
    </form>
    </div>
  </div>
  <hr>
  <div>
  
  
  
  
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
    <h3>기본 정보</h3><br><br>
    <p><strong>객실구조</strong></p>
    <p name="rstruc" id="r_struc"><%=r.getrStruc()%></p>
      <p><strong>객실설명</strong></p>
    <p name="rinfo" id="r_info"><%=r.getrInfo()%></p>
    </div>
    <hr>
    
    
    <div class="container text-center">
      <h3>리뷰게시판</h3>
      <p>ㅎㅇ</p>
    </div>


    <script src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
  </section>
	
	<script>
// 	function reservationbutton(){
<%--     	location.href="<%=request.getContextPath()%>/reservation"; --%>
//     }
	</script>
	
<%@ include file="/views/common/footer.jsp" %>


