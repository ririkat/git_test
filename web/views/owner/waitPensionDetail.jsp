<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

<%@ page
	import="java.util.List, com.jb.pension.model.vo.Room, com.jb.pension.model.vo.Pension"%>

<%
	String imgSrc = (String)request.getAttribute("imgSrc");
	Pension pInfo = (Pension)request.getAttribute("pInfo");
	String pFac = (String)request.getAttribute("pFac");
%>



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
         <button id="pDelete" onclick="deleteBtn();">삭제</button>
      </div>
   </div>
</div>

<script>
function deleteBtn(){
	if(confirm("삭제(등록신청취소)하시겠습니까?")){
		location.href="<%=request.getContextPath()%>/owner/oneDelete?pCode=<%=pInfo.getpCode()%>&oId=<%=pInfo.getoId()%>";
	}
}
</script>


<%@ include file="/views/common/footer.jsp"%>