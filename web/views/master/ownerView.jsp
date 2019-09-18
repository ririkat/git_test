<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.owner.model.vo.Owner" %>
<%
	Owner o = (Owner)request.getAttribute("owner");
%>
    <!-- 헤더 끝 -->
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp" %>

        <br><br><br>
        <section id="enroll-container">
                <div class="tit_contents">회원정보수정</div>
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
                                <th class="point" style="vertical-align: middle"><strong class="point">*</strong>이름</th>
                                <td><%=o.getoName() %><input type="hidden" name="uid" value=""></td>
                            </tr>
                            <tr>
                                    <th class="point"><strong class="point"></strong>생년월일</th>
                            
                                    <td>
                                        <input type="date" value="<%=o.getoBirth() %>" class="input_real datepicker2 hasDatepicker" readonly>
                                    </td>
                            </tr>
                            
                            <tr>
                                <th class="point"><strong class="point">*</strong>성별</th>
                                <%if(o.getoGender().charAt(0)=='M'){ %>
                                <td>
                                    <input type="radio" name="usex" value="M" checked>남
                                    &nbsp;
                                    <input type="radio" name="usex" value="F">여
                                </td>
                                <%}else{ %>
                                <td>
                                    <input type="radio" name="usex" value="M">남
                                    &nbsp;
                                    <input type="radio" name="usex" value="F" checked>여
                                </td>
                                <%} %>
                            </tr>
                            
                            <tr>
                                <th class="point"><strong class="point">*</strong>아이디</th>
                                <td> <%=o.getoId() %> </td>
                            </tr>
                            <tr>
                                <th class="point"><strong class="point">*</strong>비밀번호</th>
                                <td><input type="password" name="upass"> 정보보호를 위해 6~20자로 사용(영문/숫자 조합)</td>
                            </tr>
                            <tr>
                                <th class="point"><strong class="point">*</strong>비밀번호확인</th>
                                <td><input type="password" name="upass2"></td>
                            </tr>
                            <tr>
                                <th class="point"><strong class="point">*</strong>이메일</th>
                                <td>
                                    <input type="text" name="uemail01" style="IME-MODE: disabled" value="<%=o.getoEmail().substring(0,o.getoEmail().indexOf("@")) %>" readonly>
                                    @
                                    <input type="text" name="uemail02" id="uemail02" style="IME-MODE: disabled" value="<%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1)%>" readonly>
                                    <!-- <select name="uemail03" id="uemail03" onchange="mailChange(this.value,'uemail02');">
                                        <option>메일을 선택하세요</option>
                                        <option value="naver.com" <%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1).equals("naver.com")?"selected":"" %>>naver.com</option>
                                        <option value="hanmail.net" <%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1).equals("hanmail.net")?"selected":"" %>>hanmail.net</option>
                                        <option value="nate.com" <%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1).equals("nate.com")?"selected":"" %>>nate.com</option>
                                        <option value="gmail.com" <%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1).equals("gmail.com")?"selected":"" %>>gmail.com</option>
                                        <option value="hotmail.com" <%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1).equals("hotmail.com")?"selected":"" %>>hotmail.com</option>
                                        <option value="">직접입력</option>     
                                    </select> -->
                                </td>
                            </tr>

                            <tr>
                                <th class="point"><strong class="point">*</strong>핸드폰번호</th>
                                <td>
                                    <select name="hp1" id="hp1" onchange="changePC('hp2')">
                                        <option value="">선택</option>
                                        <option value="010" selected="">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>
                                    <input type="text" name="hp2" id="hp2" class="w50px" maxlength="4" onkeyup="FocusNext('hp2','hp3',4)" style="IME-MODE: disabled" value="9376">
                                    <input type="text" name="hp3" id="hp3" class="w50px" maxlength="4" style="IME-MODE: disabled" value="8120">
                                </td>
                            </tr>

                            <tr>
                                <th class="point">지역</th>
                                <td>
                                    <select name="addr">
                                        <option value="서울">서울</option>
                                        <option value="경기도" selected="">경기도</option>
                                        <option value="강원도">강원도</option>
                                        <option value="충청북도">충청북도</option>
                                        <option value="충남남도">충남남도</option>
                                        <option value="전라북도">전라북도</option>
                                        <option value="전라남도">전라남도</option>
                                        <option value="경상북도">경상북도</option>
                                        <option value="경상남도">경상남도</option>
                                        <option value="제주도">제주도 </option>
                                    </select>
                                </td>
                            </tr>


                        </tbody>
                    </table>

                


                </form>
                <br><br>
                <div class="button">

                        <input type="button" onclick="deleteOwner();" value="삭제">
                        <input type="reset" onclick="location.href='<%=request.getContextPath()%>/master/ownerList'" value="취소">
    
                    </div>


                <hr>
        </section>
        
        
        </div>
        </div>
        
        <script>
        	function deleteOwner(){
        		if(confirm('정말로 삭제하시겠습니까?')){
        			location.href='<%=request.getContextPath()%>/master/ownerDelete?oId=<%=o.getoId()%>';
        		}
        	}
        </script>
         <%@ include file="/views/common/footer.jsp" %>