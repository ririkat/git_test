<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

 <br><br><br>
    <section>
        
                <br><br><br><br>


                <section id="enroll-container">



                    <div class="tit_contents">회원 비밀번호 찾기</div>
                    <br>
                    <hr>
                    <br>

                    <form name="form1" method="post" action="<%=request.getContextPath()%>/client/findPw">
                        <table class="updateTable">
                            <colgroup>
                                <col width="160px">
                                <col width="">
                            </colgroup>
                            <tbody>
                            
                                <tr>
                                    <th class="point" style="vertical-align: middle"><strong class="point">*</strong>아이디</th>
                                    <td><input type="text" name="uid" id="uid" value=""></td>
                                </tr>
                                
                                <tr>
                            <th class="point"><strong class="point"></strong>이메일</th>
                            <td><input type="email" name="cemail" id="cemail" placeholder="' @ '포함 입력하시오" ></td>
                        </tr>
                        

                            </tbody>
                        </table>
					<br><br>
                    <div class="button">

                            <input type="submit" value="찾기">
                            <input type="reset" value="취소">
        
                        </div>


                    </form>
                    <br><br>
                    


                    <hr>
            </div>
            
          





    <br><br><br><br><br><br><br><br><br><br><br>
    </section>





<%@ include file="/views/common/footer.jsp" %>









