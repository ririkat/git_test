<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="com.jb.client.model.vo.Client, com.jb.owner.model.vo.Owner"%>

<% 
	
	Client c =(Client)request.getAttribute("findEmail");
	
%>

<%@ include file="/views/common/header.jsp"%>

<br>
<br>
<br>
<section>
	<br><br><br><br>
	<section id="enroll-container">
		<div class="tit_contents">일반회원 비밀번호 찾기</div>
		<br>
		<hr>
		<br>
		<form name="form1" method="post" action="<%=request.getContextPath()%>/client/updatePasswordEnd" onsubmit="return fpw_validate();">
			<table class="updateTable">
				<input type="hidden" name="loginType" id="client" value="client" />
				<input type="hidden" name="cemail3" id="cemail3" value="<%=c.getcEmail() %>"/>
				<input type="hidden" name="confirmYN" id="confirmYN" value="N"/>
				<colgroup>
					<col width="160px">
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<th class="point" style="vertical-align: middle"><strong class="point">*</strong>아이디</th>
						<td>
							<input type="text" name="cId" id="cId" value="<%=c.getcId() %>" readonly style="background-color: lightgray">
						</td>
					</tr>
					<tr>
						<th class="point" style="vertical-align: middle"><strong class="point">*</strong>가입시 등록한 이메일</th>
						<td>
							<input type="text" name="cemail" id="cemail" readonly
								style="background-color: lightgray" onclick="">
							<input type="button" name="emailConfirm" id="emailConfirm" value="인증번호 발송"/>
						</td>
					</tr>
					<tr>
						<th class="point" style="vertical-align: middle"><strong class="point">*</strong>변경할 비밀번호</th>
						<td>
							<input type="text" name="cPw" id="cPw">
						</td>
					</tr>
					<tr>
						<th class="point" style="vertical-align: middle"><strong class="point">*</strong>변경할 비밀번호 확인</th>
						<td>
							<input type="text" name="cPw2" id="cPw2">
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
			<div class="button">
				<input type="submit" value="변경">
				<input type="reset" value="취소">
			</div>


		</form>
		<br>
		<br>
		<hr>
	</section>
	<script>
	
	$(function(){
		var email=$("#cemail3").val();
		var reEmail=masking(email);
		$("#cemail").attr("value",reEmail);
		function masking(email) {
			const len = email.split('@')[0].length - 4;
			return email.replace(new RegExp('.(?=.{0,' + len + '}@)', 'g'), '*');
   			}
	});
	
	$(function(){
	      $('#emailConfirm').click(function(){
	         console.log("인증버튼클릭!!");
	         var dataString=$('#cemail3').val();
	         $.ajax({
	            url:"<%=request.getContextPath()%>/member/emailConfirm",
	            type:"post",
	            data:{dataString:dataString},
	            dataType:"html",
	            success:function(data){
	               console.log(data);
	               var br=$('<br/>');
	               var span=$('<span>');
	               var input=$('<input>').attr({
	                  "type":"text","name":"confirmCode","id":"confirmCode"
	               });
	               var btn=$('<input>').attr({
	                  "type":"button","name":"confirmBtn",
	                  "value":"인증번호확인","id":"confirmBtn"
	               });
	               
	               setTimeout(function(){
	                  console.log("함수실행")
	                  $('#confirmBtn').parent().html("시간초과, 발송버튼을 다시 눌러 인증하세요.").css({"color":"red"});
	               }, 180000);
	               
	               span.append(input).append(btn);
	               $('#cemail').parent().append(br).append(span);
	               
	               $('#confirmBtn').click(function(){
	                  var code=$('#confirmCode').val().trim();
	                  if(code==data){
	                     $(this).parent().html("인증완료").css("color","blue");
	                     $('#confirmYN').attr("value","Y");
	                  }else{
	                     alert('인증번호 불일치 : [인증번호를 다시 확인하세요.]');
	                  }
	               }) 
	            },
	            error:function(data){
	            }
	         });
	            
	      });
	   });
	
	
	function fpw_validate() {
	//비밀번호 빈칸
	    if (form1.cPw.value=="" || form1.cPw2.value=="") {
	        alert("비밀번호를 입력하지 않았습니다.")
	        cPw2.focus()
	        return false;
	    }
	    
	    //비밀번호길이 6,20
	    if(form1.cPw.value.length<6 || form1.cPw.value.length>20) {
	   		alert("비밀번호를 6자이상,20자이하로 입력해주세요")
	   		cPw.focus();
	   		return false;
	   	}
	    
	    //이메일인증 여부
	    if(form1.confirmYN.value!="Y"){
	    	alert("이메일 인증을 해주세요");
	   		return false;
	    }
	    
	    //패스워드, 패스워드확인 일치여부
	    var pw=$('#cPw').val();
        var pw2=$('#cPw2').val();
        if(pw!=pw2){
        	alert("패스워드가 일치하지 않습니다.");
        	$('#cPw2').blur();
            $('#cPw').val("").focus();
            return false;
        }
	}	
	</script>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</section>

<%@ include file="/views/common/footer.jsp"%>
