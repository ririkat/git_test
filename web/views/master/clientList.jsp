<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.client.model.vo.Client" %>
<%
	List<Client> clients = (List)request.getAttribute("clients");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/master/commonNav.jsp"%>
            <!--content영역-->
            <div class="col-md-9">
                <br><br><br>
                <h2 style="text-align:center";>회원관리</h2> <br>
                <table id="tbl-clientList" class="table table-hover">
                    <thead>
                        <tr>
                            <th style="text-align:center";>아이디</th>
                            <th style="text-align:center";>이름</th>
                            <th style="text-align:center";>생년월일</th>
                            <th style="text-align:center";>성별</th>
                            <th style="text-align:center";>이메일</th>
                            <th style="text-align:center";>전화번호</th>
                            <th style="text-align:center";>주소</th>
                            <th style="text-align:center";>가입일</th>
                            <th style="text-align:center";>블랙카운트</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% if(clients!=null && !clients.isEmpty()) {
	                    	 for(Client c : clients) { %>
		                        <tr>
		                            <td><%=c.getcId() %></td>
		                            <td><%=c.getcName() %></td>
		                            <td><%=c.getcBirth() %></td>
		                            <td><%=c.getcGender() %></td>
		                            <td><%=c.getcEmail() %></td>
		                            <td><%=c.getcPhone() %></td>
		                            <td><%=c.getcAddr() %></td>
		                            <td><%=c.getcEd() %></td>
		                            <td><%=c.getcBLCount() %></td>
		                        </tr>
		                <%	}
	                    }%>
                    </tbody>
                </table>
                
        		<div class="text-center">
                  <ul class="pagination">
                     <li><%=request.getAttribute("pageBar") %></li>
                  </ul>
               </div>
            </div>
            

        </div>
    </div>
	</section>

<%@ include file="/views/common/footer.jsp"%>