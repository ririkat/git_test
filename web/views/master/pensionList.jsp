<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.Pension" %>
<%
	List<Pension> pensions = (List)request.getAttribute("pensions");
	int cPage = (int)request.getAttribute("cPage");
	String searchType = (String)request.getAttribute("searchType");
	String searchKey = (String)request.getAttribute("searchKeyword");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/master/commonNav.jsp"%>
            <!--content영역-->
            <div class="col-md-9">
                <br><br><br>
                <h2 style="text-align:center";>펜션관리</h2> <br>
                
                <div>
                	검색타입 : 
                	<select id="searchType">
                		<option value="pensionName" <%="p_name".equals(searchType)?"selected":"" %>>펜션이름</option>
                		<option value="ownerId" <%="o_id".equals(searchType)?"selected":"" %> >업주 아이디</option>
                	</select>
                	<div id="search-pensionName">
                		<form action="<%=request.getContextPath()%>/master/pensionSearch">
                			<input type="hidden" name="searchType" value="p_name"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="펜션이름으로 검색" name="searchKeyword"
                				value='<%="p_name".equals(searchType)?searchKey:"" %>' size="30"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                	<div id="search-ownerId">
                		<form action="<%=request.getContextPath()%>/master/pensionSearch">
                			<input type="hidden" name="searchType" value="o_id"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="업주 아이디 검색" name="searchKeyword"
                				value='<%="o_id".equals(searchType)?searchKey:"" %>' size="30"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                </div>
                <br>
                
                                
                <table id="tbl-pensionList" class="table table-hover">
                    <thead>
                        <tr>
                            <th style="text-align:center";>펜션코드</th>
                            <th style="text-align:center";>펜션이름</th>
                            <th style="text-align:center";>소재지</th>
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
               
               <script>
		        	$(function(){
		        		var p_name = $("#search-pensionName");
		        		var o_id = $("#search-ownerId");
		        		var searchType = $("#searchType");
		        		searchType.change(function(){
		        			p_name.hide();
		        			o_id.hide();
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