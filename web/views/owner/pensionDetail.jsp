<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, com.jb.pension.model.vo.Pension, com.jb.pension.model.vo.Room" %>
<%@ page import="com.jb.pension.model.vo.RoomFacilities, com.jb.pension.model.vo.RoomFile" %>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>
<%
   String imgSrc = (String)request.getAttribute("imgSrc");
   Pension pInfo = (Pension)request.getAttribute("pInfo");
   List<Room> roomList = (List)request.getAttribute("roomList");
   List<RoomFacilities> rFacList = (List)request.getAttribute("rFacList");
   List<RoomFile> rFileList = (List)request.getAttribute("rFileList");
   String pFac = (String)request.getAttribute("pFac");
%>
<style>
.table_room2 th {
    border: 1px solid #d1d1d1;
    padding: 12px;
    background-color: #fafafa;
    vertical-align: middle;
    line-height: 18px;
}

.table_room2 th.br2, .table_room2 td.br2 {
    border-right-width: 2px;
}

.table_room2 th.bl2, .table_room2 td.bl2 {
    border-left-width: 2px;
}

.table_room2 th.bb2, .table_room2 td.bb2 {
    border-bottom-width: 2px;
}

.table_room2 th span.imgBox {
    position: relative;
}

img {
    border: 0;
    vertical-align: middle;
}

.pdb0px {
    padding-bottom: 0px !important;
}

.bb0px {
    border-bottom: 0px !important;
}

.f0 {
    border: 1px solid #dedede;
    color: #666;
    height: 20px;
    line-height: 20px;
}

.imgBox {
    margin: 0px auto;
    padding: 2px;
    width: 720px;
    height: 442px;
    border: 1px solid #eeeeee;
}

.room_img {
    width: 718px;
    height: 440px;
}

.room_sum_off {
    padding: 4px;
    border: 2px solid #dadada;
    width: 90px;
    height: 60px;
}
</style>

<div class="col-md-10">
   <br><br><br>
   <div class="tit_contents"><%=pInfo.getpName() %></div>
   <br><br>

   <div class="row pensionList">
      <div class="col-lg-6 col-md-6">
         <p>
            <img class="img-responsive" src="<%=request.getContextPath() %>/upload/pension/<%=imgSrc%>" alt="이미지 준비중" style="width:500px; height:300px;">
         </p>
      </div>
      <div class="col-lg-6 col-md-6">
         <h2><%=pInfo.getpName() %></h2>
         <h6><br></h6>
         <h4>주소 : <%=pInfo.getpAddr()%></h4>
         <h4>전화번호 : <%=pInfo.getpTel()%></h4>
         <h4>영업시작일 : <%=pInfo.getpEnrollDate()%></h4>
         <h4>블랙카운트 : <%=pInfo.getpBlcount()%></h4>
         <h4>부대시설 : <%=pFac %></h4>
         <br>
         <button id="pModify">수정</button>
         <button id="pDelete">삭제</button>
      </div>
   </div>
   
   <br><br>
   <div>
      <hr><br><h3 align="center">객실 목록</h3>
      <button id="addBtn">객실추가</button>
      <table id="tbl-clientList" class="table table-hover">
         <thead>
            <tr>
               <th style="text-align:center">객실번호</th>
               <th style="text-align: center">객실명</th>
               <th style="text-align: center">기준인원</th>
               <th style="text-align: center">최대인원</th>
               <th style="text-align: center">평수</th>
               <th style="text-align: center">가격</th>
            </tr>
         </thead>
         <tbody>
            <% if(roomList!=null && !roomList.isEmpty()) {
               for(Room r : roomList) { %>
            <tr>
                <td style="cursor:pointer">
                     <a href="#move<%=r.getrNo()%>">
                         <%=r.getrNo() %>
                     </a>
                  </td>
                <td><%=r.getrName() %></td>
               <td><%=r.getrNop() %></td>
               <td><%=r.getrMaxNop() %></td>
               <td><%=r.getrSize() %></td>
               <td><%=r.getrPrice() %></td>
            </tr>
            <%   }
             }%>
         </tbody>
      </table>
   
      <!-- 페이지바 -->
      <div class="text-center">
         <ul class="pagination">
            <li><%=request.getAttribute("pageBar") %></li>
         </ul>
      </div>
   </div>
   
   
   <br>
   <div>
      <table class="table_room2">
         <colgroup>
            <col>
            <col width="500">
         </colgroup>

         <tbody>
            <% if(roomList!=null && !roomList.isEmpty()) {
               int cnt = 0;
               for(Room r : roomList) {
                  List<RoomFile> curRfList = new ArrayList();
                  if(rFileList!=null && !rFileList.isEmpty()) {
                     for(RoomFile rf : rFileList) {
                        if(r.getrNo().equals(rf.getrNo())){
                           curRfList.add(rf);
                        }
                     }
               %>
               <tr>
                  <th class="bl2 br2 bb0px pdb0px">
                     <span class="imgBox">
                        <%if(curRfList!=null && !curRfList.isEmpty()) {%>
                        <a name="move<%=r.getrNo()%>"></a>
                        <img src="<%=request.getContextPath()%>/upload/room/<%=curRfList.get(0).getrRenameFile()%>" class="room_img<%=cnt%>">
                        <% System.out.println("메인사진 : "+curRfList.get(0).getrRenameFile()); %>
                        <%} %>
                     </span>
                  </th>
                  <th rowspan='2'>
                     <div>
                        <h2><%=r.getrName() %></h2>
                        <br>
                        <h4>객실번호 : <%=r.getrNo() %></h4>
                        <h4>기준인원 : <%=r.getrNop() %>명</h4>
                        <h4>최대인원 : <%=r.getrMaxNop() %>명</h4>
                        <h4>가격 : <%=r.getrPrice() %>원</h4>
                        <h4>추가인원당 추가요금 : <%=r.getrAddPrice() %>원</h4>
                        <h4>객실 평수 : <%=r.getrSize() %>평</h4>
                        <h4>객실 구조 : <%=r.getrStruc() %></h4>
                        <h4>객실 설명 : <%=r.getrInfo() %></h4>
                        <h4>부대시설 : 
                           <%  String rFac = "";
                              if(rFacList!=null && !rFacList.isEmpty()) {
                                 for(RoomFacilities rfc : rFacList) {
                                 if(r.getrNo().equals(rfc.getrNo())){
                                    if(rfc.getBed().equals("Y")) {
                                       rFac += " 침대 /";
                                    }
                                    if(rfc.getDressTable().equals("Y")) {
                                       rFac += " 화장대 /";
                                    }
                                    if(rfc.getTable().equals("Y")) {
                                       rFac += " 테이블 /";
                                    }
                                    if(rfc.getSofa().equals("Y")) {
                                       rFac += " 소파 /";
                                    }
                                    if(rfc.getDressCase().equals("Y")) {
                                       rFac += " 옷장 /";
                                    }
                                    if(rfc.getBath().equals("Y")) {
                                       rFac += " 욕조 /";
                                    }
                                    if(rfc.getSpa().equals("Y")) {
                                       rFac += " 스파 /";
                                    }
                                    if(rfc.getWashKit().equals("Y")) {
                                       rFac += " 세면도구 /";
                                    }
                                    if(rfc.getTv().equals("Y")) {
                                       rFac += " TV /";
                                    }
                                    if(rfc.getBeam().equals("Y")) {
                                       rFac += " 빔프로젝터 /";
                                    }
                                    if(rfc.getAircon().equals("Y")) {
                                       rFac += " 에어컨 /";
                                    }
                                    if(rfc.getFridge().equals("Y")) {
                                       rFac += " 냉장고 /";
                                    }
                                    if(rfc.getCookFac().equals("Y")) {
                                       rFac += " 조리시설 /";
                                    }
                                    if(rfc.getCookUten().equals("Y")) {
                                       rFac += " 조리기구 /";
                                    }
                                    if(rfc.getRice().equals("Y")) {
                                       rFac += " 밥솥 /";
                                    }
                                    if(rfc.getMicrowave().equals("Y")) {
                                       rFac += " 전자레인지 /";
                                    }
                                    if(rfc.getrSmoked().equals("Y")) {
                                       rFac += " 개별바베큐 /";
                                    }
                                    if(rfc.getChild().equals("Y")) {
                                       rFac += " 유아시설 /";
                                    }
                                    if(rfc.getoView().equals("Y")) {
                                       rFac += " 오션뷰 /";
                                    }
                                    if(rfc.getiPool().equals("Y")) {
                                       rFac += " 인피니티풀 /";
                                    }
                                    rFac += " ...";
                                    break;
                                 }
                              }
                           }%>
                           <%=rFac %>
                        </h4>
                        <a class="btn btn-primary" href="<%=request.getContextPath()%>/owner/modifyRoom?rNo=<%=r.getrNo()%>&pCode=<%=pInfo.getpCode()%>&imgSrc=<%=imgSrc%>&pName=<%=pInfo.getpName()%>&rName=<%=r.getrName()%>&rNop=<%=r.getrNop()%>&rMaxNop=<%=r.getrMaxNop()%>&rPrice=<%=r.getrPrice()%>&rAddPrice=<%=r.getrAddPrice()%>&rSize=<%=r.getrSize()%>&rStruc=<%=r.getrStruc()%>&rInfo=<%=r.getrInfo()%>">수정 <span class="glyphicon glyphicon-chevron-right"></span></a>
                        <a class="btn btn-primary" onclick="return delcheck();" href="<%=request.getContextPath()%>/owner/oneRoomDelete?rNo=<%=r.getrNo()%>&pCode=<%=pInfo.getpCode()%>&imgSrc=<%=imgSrc%>">삭제 <span class="glyphicon glyphicon-chevron-right"></span></a>
                     </div>
                  </th>
               </tr>
   
               <tr>
                  <th class="bl2 br2 bb2 pdt5px f0 lsm1">
                     <div id="thum_img">
                        <%for(int i=0; i<curRfList.size(); i++) { %>
                           <img src="<%=request.getContextPath()%>/upload/room/<%=curRfList.get(i).getrRenameFile()%>"
                               class="room_sum_off" id="sImg" onmouseover="showPhoto(this.src,<%=i+1%>,<%=cnt%>)">
                           <%System.out.println("사진 : "+curRfList.get(i).getrRenameFile()); %>
                        <%}%>
                     </div>
                  </th>
               </tr>
            <%   cnt++;
                  }
               }
             }%>
         </tbody>
      </table>
   </div>
</div>

<script>   
   function showPhoto(val,page,cnt){
      $(".room_img"+cnt).attr("src",val);
      $(".imgBox .img_page").text(page);
   }
   
   function delcheck(){
      return confirm("정말로 삭제하시겠습니까?");
   }
   
   //펜션 수정
   $("#pModify").click(function(){
      location.href="<%=request.getContextPath()%>/owner/modifyPension?pCode=<%=pInfo.getpCode()%>&oId=<%=pInfo.getoId()%>&pName=<%=pInfo.getpName()%>&pAddr=<%=pInfo.getpAddr()%>";
   });
   
   //펜션 삭제
   $("#pDelete").click(function(){
      if(confirm("정말로 삭제하시겠습니까?")){
         location.href="<%=request.getContextPath()%>/owner/oneDelete?pCode=<%=pInfo.getpCode()%>&oId=<%=pInfo.getoId()%>";
      }
   })
   
   //객실 추가
   $("#addBtn").click(function(){
      location.href="<%=request.getContextPath()%>/owner/addRoom?pCode=<%=pInfo.getpCode()%>&imgSrc=<%=imgSrc%>";
   });
</script>


<%@ include file="/views/common/footer.jsp"%>