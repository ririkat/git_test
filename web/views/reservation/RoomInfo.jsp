<%@page import="java.awt.Checkbox"%>
<%@page import="com.jb.pension.model.vo.RoomFacilities"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.pension.model.vo.Room, com.jb.pension.model.vo.RoomFile, java.util.List,com.jb.pension.model.vo.RoomFacilities" %>
<%
	Room r = (Room) request.getAttribute("room"); 
	RoomFacilities rf=null;
	if(r!=null)
	{
		rf=r.getRoomFac();
	}
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
<%-- <%--           <img src="<%=request.getContextPath()%>/upload/pension/<% %>" alt="Image"> --%>
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
 <div class="tit_contents">객실사진</div>
  <br>
  <div class="row">
  	<%List<RoomFile> rfList = r.getRfList();
  		if(rfList!=null && !rfList.isEmpty()){
  			for(int i=0; i<rfList.size(); i++){
  				String imgSrc = rfList.get(i).getrRenameFile();%>
  				<div class="col-sm-2">
			      <img src="<%=request.getContextPath()%>/upload/room/<%=imgSrc%>" class="img-responsive" style="width:100%" alt="Image">
			      <p>Partner 1</p>
			    </div>
  	<%		}
  		}
  	%>
      
    </div> 
  </div>
<br>

<hr>
    <div class="container text-center">
      <div class="tit_contents">객실정보</div><br>
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
<%--     <%=rf!=null&&!rf.getBed().isEmpty()?"checked":"" %> --%>
      <div class="tit_contents">객실부대시설</div><br>
      <p style="text-align: center">
      


	침대<input type="checkbox" disabled name="roomfac" id="fac1" value="<%=r.getRoomFac().getBed()%>"<%=rf.getBed() == "Y"?"checked":""%>>  



<%-- 	침대<input type="checkbox" disabled name="roomfac" id="fac1" value="<%=r.getRoomFac().getBed()%>"<%=rf.getBed() == "Y"?"checked":""%>>   --%>
<%-- 	  화장대<input type="checkbox" disabled name="roomfac" id="fac2" value="<%=r.getRoomFac().getDressTable()%>"<%=rf.getDressTable() == "Y"?"checked":""%>>  --%>
<%-- 	  테이블<input type="checkbox" disabled name="roomfac" id="fac3" value="<%=r.getRoomFac().getTable()%>"<%=rf.getTable() == "Y"?"checked":""%>>  --%>
<%-- 	  소파<input type="checkbox" disabled name="roomfac" id="fac4" value="<%=r.getRoomFac().getSofa()%>"<%=rf.getSofa() == "Y"?"checked":""%>>  --%>
<%-- 	  옷장<input type="checkbox" disabled name="roomfac" id="fac5" value="<%=r.getRoomFac().getDressCase()%>"<%=rf.getDressCase() == "Y"?"checked":""%>>  --%>
<%-- 	  욕조<input type="checkbox" disabled name="roomfac" id="fac6" value="<%=r.getRoomFac().getBath()%>"<%=rf.getBath() == "Y"?"checked":""%>>  --%>
<%-- 	  스파<input type="checkbox" disabled name="roomfac" id="fac7" value="<%=r.getRoomFac().getSpa()%>"<%=rf.getSpa() == "Y"?"checked":""%>>  --%>
<%-- 	  세면도구<input type="checkbox" disabled name="roomfac" id="fac8" value="<%=r.getRoomFac().getWashKit()%>"<%=rf.getWashKit() == "Y"?"checked":""%>>  --%>
<%-- 	  티비<input type="checkbox" disabled name="roomfac" id="fac9" value="<%=r.getRoomFac().getTv()%>"<%=rf.getTv() == "Y"?"checked":""%>>  --%>
<!-- 	 <br><br>  -->
<%-- 	  빔프로젝터<input type="checkbox" disabled name="roomfac" id="fac10" value="<%=r.getRoomFac().getBeam()%>"<%=rf.getBeam() == "Y"?"checked":""%>>  --%>
<%-- 	  에어컨<input type="checkbox" disabled name="roomfac" id="fac11" value="<%=r.getRoomFac().getAircon()%>"<%=rf.getAircon() == "Y"?"checked":""%>>  --%>
<%-- 	  냉장고<input type="checkbox" disabled name="roomfac" id="fac12" value="<%=r.getRoomFac().getFridge()%>"<%=rf.getFridge() == "Y"?"checked":""%>>  --%>
<%-- 	  조리시설<input type="checkbox" disabled name="roomfac" id="fac13" value="<%=r.getRoomFac().getCookFac()%>"<%=rf.getCookFac() == "Y"?"checked":""%>>  --%>
<%-- 	  조리기구<input type="checkbox" disabled name="roomfac" id="fac14" value="<%=r.getRoomFac().getCookUten()%>"<%=rf.getCookUten() == "Y"?"checked":""%>>  --%>
<%-- 	  밥솥<input type="checkbox" disabled name="roomfac" id="fac15" value="<%=r.getRoomFac().getRice()%>"<%=rf.getRice() == "Y"?"checked":""%>>  --%>
<%-- 	  전자레인지<input type="checkbox" disabled name="roomfac" id="fac16" value="<%=r.getRoomFac().getMicrowave()%>"<%=rf.getMicrowave() == "Y"?"checked":""%>>  --%>
<%-- 	  개별바베큐<input type="checkbox" disabled name="roomfac" id="fac17" value="<%=r.getRoomFac().getrSmoked()%>"<%=rf.getrSmoked() == "Y"?"checked":""%>>  --%>
<%-- 	  유아시설<input type="checkbox" disabled name="roomfac" id="fac18" value="<%=r.getRoomFac().getChild()%>"<%=rf.getChild() == "Y"?"checked":""%>>  --%>
<%-- 	  오션뷰<input type="checkbox" disabled name="roomfac" id="fac19" value="<%=r.getRoomFac().getoView()%>"<%=rf.getoView() == "Y"?"checked":""%>>  --%>
<%-- 	  인피니티풀   <input type="checkbox" disabled name="roomfac" id="fac20" value="<%=r.getRoomFac().getiPool()%>"<%=rf.getiPool() == "Y"?"checked":""%>>  --%>

      </p>
    </div>
    

</section>

