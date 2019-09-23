<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp"%>

<%@ page import="java.util.List, com.jb.pension.model.vo.Room, com.jb.pension.model.vo.Pension, com.jb.pension.model.vo.PensionFile" %>

<%
   Pension p = (Pension)request.getAttribute("pInfo");
   PensionFile pImg = (PensionFile)request.getAttribute("pImg");
   String pFac = (String)request.getAttribute("pFac");
%>

<div class="col-md-10">
   <div class="mContent">
		<br><br><br>
		<div class="tit_contents"><%=p.getpName() %></div>
		<br><br><br>
		
		<div class="row">
	      <div class="col-lg-6 col-md-6">
	         <p>
	            <img class="img-responsive" src="<%=request.getContextPath() %>/upload/pension/<%=pImg.getpRenameFile()%>" alt="펜션사진" style="width:500px; height:300px;">
	         </p>
	      </div>
	      <div class="col-lg-6 col-md-6">
	         <h6><br></h6>
	         <h4>펜션코드 : <%=p.getpCode() %></h4>
	         <h4>업주 아이디 : <%=p.getoId() %></h4>
	         <h4>주소 : <%=p.getpAddr()%></h4>
	         <h4>전화번호 : <%=p.getpTel()%></h4>
	         <h4>승인신청일 : <%=p.getpEnrollDate()%></h4>
	         <h4>블랙카운트 : <%=p.getpBlcount()%></h4>
	         <h4>부대시설 : <%=pFac %></h4>
	         <br>
	         <button id="acceptBtn" class="btn" onclick="acceptBtn();">승인(추가)</button>
	         <button id="deleteBtn" class="btn" onclick="deleteBtn();">반려(삭제)</button>
	      </div>
	   </div>
   </div>
</div>

<script>
   function acceptBtn(){
      if(confirm("승인하시겠습니까?")){
         location.href="<%=request.getContextPath()%>/master/oneAccept?pCode=<%=p.getpCode()%>&oId=<%=p.getoId()%>";
      }
   }
   
   function deleteBtn(){
      if(confirm("반려(삭제)하시겠습니까?")){
         location.href="<%=request.getContextPath()%>/master/oneDelete?pCode=<%=p.getpCode()%>&oId=<%=p.getoId()%>";
      }
   }
</script>


<%@ include file="/views/common/footer.jsp"%>