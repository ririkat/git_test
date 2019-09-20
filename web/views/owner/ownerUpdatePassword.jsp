<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.owner.model.vo.Owner"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>



<br> <br> <br> <br>


			<section id="enroll-container">



				<div class="tit_contents">비밀번호변경</div>
				<br>
				<hr>
				<br>

				<form name ="updatePwdFrm" id="updatePwdFrm" method="post"
					action="<%=request.getContextPath()%>/owner/updatePasswordEnd?oId=<%=o.getoId()%>">
					<table class="updateTable">
						<colgroup>
							<col width="160px">
							<col width="">
						</colgroup>
						<tbody>

							<tr>
								<th class="point"><strong class="point">*</strong>현재비밀번호</th>
								<td><input type="password" name="oPw" id="oPw" required /></td>
							</tr>

							<tr>
								<th class="point"><strong class="point">*</strong>변경할비밀번호</th>
								<td><input type="password" name="oPwNew" id="oPwNew"
									required> 정보보호를 위해 6~20자로 사용</td>
							</tr>

							<tr>
								<th class="point"><strong class="point">*</strong>비밀번호확인</th>
								<td><input type="password" name="oPwCk" id="oPwCk" required /></td>
							</tr>


						</tbody>
					</table>
					
					<div class="button">
						<input type="submit" class="btn btn-warning" id="btn-update" name="btn-update" onclick="return password_validate();"
							value="변경">	
						<input type="reset" class="btn btn-warning" onclick="" value="뒤로가기">
					</div>
					<input type="hidden" name="cId" value='<%=(String) request.getAttribute("oId")%>' />	
					<input type="hidden" name="cPw_" id="cPw_" value='<%=o.getoPw()%>' />


				</form>
				<br> <br>
				<hr>

		</section>
		
		<script>

		$(function(){
			$('#mypageList li').removeClass("active");
			$('#mypageList li').eq(3).addClass("active");
		});



		function password_validate(){
		  var oPw=$('#oPw').val().trim();
		  var oPwNew=$("#oPwNew").val().trim(); 
		  var oPwCk=$('#oPwCk').val().trim();
		 /*   var cPw_=$('#cPw_').val(); */
		   console.log('현재비밀번호: '+oPw);
		   console.log('변경할 비밀번호: '+oPwNew);
		   console.log('변경할 비밀번호 확인: '+oPwCk);
		
		   if(oPwNew!=oPwCk){
		        alert('변경할 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
		        $('#oPw').val("");
		        $('#oPwNew').val("");
		        $('#oPwCk').val("");
		        $('#oPwNew').focus();
		        return false; 
		        
		    }
		   if(oPw==""){
		    	 
		   	 alert("비밀번호를 입력해주십시오.");
		   	$('#oPw').val("");
		    $('#oPwNew').val("");
		    $('#oPwCk').val("");
		   	 $("#oPw").focus();
		   	 return false;
		   
		   
		   }
		   if(oPwNew ==""){
						alert("비밀번호를 입력해 주십시오.");
						$('#oPw').val("");
				        $('#oPwNew').val("");
				        $('#oPwCk').val("");
						$("#oPwNew").focus();
						 return false;
			}
		     
			/* else if((cPwNew.length < 6) && cPwNew && cPwCk){
					alert("비밀번호는 6자리 이상 입력해 주십시오");
					$("#cPwNew").focus();
					return;
			} */
			if(oPwCk ==""){
					alert("비밀번호 확인을 입력해 주십시오.");
					$('#oPw').val("");
			        $('#oPwNew').val("");
			        $('#oPwCk').val("");
					$('#oPwCk').focus();
					 return false;
		
			}
			if(oPw!=<%=o.getoPw()%>){
				alert("현재 비밀번호가 틀립니다.");
				$('#oPw').val("");
		        $('#oPwNew').val("");
		        $('#oPwCk').val("");
				$('#oPw').focus();
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
		
		

	


</script>



<%@ include file="/views/common/footer.jsp"%>