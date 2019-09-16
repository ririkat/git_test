<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

 <section>
            <br><br><br><br>
            <div class="jumbotron">
                <div class="container border">
                    <div class="row">
                        <div class="col-sm-6 col-md-4 col-md-offset-4">
                            <div class="account-wall">
    
                                    <h4 id="mypagetitle" style="text-align: center">선택하세요</h4>
                               
                                <form class="form-signin">
                                   <br><br>
                                    <input type="button" class="btn btn-lg btn-warning btn-block" value="일반회원가입"
                                    onclick="location.href='<%=request.getContextPath()%>/views/client/signUpTermsClient.jsp'" 
                                    ><br>
                                    <br>
                                    <input type="button" class="btn btn-lg btn-warning btn-block" value="업체회원가입"
                                    onclick="location.href='<%=request.getContextPath()%>/views/owner/signUpTermsOwner.jsp'" 
                                    ><br>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </section>
    

        <br><br><br><br><br><br><br>

<%@ include file="/views/common/footer.jsp" %>









