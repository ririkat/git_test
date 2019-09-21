<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.pension.model.vo.Room" %>
<%
	Room r = (Room) request.getAttribute("room"); 	
%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
    /* Add a gray background color and some padding to the footer */
    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }
    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
  </style> 

<section>



<!-- <div class="container"> -->
<!-- <div class="row"> -->
<!--   <div class="col-sm-8"> -->
<!--     <div id="myCarousel" class="carousel"> -->


<!--       <div class="carousel-inner"> -->
<!--         <div class="item active"> -->
<%-- <%--           <img src="<%=request.getContextPath()%>/upload/pension/<% %>" alt="Image"> --%> --%>
<!--            <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"> -->
<!--           <div class="carousel-caption"> -->
<!--           </div>       -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!--   <div class="col-sm-4"> -->
    
<%--       <h1><%=r.getrName()%></h1> --%>
<%-- 	  <h3><%=r.getrPrice() %></h3> --%>
<!--   </div> -->
<!-- </div> -->
<!-- <hr> -->
<!-- </div> -->


<div class="container text-center">    
  <h3>방 사진</h3>
  <br>
  <div class="row">
    <div class="col-sm-2">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Partner 1</p>
    </div>
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Partner 2</p>    
    </div>
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Partner 3</p>
    </div>
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Partner 4</p>
    </div> 
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Partner 5</p>
    </div>     
    </div> 
  </div>
<br>

<hr>
    <div class="container text-center">
      <h3>룸정보</h3><br>
      <p><%=r.getrInfo() %></p><br>
      <p>최대인원 : <%=r.getrMaxNop()%>명</p>
      <p>평수 : <%=r.getrSize() %>평</p>
      <p>객실구조 : <%=r.getrStruc()%></p>
      <p>추가 인원당 요금 : <%=r.getrStruc()%></p>
    </div>
	<div class="container text-center">
      <h3></h3>
      <p></p>
    </div>
    
    <hr>
    <div class="container text-center">
    
      <h3>객실 부대시설</h3><br>
      <p>
	  침대<input type="checkbox" disabled name="roomfac" id="fac1" value="<%=r.getRoomFac().getBed()%>">  
	  화장대<input type="checkbox" disabled name="roomfac" id="fac2" value="<%=r.getRoomFac().getDressTable()%>">
	  테이블<input type="checkbox" disabled name="roomfac" id="fac3" value="<%=r.getRoomFac().getTable()%>">
	  소파<input type="checkbox" disabled name="roomfac" id="fac4" value="<%=r.getRoomFac().getSofa()%>">
	  옷장<input type="checkbox" disabled name="roomfac" id="fac5" value="<%=r.getRoomFac().getDressCase()%>">
	  욕조<input type="checkbox" disabled name="roomfac" id="fac6" value="<%=r.getRoomFac().getBath()%>">
	  스파<input type="checkbox" disabled name="roomfac" id="fac7" value="<%=r.getRoomFac().getSpa()%>">
	  세면도구<input type="checkbox" disabled name="roomfac" id="fac8" value="<%=r.getRoomFac().getWashKit()%>">
	  티비<input type="checkbox" disabled name="roomfac" id="fac9" value="<%=r.getRoomFac().getTv()%>">
	  빔프로젝터<input type="checkbox" disabled name="roomfac" id="fac10" value="<%=r.getRoomFac().getBeam()%>">
	  에어컨<input type="checkbox" disabled name="roomfac" id="fac11" value="<%=r.getRoomFac().getAircon()%>">
	  냉장고<input type="checkbox" disabled name="roomfac" id="fac12" value="<%=r.getRoomFac().getFridge()%>">
	  조리시설<input type="checkbox" disabled name="roomfac" id="fac13" value="<%=r.getRoomFac().getCookFac()%>">
	  조리기구<input type="checkbox" disabled name="roomfac" id="fac14" value="<%=r.getRoomFac().getCookUten()%>">
	  밥솥<input type="checkbox" disabled name="roomfac" id="fac15" value="<%=r.getRoomFac().getRice()%>">
	  전자레인지<input type="checkbox" disabled name="roomfac" id="fac16" value="<%=r.getRoomFac().getMicrowave()%>">
	  개별바베큐<input type="checkbox" disabled name="roomfac" id="fac17" value="<%=r.getRoomFac().getrSmoked()%>">
	  유아시설<input type="checkbox" disabled name="roomfac" id="fac18" value="<%=r.getRoomFac().getChild()%>">
	  오션뷰<input type="checkbox" disabled name="roomfac" id="fac19" value="<%=r.getRoomFac().getoView()%>">
	  인피니티풀   <input type="checkbox" disabled name="roomfac" id="fac20" value="<%=r.getRoomFac().getiPool()%>">
      </p>
    </div>
    
  <script>
  window.onload = function() {
	  
	  var chkbox = document.getElementsByName('roomfac');
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

