<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.reservation.model.vo.Reservation" %>
<%
   List<Reservation> reservations = (List)request.getAttribute("reservations");
//    String searchType = (String)request.getAttribute("searchType");
//    String searchKey = (String)request.getAttribute("searchKeyword");
%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

<!--content영역-->
<div class="col-md-10">
   <br>
   <br>
   <br>
  <div class="tit_contents">대기중인 예약자 목록</div>
   <br>

<!--    <div class="pull-left"> -->
<!--       검색타입 : <select id="searchType" style="width: 90px; height: 25px;"> -->
<%--          <option value="ownerId" <%="o_id".equals(searchType)?"selected":"" %>> --%>
<!--             업주 아이디</option> -->
<%--          <option value="ownerName" <%="o_name".equals(searchType)?"selected":"" %>> --%>
<!--             업주 이름</option> -->
<!--       </select> -->

<!--       <div id="search-ownerId"> -->
<%--          <form action="<%=request.getContextPath()%>/master/waitOwnerSearch"> --%>
<!--             <input type="hidden" name="searchType" value="o_id" /> -->
<%--             <input type="hidden" name="cPage" value="<%=cPage %>" /> --%>
<!--             <input type="text" placeholder="업주 아이디 검색" name="searchKeyword" -->
<%--                value='<%="o_id".equals(searchType)?searchKey:"" %>' --%>
<!--                style="width: 150px; height: 25px" /> -->
<!--             <button type="submit">검색</button> -->
<!--          </form> -->
<!--       </div> -->

<!--       <div id="search-ownerName"> -->
<%--          <form action="<%=request.getContextPath()%>/master/waitOwnerSearch"> --%>
<!--             <input type="hidden" name="searchType" value="o_name" /> -->
<%--             <input type="hidden" name="cPage" value="<%=cPage %>" /> --%>
<!--             <input type="text" placeholder="업주이름으로 검색" name="searchKeyword" -->
<%--                value='<%="o_name".equals(searchType)?searchKey:"" %>' --%>
<!--                style="width: 150px; height: 25px" /> -->
<!--             <button type="submit">검색</button> -->
<!--          </form> -->
<!--       </div> -->
<!--    </div> -->
   <button id="deleteBtn" class="pull-right">삭제</button>
   <button id="acceptBtn" class="pull-right">승인</button>
   <br>
   <br>
   <br>


   <table id="tbl-resWaitClient" class="table table-hover">
      <thead>
         <tr>
            <th style="text-align: left">
               <input type="checkbox" name="selected_all">
            </th>
            <th style="text-align: center">예약코드</th>
            <th style="text-align: center">펜션이름</th>
            <th style="text-align: center">방이름</th>
            <th style="text-align: center">체크인</th>
            <th style="text-align: center">체크아웃</th>
            <th style="text-align: center">예약자</th>
            <th style="text-align: center">결제방법</th>
            <th style="text-align: center">승인신청날짜</th>
         </tr>
      </thead>
      <tbody>
         <% if(reservations!=null && !reservations.isEmpty()) {
                           for(Reservation res : reservations) { %>
         <tr>
            <td style="text-align: left">
               <input type="checkbox" name="selected" value="ROW">
            </td>
            <td style="cursor: pointer">
                  <%=res.getResCode() %>
            </td>
            <td><%=res.getPension().getpName() %></td>
            <td><%=res.getRoom().getrName() %></td>
            <td><%=res.getResCheckIn() %></td>
            <td><%=res.getResCheckOut() %></td>
            <td><%=res.getClient().getcId()%></td>
            <td><%=res.getPayment().getPayMethod() %></td>
            <td><%=res.getResDate() %></td>
         </tr>
         <%   }
         }%>
      </tbody>
   </table>

<!--    <div class="text-center"> -->
<!--       <ul class="pagination"> -->
<%--          <li><%=request.getAttribute("pageBar") %></li> --%>
<!--       </ul> -->
<!--    </div> -->

   <script>
      //검색창 숨기기, 정렬
//       $(function(){
//          var o_id = $("#search-ownerId");
//          var o_name = $("#search-ownerName");
//          var searchType = $("#searchType");
//          searchType.change(function(){
//               o_id.hide();
//             o_name.hide();
//               $("#search-"+this.value).css("display","inline-block");
//          });
//          $("#searchType").trigger('change');
                  
//          $('#mypageList li').removeClass("active");
//          $('#mypageList li').eq(0).addClass("active");
//       });

      //전체 선택 및 해제
      $('input[name=selected_all]').on('change', function(){
         $('input[name=selected]').prop('checked', this.checked);
      });
                 
      //삭제버튼 동작
      $("#deleteBtn").click(function(){
         var checkbox = $("input[name=selected]:checked");
                    
         if(checkbox.length==0){
            alert("삭제(승인반려)할 예약자를 선택해주세요.");
         }
         else{
         if(confirm("정말로 삭제(승인반려)하시겠습니까?")){
            var tdArr = new Array();
                           
            // 체크된 체크박스 값을 가져온다
            checkbox.each(function(i) {
               var tr = checkbox.parent().parent().eq(i);
               var td = tr.children();
                              
               // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
               var oId = td.eq(6).text().trim();
                              
               // 가져온 값을 배열에 담는다.
               tdArr.push(oId);
               
               
            });
            //삭제할 업주들을 서블릿으로 보내기
            location.href="<%=request.getContextPath()%>/owner/waitResDelete?delResList="+tdArr;
         }
      }
   });
                 
   //승인버튼 동작
   $("#acceptBtn").click(function(){
      var checkbox = $("input[name=selected]:checked");
                    
      if(checkbox.length==0){
         alert("승인할 예약자를 선택해주세요.");
      }
      else{
         if(confirm("승인하시겠습니까?")){
            var tdArr = new Array();
                           
            // 체크된 체크박스 값을 가져온다
            checkbox.each(function(i) {
               var tr = checkbox.parent().parent().eq(i);
               var td = tr.children();
                              
   				var oId = td.eq(6).text().trim();
   				
               // 가져온 값을 배열에 담는다.
               tdArr.push(oId);
            });
            
            //승인할 예약자들을 서블릿으로 보내기
            alert(tdArr);
            location.href="<%=request.getContextPath()%>/owner/waitResClientAccept?accResList="+tdArr;
         }
      }
   });
   </script>

</div>
<%@ include file="/views/common/footer.jsp"%>