<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.Pension" %>
<%
	List<Pension> pensions = (List)request.getAttribute("pensions");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/master/commonNav.jsp"%>
            <!--content영역-->
            <div class="col-md-9">
                <br><br><br>
                <h2 style="text-align:center";>펜션관리</h2> <br>
                <table id="tbl-pensionList" class="table table-hover">
                    <thead>
                        <tr>
                            <th style="text-align:center";>펜션코드</th>
                            <th style="text-align:center";>이름</th>
                            <th style="text-align:center";>주소</th>
                            <th style="text-align:center";>전화번호</th>
                            <th style="text-align:center";>펜션업주 아이디</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% if(pensions!=null && !pensions.isEmpty()) {
	                    	 for(Pension p : pensions) { %>
		                        <tr>
		                            <td><%=p.getpCode() %></td>
		                            <td><%=p.getpName() %></td>
		                            <td><%=p.getpAddr() %></td>
		                            <td><%=p.getpTel() %></td>
		                            <td><%=p.getoId() %></td>
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