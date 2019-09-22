<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

<%@ page import="java.util.List, com.jb.pension.model.vo.Room, com.jb.pension.model.vo.Pension" %>

<%
	Pension pInfo = (Pension)request.getAttribute("pInfo");
	String imgSrc = (String)request.getAttribute("imgSrc");
	String pFac = (String)request.getAttribute("pFac");
%>

     <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <div class="col-md-10 album py-5 bg-light">
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
	    	<button id="deleteBtn" class="btn" onclick="deleteBtn();">신청취소</button>
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