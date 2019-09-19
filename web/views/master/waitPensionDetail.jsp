<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp"%>

<%@ page import="java.util.List, com.jb.pension.model.vo.Room, com.jb.pension.model.vo.Pension" %>

<%
	Pension p = (Pension)request.getAttribute("pInfo");
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
	    <h1 style="text-align:center"><%=p.getpName() %></h1>
    	<div>
    		펜션정보<br>
    		p_code : <%=p.getpCode() %><br>
    		p_addr : <%=p.getpName() %><br>
    		p_tel : <%=p.getpTel() %><br>
    		o_id : <%=p.getoId() %>
    	</div>
    	<button id="acceptBtn" class="btn" onclick="acceptBtn();">승인(추가)</button>
    	<button id="deleteBtn" class="btn" onclick="deleteBtn();">반려(삭제)</button>
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