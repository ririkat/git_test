<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.jb.owner.model.vo.Owner"%>
<%
   Owner o = (Owner)request.getAttribute("owner");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp"%>

<div class="col-md-10">
	<div class="mContent">
		<br><br><br>
		 <center><p class="title" style="color: #6a60a9;">승인 신청 한 업주 상세정보</p></center>
		<br><br><br>
		
		<section id="enroll-container">		
		      <table class="updateTable">
		         <colgroup>
		            <col width="160px">
		            <col width="">
		         </colgroup>
		         <tbody>
		            <tr>
		               <th class="point" style="vertical-align: middle"><strong
		                  class="point">*</strong>이름</th>
		               <td><%=o.getoName() %><input type="hidden" name="uid" value=""></td>
		            </tr>
		            
		            <tr>
		               <th class="point"><strong class="point"></strong>생년월일</th>
		               <td><%=o.getoBirth() %></td>
		            </tr>
		
		            <tr>
		               <th class="point"><strong class="point">*</strong>성별</th>
		               <%if(o.getoGender().charAt(0)=='M'){ %>
		                  <td>
		                     <input type="radio" name="usex" value="M" checked disabled>남
		                     &nbsp; <input type="radio" name="usex" value="F" disabled>여
		                  </td>
		               <%} else{ %>
		                  <td>
		                     <input type="radio" name="usex" value="M" disabled>남 &nbsp;
		                     <input type="radio" name="usex" value="F" checked disabled>여
		                  </td>
		               <%} %>
		            </tr>
		
		            <tr>
		               <th class="point"><strong class="point">*</strong>아이디</th>
		               <td><%=o.getoId() %></td>
		            </tr>
		            
		            <tr>
		               <th class="point"><strong class="point">*</strong>이메일</th>
		               <td><%=o.getoEmail()%></td>
		            </tr>
		
		            <tr>
		               <th class="point"><strong class="point">*</strong>핸드폰번호</th>
		               <td><%=o.getoPhone() %></td>
		            </tr>
		
		            <tr>
		               <th class="point">주소</th>
		               <td><%=o.getoAddr() %></td>
		            </tr>
		         </tbody>
		      </table>
		   
		   <br><br>
		   <div class="button">
		      <input type="button" onclick="acceptOwner();" value="승인">
		      <input type="button" onclick="deleteOwner();" value="삭제">
		   </div>
		</section>
	</div>
</div>

<script>
   function acceptOwner(){
      if(confirm("승인하시겠습니까?")){
         location.href="<%=request.getContextPath()%>/master/oneOwnerAccept?oId=<%=o.getoId()%>";      
      }
   }
   
   function deleteOwner(){
      if(confirm("삭제하시겠습니까?")){
         location.href="<%=request.getContextPath()%>/master/oneOwnerDelete?oId=<%=o.getoId()%>";
      }
   }
</script>


<%@ include file="/views/common/footer.jsp"%>