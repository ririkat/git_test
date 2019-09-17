<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

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
    	<button id="deleteBtn" class="btn" onclick="deleteBtn();">신청취소</button>
	</div>
	
	<script>
		function deleteBtn(){
			if(confirm("삭제(등록신청취소)하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/owner/oneDelete?pCode=<%=p.getpCode()%>&oId=<%=p.getoId()%>";
			}
		}
	</script>
  

<%@ include file="/views/common/footer.jsp"%>