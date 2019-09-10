<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ page import="com.jb.client.model.vo.Client" %>
    
    <%
    
  
    %>

    
<%@ include file="/views/common/header.jsp"%>

 <section>

        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-3 sidenav">
                    <br>
                    <br>
                    <h4 id="mypagetitle"><a href="mypage.html">&nbsp;&nbsp;마이페이지</a></h4>
                    

                    <div id="mypageList">

                  <ul class="nav nav-pills nav-stacked">
                        <br>
                     
                      <%--   <li><a href="<%=request.getContextPath()%>/client/mypageHome?cId=<%=c.getcId()%>">&nbsp;&nbsp;예약확인/취소</a></li>
                        
                        <li><a href="<%=request.getContextPath()%>/client/myFavoriteRoom?cId=<%=c.getcId()%>">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updateClientInfo?cId=<%=c.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=c.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li class="active"><a href="<%=request.getContextPath()%>/client/?cId=<%=c.getcId()%>">회원탈퇴</a></li> --%>
                        <li><a href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/infoLoad">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li class="active"><a href="<%=request.getContextPath()%>/client/deleteLoad">회원탈퇴</a></li>
                        
                    </ul><br>
                </div>

                </div>
                <section id="container">
                    <br><br><br><br><br>
                    <div class="tit_contents">회원탈퇴</div>
                    <br>
                    <hr><br>

                    <form  action="" name="deleteFrm" method="post">
                        <table class="updateTable">
                            <colgroup>
                                <col width="160px">
                                <col width="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="point">아이디</th>
                                    <td><input type="hidden" name="cId" value="<%=loginClient.getcId()%>" readonly><%=loginClient.getcId()%></td>
                                </tr>
                                <tr>
                                    <th class="point"><strong class="point"></strong>비밀번호</th>
                                    <td><input type="password" id="cPw" name="cPw" title="비밀번호" required></td>
                                </tr>
                                 
                                <tr>
                                    <th class="point"><strong class="point"></strong>탈퇴사유</th>
                                    <td>
                                    
                                    
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="이용X" >
                                            <label for="">중개사이트를 이용하지 않아서</label>
                                        </p>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="혜택X" >
                                            <label for="">이용에 대한 혜택사항이 적어서</label>
                                        </p>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="어려움">
                                            <label for="">사이트 이용방법이 어려워서</label>
                                        </p>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="불친절" >
                                            <label for="">고객상담이 불친절해서</label>
                                        </p>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="기타" >
                                            <label for="">기타</label>
                                            <input class="mgl5" type="text" name="nreason" title="기타 탈퇴사유"
                                                style="width:300px;"></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <br> <br>

                        <div class="button">

                            <input type="button" id="btn-delete" class="btn btn-warning" name="btn-delete" onclick="deleteClient();" value="탈퇴">
                            <input type="reset"class="btn btn-warning"  onclick="<%=request.getContextPath()%>/client/mypageHome" value="취소">

                        </div>

                        <hr>

            </div>
            
            </form>
            




    </section>

    </section>
    
    <script>
    
    function deleteClient(){
		
		if(confirm("정말로 탈퇴하시겠습니까?")){
			<%-- var frm=$("#memberFrm");
			frm.attr("action",url);
			frm.submit(); --%>
			var url="<%=request.getContextPath()%>/client/deleteClient?cId=<%=loginClient.getcId()%>";
			location.href=url;
		}
	}
    

<%-- 	function deleteClient(){
		
	 var cPw=$('#cPw').val();
	 
	 if(!cPw=<%=loginClient.getcPw()%>) {
		 
		 alert("비밀번호가 일치하지 않습니다.");
			$(this).val("");
			$('#cPw').val("").focus();
			
			return;
	 } --%>
		
	<%-- else if(confirm("정말로 탈퇴하시겠습니까?")){
		
		  if(cPw=<%=loginClient.getcPw()%>) {
		
			var url="<%=request.getContextPath()%>/client/deleteClient?cId=<%=loginClient.getcId()%>";
			location.href=url;
		
		  }else {
			  
			  alert("비밀번호가 일치하지 않습니다.");
				
				$('#cPw').val("").focus();
				
				return;
			  
			  
			  
		   }
		  }
	} --%>
    
 
    
    
    
<%-- 

		function deleteClient() {
			
			var pwck=$('#cPw').val(); 
			
			if(!pwck=<%=loginClient.getcPw()%>){
				alert("비밀번호가 일치하지 않습니다.");
				$(this).val("");
				$('#cPw').val("").focus();
				
				return;
			}
			
			else if(confirm("정말로 탈퇴하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/client/deleteClient?cId=<%=loginClient.getcId()%>&cPw=<%=loginClient.getcId()%>";
				
				
				
			
			}
	}
			  --%>
		
			

    
    </script>



<%@ include file="/views/common/footer.jsp"%>