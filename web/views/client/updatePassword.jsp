<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client"%>
<%
	Client c = (Client) request.getAttribute("client");
	
	

%>


<%@ include file="/views/common/header.jsp"%>

<section onload="init()">

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<br> <br>
				<h4 id="mypagetitle">
					<a href="mypage.html">&nbsp;&nbsp;마이페이지</a>
				</h4>

				<div id="mypageList">

					<ul class="nav nav-pills nav-stacked">
						<br>

						<%-- <li><a href="<%=request.getContextPath()%>/client/mypageHome?cId=<%=c.getcId()%>">&nbsp;&nbsp;예약확인/취소</a></li>
                        
                        <li><a href="<%=request.getContextPath()%>/client/myFavoriteRoom?cId=<%=c.getcId()%>">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updateClientInfo?cId=<%=c.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li class="active"><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=c.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteClient?cId=<%=c.getcId()%>">회원탈퇴</a></li> --%>
                        <li><a href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/infoLoad">&nbsp;&nbsp;회원정보수정</a></li>
                        <li class="active"><a href="<%=request.getContextPath()%>/client/updatePassword">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteLoad">회원탈퇴</a></li>
                        
                        
					</ul>
					<br>
				</div>

			</div>



			<!-- 비밀번호수정 form -->
			<br> <br> <br> <br>


			<section id="enroll-container">



				<div class="tit_contents">비밀번호변경</div>
				<br>
				<hr>
				<br>

				<form name ="updatePwdFrm" id="updatePwdFrm" method="post"
					action="<%=request.getContextPath()%>/client/updatePasswordEnd">
					<table class="updateTable">
						<colgroup>
							<col width="160px">
							<col width="">
						</colgroup>
						<tbody>

							<tr>
								<th class="point"><strong class="point">*</strong>현재비밀번호</th>
								<td><input type="password" name="cPw" id="cPw" required /></td>
							</tr>

							<tr>
								<th class="point"><strong class="point">*</strong>변경할비밀번호</th>
								<td><input type="password" name="cPwNew" id="cPwNew"
									required> 정보보호를 위해 6~20자로 사용</td>
							</tr>

							<tr>
								<th class="point"><strong class="point">*</strong>비밀번호확인</th>
								<td><input type="password" name="cPwCk" id="cPwCk" required /></td>
							</tr>


						</tbody>
					</table>
					<input type="submit" class="btn btn-warning" id="btn-update" name="btn-update" onclick="return password_validate();"
						value="변경"> 
						
						<input type="reset" class="btn btn-warning" onclick="" value="뒤로가기">

					<input type="hidden" name="cId" value='<%=(String) request.getAttribute("cId")%>' />
						
						<input type="hidden" name="cPw_" id="cPw_" value='<%=loginClient.getcPw()%>' />


				</form>
				<br> <br>
				


				<hr>
		</div>
</section>

</section>

<script>





function password_validate(){
	


  
  var cPwNew=$("#cPwNew").val().trim(); 
  var cPwCk=$('#cPwCk').val().trim();
  var cPw=$('#cPw').val().trim();
 /*   var cPw_=$('#cPw_').val(); */
   

   if(cPwNew!=cPwCk){
        alert('변경할 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
        $('#cPwNew').focus();
        return false; 
        
      }else if(cPw==""){
    	 
    	 alert("비밀번호를 입력해주십시오.");
    	 $("#cPw").focus();
    	 return false;
    
    
       }else if(cPwNew ==""){
				alert("비밀번호를 입력해 주십시오.");
				$("#cPwNew").focus();
				 return false;
		}
      
		/* else if((cPwNew.length < 6) && cPwNew && cPwCk){
				alert("비밀번호는 6자리 이상 입력해 주십시오");
				$("#cPwNew").focus();
				return;
		} */
		else if(cPwCk ==""){
				alert("비밀번호 확인을 입력해 주십시오.");
				$('#cPwCk').focus();
				 return false;
	
		}else if(!cPw=<%=loginClient.getcPw()%>){
			alert("현재 비밀번호가 틀립니다.");
			$('#cPw').focus();
			 return false;
	}
 
 return true;
 
}
	
	
	
	
	
	
	<%-- else{
		
		alert("비밀번호 변경이 완료되었습니다.");
		return true;
	
		var frm=$('#updatePwdFrm');
		var url="<%=request.getContextPath()%>/client/updatePasswordEnd?cId=<%=loginClient.getcId()%>";
		frm.attr("action",url);
		frm.submit();			
		
	} --%>
		
		
    
     console.log(cPwNew+cPwCk);
    
}

	


</script>



<%@ include file="/views/common/footer.jsp"%>