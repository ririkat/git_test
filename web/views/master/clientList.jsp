<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.client.model.vo.Client" %>
<%
	List<Client> clients = (List)request.getAttribute("clients");
	int cPage = (int)request.getAttribute("cPage");
	String searchType = (String)request.getAttribute("searchType");
	String searchKey = (String)request.getAttribute("searchKeyword");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/master/commonNav.jsp"%>
            <!--content영역-->
            <div class="col-md-9">
                <br><br><br>
                <h2 style="text-align:center";>회원관리</h2> <br>
                
                <div>
                	검색타입 : 
                	<select id="searchType">
                		<option value="clientId" <%="cId".equals(searchType)?"selected":"" %>>아이디</option>
                		<option value="clientName" <%="cName".equals(searchType)?"selected":"" %> >이름</option>
                		<option value="blCount" <%="cBLCount".equals(searchType)?"selected":"" %> >블랙카운트</option>
                	</select>
                	<div id="search-clientId">
                		<form action="<%=request.getContextPath()%>/master/clientSearch">
                			<input type="hidden" name="searchType" value="c_id"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="아이디  검색" name="searchKeyword"
                				value='<%="cId".equals(searchType)?searchKey:"" %>' size="30"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                	<div id="search-clientName">
                		<form action="<%=request.getContextPath()%>/master/clientSearch">
                			<input type="hidden" name="searchType" value="c_name"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="이름 검색" name="searchKeyword"
                				value='<%="cName".equals(searchType)?searchKey:"" %>' size="30"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                	<div id="search-blCount">
                		<form action="<%=request.getContextPath()%>/master/clientSearch">
                			<input type="hidden" name="searchType" value="c_blcount"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="블랙리스트 카운트" name="searchKeyword"
                				value='<%="cBLCount".equals(searchType)?searchKey:"" %>' size="30"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                </div>
                
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
               
               <script>
		        	$(function(){
		        		var cid = $("#search-clientId");
		        		var cname = $("#search-clientName");
		        		var blCnt = $("#search-blCount");
		        		var searchType = $("#searchType");
		        		searchType.change(function(){
		        			cid.hide();
		        			cname.hide();
		        			blCnt.hide();
		        			$("#search-"+this.value).css("display","inline-block");
		        		});
		        		$("#searchType").trigger('change');
		        	});
		        </script>
               
            </div>
            

        </div>
    </div>
	</section>

<%@ include file="/views/common/footer.jsp"%>