<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp"%>

<%@ page import="java.util.List, com.jb.pension.model.vo.RoomFile, com.jb.pension.model.vo.Room, com.jb.pension.model.vo.Pension, com.jb.pension.model.vo.PensionFile" %>

<%
   Pension p = (Pension)request.getAttribute("pInfo");
   PensionFile pImg = (PensionFile)request.getAttribute("pImg");
   String pFac = (String)request.getAttribute("pFac");
   List<Room> rooms = (List)request.getAttribute("rooms");
   List<RoomFile> rImgs = (List)request.getAttribute("rImgs");
   int cPage = (int)request.getAttribute("cPage");
%>

   <div class="col-md-10 album py-5 bg-light">
       <div class="row">
          <h1 style="text-align:center"><%=p.getpName() %></h1>
         <div class="col-lg-6 col-md-6">
            <p>
               <img class="img-responsive" src="<%=request.getContextPath() %>/upload/pension/<%=pImg.getpRenameFile()%>" alt="펜션사진" style="width:500px; height:300px;">
            </p>
         </div>
         <div class="col-lg-6 col-md-6">
            <h6><br></h6>
            <h4>펜션코드 : <%=p.getpCode() %></h4>
            <h4>주소 : <%=p.getpAddr()%></h4>
            <h4>전화번호 : <%=p.getpTel()%></h4>
            <h4>영업시작일 : <%=p.getpEnrollDate()%></h4>
            <h4>블랙카운트 : <%=p.getpBlcount()%></h4>
            <h4>부대시설 : <%=pFac %></h4>
            <br>
         </div>
      </div>
       
       <br><br>
       <hr>
       <br>
       
       <h1 style="text-align:center">객실</h1>
       <div class="row">
          <% if(rooms!=null && !rooms.isEmpty()) {
            for(Room r : rooms) { %>
               <div class="col-md-4">
                  <!-- <div class="card mb-4 shadow-sm"> -->
                     <%  String imgSrc = "";
                        if(rImgs!=null && !rImgs.isEmpty()) {
                           for(RoomFile rf : rImgs){
                              if(r.getrNo().equals(rf.getrNo())){
                                 imgSrc = rf.getrRenameFile();
                                 break;
                              }
                           }
                        }%>
                  <div>
                     <img src="<%=request.getContextPath()%>/upload/room/<%=imgSrc%>" alt="객실사진" width="400" height="200">
                  </div>
                     
                  <div class="card-body">
                     <p class="card-text">
                        ROOM INFO <br>
                        R_NO : <%=r.getrNo() %> <br>
                        R_NAME : <%=r.getrName() %> <br>
                        R_PRICE : <%=r.getrPrice() %> <br>
                        R_NOP : <%=r.getrNop() %> <br>
                     </p>
                     <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="moveJsp();">View</button>
                         <script>
							function moveJsp(){
								location.href="<%=request.getContextPath()%>/master/roomDetail?pCode=<%=p.getpCode()%>&rNo=<%=r.getrNo()%>";
							}
						 </script>
                     </div>
                  </div>
               <br><br>
            <!-- </div> -->
            </div>
         <%
            }
         }
         %>
      </div>

      <div class="text-center">
         <ul class="pagination">
            <li><%=request.getAttribute("pageBar") %></li>
         </ul>
      </div>
   </div>
   
<%@ include file="/views/common/footer.jsp"%>