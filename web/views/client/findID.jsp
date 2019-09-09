<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

 <br><br><br>
    <section>
        
                <br><br><br><br>


                <section id="enroll-container">



                    <div class="tit_contents">아이디찾기</div>
                    <br>
                    <hr>
                    <br>

                    <form name="form1" method="post" action="<%=request.getContextPath()%>/client/findId">
                        <table class="updateTable">
                            <colgroup>
                                <col width="160px">
                                <col width="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="point" style="vertical-align: middle"><strong class="point">*</strong>이름</th>
                                    <td><input type="text" name="uname" id="uname" value=""></td>
                                </tr>
                                
                                <tr>
                            <th class="point"><strong class="point"></strong>이메일</th>
                            <td><input type="email" name="cemail" id="cemail" placeholder="' @ '포함 입력하시오" ></td>
                        </tr>
                        
<!--                                 <tr> -->
<!--                                     <th class="point"><strong class="point">*</strong>가입시 작성한 이메일</th> -->
<!--                                     <td> -->
<!--                                         <input type="text" name="uemail01" style="IME-MODE: disabled" value=""> -->
<!--                                         @ -->
<!--                                         <input type="text" name="uemail02" id="uemail02" style="IME-MODE: disabled" -->
<!--                                             value=""> -->
<!--                                         <select name="uemail03" id="uemail03" -->
<!--                                             onchange="mailChange(this.value,'uemail02');"> -->
<!--                                             <option>메일을 선택하세요</option> -->
<!--                                             <option value="naver.com">naver.com</option> -->
<!--                                             <option value="hanmail.net" selected="selected">hanmail.net</option> -->
<!--                                             <option value="nate.com">nate.com</option> -->
<!--                                             <option value="gmail.com">gmail.com</option> -->
<!--                                             <option value="hotmail.com">hotmail.com</option> -->
<!--                                             <option value="">직접입력</option> -->
<!--                                         </select> -->
<!--                                     </td> -->
<!--                                 </tr> -->

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









