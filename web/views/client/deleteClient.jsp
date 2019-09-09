<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    ss
    
    <%@ page import="com.jb.client.model.vo.Client" %>
    
    <%
    
    Client c = new Client();
    String id=(String)session.getAttribute("cId");
    String[] why=new String[5];
    
    
    
    
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
                     
                        <li><a href="<%=request.getContextPath()%>/client/mypageHome?cId=<%=c.getcId()%>">&nbsp;&nbsp;예약확인/취소</a></li>
                        
                        <li><a href="<%=request.getContextPath()%>/client/myFavoriteRoom?cId=<%=c.getcId()%>">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updateClientInfo?cId=<%=c.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li class="active"><a href="<%=request.getContextPath()%>/client/?cId=<%=c.getcId()%>">회원탈퇴</a></li>
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
                                    <td><input type="text" name="cId" value="<%=c.getcId()%>" readonly></td>
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

                            <input type="button" class="btn-delete" value="탈퇴">
                            <input type="reset" onclick="<%=request.getContextPath()%>/client/mypageHome?cId=<%=c.getcId()%>" value="취소">

                        </div>

                        <hr>

            </div>
            
            </form>
            




    </section>

    </section>
    
    <script>
    
  /*   function whyDelete(why) {
        for( var i=0, len=why.length; i < len; i++ ) {
            if (why[i].checked == true) {
                var chk = why[i].value;
            }
        }
    	return chk;
    } */
    
    
    

    
    
	$(function(){
		
	}
		$('.btn-delete').click(function(){
			
			var pwck=$('#cPw').val().trim(); 
			
			if(pwck=<%=clientLogin.getcPw()%>){
				alert("비밀번호가 일치하지 않습니다.");
				$(this).val("");
				$('#cPw').val("").focus();
				
				return
			}
			
			if(confirm("정말로 탈퇴하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/client/deleteClient?cId=<%=c.getcId()%>&cPw="+$(this).val();
				
			
			}
			
			

    
    </script>



<%@ include file="/views/common/footer.jsp"%>