<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.jb.client.model.vo.Client, com.jb.owner.model.vo.Owner"%>

<% 
	Client c=new Client();
	Owner o=new Owner();
%>

<%@ include file="/views/common/header.jsp" %>

 <br><br><br>
    <section>
        
                <br><br><br><br>


                <section id="enroll-container">



                    <div class="tit_contents">회원 비밀번호 찾기</div>
                    <br><hr><br>
                    <form name="form1" method="post" action="<%=request.getContextPath()%>/client/findEmail">
                        <table class="updateTable">
                        <caption>
	                        	<input type="radio" name="loginType" id="client" value="client" checked/>고객
	                            <input type="radio" name="loginType" id="owner" value="owner"/>업주
	                    </caption>
                            <colgroup>
                                <col width="160px">
                                <col width="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="point" style="vertical-align: middle">
                                    	<strong class="point">*</strong>아이디
                                    </th>
                                    <td>
                                    	<input type="text" name="uid" id="uid" placeholder="아이디를 입력하세요">
                                    </td>
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
            </section>
            
    <br><br><br><br><br><br><br><br><br><br><br>
    </section>

<%@ include file="/views/common/footer.jsp" %>









