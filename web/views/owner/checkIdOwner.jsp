<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	boolean isUseable = (boolean)request.getAttribute("isUseable");
	String id = (String)request.getAttribute("oid");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<style>
	div#checkid-container{text-align:center; padding-top:100px;}
	span#duplicated{color:red; font-weight:bold;}
</style>
</head>
<body>

	<div id="checkid-container">
	
		<%if(isUseable) { %>
		[<span><%=id %></span>]는 사용 가능합니다.
		<br><br>
		<button type="button" onclick="setUserId();">닫기</button>
		<%} else {%>
		[<span id="duplicated"><%=id %></span>]는 이미 사용중입니다.
		<br><br>
		<form action="<%=request.getContextPath()%>/checkIdOwner" method="post" name="checkId">
			<input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요"/>&nbsp;&nbsp;
			<button type="button" onclick="checkIdDuplicate();">중복검사</button>
		</form>
		<%} %>
	</div>
	
	<script>
	
	function checkIdDuplicate() {
	
		
		var userId=document.getElementById("userId").value;
		
		if(!userId || userId.trim().length<4 || userId.trim().length>15) {
			alert("아이디는 4글자 이상,15자이하로 가능합니다");
			return;
		}
		
	var regExpId = /^[a-z0-9]{4,12}$/;
	if(!regExpId.test(checkId.userId.value)) {
		alert("아이디는 소문자,숫자 4글자 이상,15자이하로 가능합니다");
		return false;
	}
		
		
		checkId.userId.value=userId.trim();
		checkId.submit();
	}
		
		
		function setUserId() {
			opener.document.getElementById("oid_").value='<%=id%>';
			opener.document.getElementById("opass").focus();
			self.close();
		}
		
	</script>
</body>
</html>







