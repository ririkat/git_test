<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

 <section>
 <br>
        <!-- <div class="jumbotron well"> -->
        <div class="jumbotron">
            <div class="container border">
                <div class="row">
                    <div class="col-sm-6 col-md-4 col-md-offset-4">
                        <div class="account-wall">
                            <h4 id="mypagetitle" style="text-align: center">로그인</h4>
                            <form id="loginTypefrm" class="form-signin" method="post" action="<%=request.getContextPath()%>/client/login">
                                <input type="radio" name="loginType" value="client" checked>고객
                                <input type="radio" name="loginType" value="owner">업주
                                <input id="loginid" name="loginid" type="text" class="form-control" placeholder="아이디 입력" required autofocus><br>
                                <input id="cpass" name="cpass" type="password" class="form-control" placeholder="비밀번호 입력" required><br>
                                <button onclick="login-btn" class="btn btn-lg btn-warning btn-block">
                                    			로그인</button><br>
                                <input type="button" class="btn btn-sm btn-warning btn-block" value="ID 찾기"
                                onclick="location.href='<%=request.getContextPath()%>/views/client/findID.jsp'">
                                <input type="button" class="btn btn-sm btn-warning btn-block" value="PW 찾기"
                                onclick="location.href='<%=request.getContextPath()%>/views/client/findPW.jsp'"><br>
                                    
<!--                                 	업체일반 회원뷰로 전환 -->
                                <a href="<%=request.getContextPath()%>/views/client/singUpChoice.jsp" class="text-center new-account">회원가입</a>
                           </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <br><br><br><br>
    </section>

    <script>
        $(function(){
            $("input[name='loginType']:radio").change(function(){
                var loginType= $(this).val();
                if(loginType=="client"){
                    $('#loginTypefrm').attr('action','<%=request.getContextPath()%>/client/login');
                }
                else if(loginType=="owner"){
                	$('#cpass').attr('name','opass');	//Owner의 서블릿에서는 받는파라미터값이 opass로 되어있어 owner서블릿으로 넘겨주기전에 name값 변경
                    $('#loginTypefrm').attr('action','<%=request.getContextPath()%>/owner/login');
                }
                else return;
            });
        });
        
        // 아이디찾기 업체,일반 라디오 버튼으로 전환
        function find(){
        	if(loginTypefrm.loginType.value=="client") {
        		location.href="<%=request.getContextPath()%>/views/client/findID.jsp";
        		return false;
        	}
        	if(loginTypefrm.loginType.value=="owner") {
        		location.href="<%=request.getContextPath()%>/views/owner/findIDOwner.jsp";
        		return false;
        	}
        	//성별 빈칸
          	if(!loginTypefrm.client.checked && !loginTypefrm.owner.checked) {
          		alert("버튼을 체크해주세요");
    			form1.cgender0.focus();
    			return false;
          	}
        	return true;
        }  
        
        function findPW(){
        	location.href="<%=request.getContextPath()%>/views/client/findPW.jsp";
        }
    </script>

<%@ include file="/views/common/footer.jsp" %>









