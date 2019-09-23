<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.pension.model.vo.Room, com.jb.pension.model.vo.RoomFile, com.jb.pension.model.vo.RoomFacilities, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp"%>
<%
	String pCode = (String)request.getAttribute("pCode");
	Room r = (Room)request.getAttribute("r");
	List<RoomFile> rFileList = (List)request.getAttribute("rFileList");
	RoomFacilities rfc = (RoomFacilities)request.getAttribute("rFac");
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
	<div class="mContent">
		<br><br><br>
		<div class="tit_contents"><%=r.getrName()%></div>
		<br><br><br>
		<table class="table_room2">
	         <colgroup>
	            <col>
	            <col width="500">
	         </colgroup>
	
	         <tbody>
	            <tr>
	            	<%if(rFileList!=null && !rFileList.isEmpty()) {%>
	                  <th class="bl2 br2 bb0px pdb0px">
	                     <span class="imgBox">
	                        <img src="<%=request.getContextPath()%>/upload/room/<%=rFileList.get(0).getrRenameFile()%>" class="room_img">
	                        <% System.out.println("메인사진 : "+rFileList.get(0).getrRenameFile()); %>
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
	                              %>
	                           <%=rFac %>
	                        </h4>
	                        <a class="btn btn-primary" onclick="return delcheck();" href="<%=request.getContextPath()%>/master/oneRoomDelete?pCode=<%=pCode%>&rNo=<%=r.getrNo()%>">삭제 <span class="glyphicon glyphicon-chevron-right"></span></a>
	                     </div>
	                  </th>
	               </tr>
	   
	               <tr>
	                  <th class="bl2 br2 bb2 pdt5px f0 lsm1">
	                     <div id="thum_img">
	                        <%for(int i=0; i<rFileList.size(); i++) { %>
	                           <img src="<%=request.getContextPath()%>/upload/room/<%=rFileList.get(i).getrRenameFile()%>"
	                               class="room_sum_off" id="sImg" onmouseover="showPhoto(this.src,<%=i+1%>)">
	                           <%System.out.println("사진 : "+rFileList.get(i).getrRenameFile()); %>
	                        <%}
	                        }%>
	                     </div>
	                  </th>
	               </tr>
	         </tbody>
      </table>
   </div>
</div>

<script>   
   function showPhoto(val,page){
      $(".room_img").attr("src",val);
      $(".imgBox .img_page").text(page);
   }
   
   function delcheck(){
      return confirm("정말로 삭제하시겠습니까?");
   }
</script>


<%@ include file="/views/common/footer.jsp"%>