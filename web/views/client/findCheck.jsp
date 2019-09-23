<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import ="com.jb.client.model.vo.Client" %>

<%
Client c = (Client)request.getAttribute("findClient");
%>
  <section>
  		<br><br><br><br><br><br><br><br><br><br><br><br>
        <center><p class="title" style="color: #6a60a9;">이메일을 확인해주세요</p></center>

  		<br><br><br><br><br><br><br><br><br><br><br><br>
  </section>
  <script>
    
  	window.onload = function()
    {
  		console.log("ddddd")

    	var ID = "${findClient.getcId()}"
    	var EMAIL = "${findClient.getcEmail()}"
    	
    	
    	var TO = EMAIL
    	var TITLE = "자바방 아이디 찾기"
    	var TEXT = "회원님의 아이디는 "+ID+"입니다."
    	
    	
    	
    	
    	var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
             if (this.readyState == 4 && this.status == 200) {
                 alert(this.responseText);
             }
        };
        
        
        xhttp.open("POST", "https://javabang.herokuapp.com/SendMail", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send('TO='+TO+'&TITLE='+TITLE+'&TEXT='+TEXT);
        
        
    }
    
    
    </script>

<%@ include file="/views/common/footer.jsp" %>









