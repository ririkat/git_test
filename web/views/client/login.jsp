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
                            <form class="form-signin" method="post" action="<%=request.getContextPath()%>/client/login">
                                <input id="loginid" name="loginid" type="text" class="form-control" placeholder="아이디 입력" required autofocus><br>
                                <input id="loginpw" name="loginpw" type="password" class="form-control" placeholder="비밀번호 입력" required><br>
                                <button class="btn btn-lg btn-warning btn-block" type="submit">
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


<%@ include file="/views/common/footer.jsp" %>









