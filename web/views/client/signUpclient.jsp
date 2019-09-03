<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

    <section>

        <!-- 회원정보 수정 form -->
        <br><br><br><br>


        <section id="enroll-container">

            <div class="tit_contents">회원가입</div>
            <br>
            <hr>
            <br>

            <form name="form1" method="post">
                <table class="updateTable">
                    <colgroup>
                        <col width="160px">
                        <col width="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="point" style="vertical-align: middle"><strong class="point"></strong>아이디
                            </th>
                            <td>
                            <input type="text" name="cid" placeholder="영문으로 8글자 이상">
                            <button>중복확인</button>
                            </td>
                            
                        </tr>
                        <tr>
                            <th class="point"><strong class="point"></strong>비밀번호</th>
                            <td><input type="password" name="cpass" id="cpass" placeholder="6~20자로 사용(영문/숫자)"></td>
                        </tr>
                        
                        <tr>
                            <th class="point"><strong class="point"></strong>비밀번호확인</th>
                            <td><input type="password" id="cpass2" placeholder="6~20자로 사용(영문/숫자)"></td>
                        </tr>
                        <tr>
                            <th class="point"><strong class="point"></strong>이름</th>
                            <td><input type="text" name="cname" id=cname></td>
                        </tr>
                        <tr>
                            <th class="point"><strong class="point"></strong>생년월일</th>

                            <td>
                            <input check-join-date input-number type="number" name="cbirth" id="cbirthYY" class="" min="1900" max="2005" maxlength="4">년                            
                            <input check-join-date input-number type="number" name="cbirth" id="cbirthMM" class="" min="1" max="12" maxlength="2" >월                            
                            <input check-join-date input-number type="number" name="cbirth" id="cbirthDD" class="" min="1" max="31" maxlength="2"  >일                           
                            </td>
                        </tr>
                        <tr>
                            <th class="point"><strong class="point"></strong>성별</th>
                            <td>
                                <input type="radio" name="cgender" id="cgender0" value="M">남
                                &nbsp;
                                <input type="radio" name="cgender" id="cgender1" value="F" checked="checked">여
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="point"><strong class="point"></strong>이메일</th>
                            
                            	
                            	<td><input type="email" name="cemail" id="cemail" placeholder="' @ '포함 입력하시오" ></td>
<!--                             	<td> -->
<!--                                 <input type="text" name="cemail01" style="IME-MODE: disabled"> -->
<!--                                 @ -->
<!--                                 <input type="text" name="cemail02" id="uemail02" style="IME-MODE: disabled" -->
<!--                                     value="hanmail.net"> -->
<!--                                 <select name="uemail03" id="uemail03" onchange="mailChange(this.value,'uemail02');"> -->
<!--                                     <option>메일을 선택하세요</option> -->
<!--                                     <option value="naver.com">naver.com</option> -->
<!--                                     <option value="hanmail.net" selected="selected">hanmail.net</option> -->
<!--                                     <option value="nate.com">nate.com</option> -->
<!--                                     <option value="gmail.com">gmail.com</option> -->
<!--                                     <option value="hotmail.com">hotmail.com</option> -->
<!--                                     <option value="">직접입력</option> -->
<!--                                 </select> -->
<!--                             </td> -->
                        </tr>

                        <tr>
                            <th class="point"><strong class="point"></strong>핸드폰번호</th>
                           
                                
                                <td><input type="tel" name="cphone" id=cphone placeholder="' - '빼고 입력하시오" maxlength="11"></td>
                                
<!--                                 	<td> -->
<!--                                 <select name="hp1" id="hp1" onchange="changePC('hp2')"> -->
<!--                                     <option value="">선택</option> -->
<!--                                     <option value="010" selected="">010</option> -->
<!--                                     <option value="011">011</option> -->
<!--                                     <option value="016">016</option> -->
<!--                                     <option value="017">017</option> -->
<!--                                     <option value="018">018</option> -->
<!--                                     <option value="019">019</option> -->
<!--                                 </select> -->
<!--                                 <input type="text" name="hp2" id="hp2" class="w50px" maxlength="4" -->
<!--                                     onkeyup="FocusNext('hp2','hp3',4)" style="IME-MODE: disabled"> -->
<!--                                 <input type="text" name="hp3" id="hp3" class="w50px" maxlength="4" -->
<!--                                     style="IME-MODE: disabled"> -->
<!--                             	</td> -->
                        </tr>

                        <tr>
                            <th class="point">주소</th>
                            <td><input type="text" class="form-control" name="caddr" id="caddr" placeholder="주소" required><br></td>
                        </tr>
                    </tbody>
                </table>
            </form>
           <br>
            <div class="button">

                <input type="button" onclick="updateUser();" value="회원가입">
                <input type="reset" onclick="location.href='mypage.html' " value="취소">

            </div>
            <hr>
            
      
            

        </section>

<%@ include file="/views/common/footer.jsp" %>









