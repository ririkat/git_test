<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

    
<%@ include file="/views/common/header.jsp"%>

<%
String payCode = (String)request.getAttribute("merchant_uid");


%>

	<section>
	
	<form id="memberFrm" method="post" 
	        >
	
	
	<h1>결제가 완료되었습니다.</h1>
	
	<h1><%=payCode%></h1>
	
	
	<input type="hidden" name = "payCode" value="<%=payCode%>">
	<input type="submit" value="예약내역확인" onclick="go();"/>
	<input type="button" value="메인화면이동"/>
	
	
	</form>

</section>

<script>



</script>
    



<%@ include file="/views/common/footer.jsp"%>