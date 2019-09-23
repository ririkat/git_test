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
<%@ include file="/views/common/sideMaster.jsp"%>
            <!--content영역-->
<div class="col-md-10">
    <div class="mContent">
                <br><br><br>
                <h2 class="mListTitle">회원관리</h2><br>
                
                <div class="mSearch">
                	검색타입 : 
                	<select id="searchType" style="width:90px;height:25px;">
                		<option value="clientId" <%="c_id".equals(searchType)?"selected":"" %>>아이디</option>
                		<option value="clientName" <%="c_name".equals(searchType)?"selected":"" %> >이름</option>
                		<option value="clientPhone" <%="c_phone".equals(searchType)?"selected":"" %> >전화번호</option>
                		<option value="blackCount" <%="c_blcount".equals(searchType)?"selected":""%>>블랙카운트</option>
                	</select>
                	
                	<div id="search-clientId">
                		<form action="<%=request.getContextPath()%>/master/clientSearch">
                			<input type="hidden" name="searchType" value="c_id"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="아이디  검색" name="searchKeyword"
                				value='<%="c_id".equals(searchType)?searchKey:"" %>' style="width:150px;height:25px"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                	
                	<div id="search-clientName">
                		<form action="<%=request.getContextPath()%>/master/clientSearch">
                			<input type="hidden" name="searchType" value="c_name"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="이름 검색" name="searchKeyword"
                				value='<%="c_name".equals(searchType)?searchKey:"" %>' style="width:150px;height:25px"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                	
                	<div id="search-clientPhone">
                		<form action="<%=request.getContextPath()%>/master/clientSearch">
                			<input type="hidden" name="searchType" value="c_phone"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="전화번호" name="searchKeyword"
                				value='<%="c_phone".equals(searchType)?searchKey:"" %>' style="width:150px;height:25px"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                	
                	<div id="search-blackCount">
                		<form action="<%=request.getContextPath()%>/master/clientSearch">
                			<input type="hidden" name="searchType" value="c_blcount"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			
                			<select name="searchKeyword"style="width:90px;height:25px;">
		                		<option value="overThree">3이상</option>
		                		<option value="underThree">3미만</option>
		                	</select>

                			<button type="submit">검색</button>
                		</form>
                	</div>
                	
                </div>
                
                <button id="deleteBtn" class="pull-right">삭제</button>
                <br><br><br>
                
                <table id="tbl-clientList" class="table table-hover">
                    <thead>
                        <tr>
                        	<th style="text-align:left"><input type="checkbox" name="selected_all"></th>
                            <th style="text-align:center">아이디</th>
                            <th style="text-align:center">이름</th>
                            <th style="text-align:center">생년월일</th>
                            <th style="text-align:center">성별</th>
                            <th style="text-align:center">이메일</th>
                            <th style="text-align:center">전화번호</th>
                            <th style="text-align:center">주소</th>
                            <th style="text-align:center">가입일</th>
                            <th style="text-align:center">블랙카운트</th>
                            <th style="text-align:center">관리자</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% if(clients!=null && !clients.isEmpty()) {
	                    	 for(Client c : clients) { %>
		                        <tr>
		                        	<td style="text-align:left"><input type="checkbox" name="selected" value="ROW"></td>
		                            <td><%=c.getcId() %></td>
		                            <td><%=c.getcName() %></td>
		                            <td><%=c.getcBirth() %></td>
		                            <td><%=c.getcGender() %></td>
		                            <td><%=c.getcEmail() %></td>
		                            <td><%=c.getcPhone() %></td>
		                            <td><%=c.getcAddr() %></td>
		                            <td><%=c.getcEd() %></td>
		                            <td><%=c.getcBLCount() %></td>
		                            <td><%=c.getAuthority()==1?"O":"X" %></td>
		                        </tr>
		                <%	}
	                    }%>
                    </tbody>
                </table>
                
                <!-- 페이지바 -->
        		<div class="text-center">
                  <ul class="pagination">
                     <li><%=request.getAttribute("pageBar") %></li>
                  </ul>
               </div>
               
               <script>
               		//검색창 숨기기, 정렬
		        	$(function(){
		        		$('#mypageList li').removeClass("active");
						$('#mypageList li').eq(2).addClass("active");
		        		
		        		var c_id = $("#search-clientId");
		        		var c_name = $("#search-clientName");
		        		var c_phone = $("#search-clientPhone");
		        		var c_blcount = $("#search-blackCount");
		        		var searchType = $("#searchType");
		        		searchType.change(function(){
		        			c_id.hide();
		        			c_name.hide();
		        			c_phone.hide();
		        			c_blcount.hide();
		        			$("#search-"+this.value).css("display","inline-block");
		        		});
		        		$("#searchType").trigger('change');
		        	});
		        	
		        	//전체 선택 및 해제
		        	$('input[name=selected_all]').on('change', function(){
		        		$('input[name=selected]').prop('checked', this.checked);
		        	});
		        	
		        	//삭제버튼 동작
		        	$("#deleteBtn").click(function(){
		        		var checkbox = $("input[name=selected]:checked");
		        		console.log(checkbox);
		        		
		        		if(checkbox.length==0){
		        			alert("삭제할 회원을 선택해주세요.");
		        		}
		        		else{
		        			if(confirm("정말로 삭제하시겠습니까?")){
								var tdArr = new Array();
								
								// 체크된 체크박스 값을 가져온다
								checkbox.each(function(i) {
									// checkbox.parent() : checkbox의 부모는 <td>이다.
									// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
									var tr = checkbox.parent().parent().eq(i);
									var td = tr.children();
									
									// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
									var clientId = td.eq(1).text();
									
									// 가져온 값을 배열에 담는다.
									tdArr.push(clientId);
								});
								console.log(tdArr);
								
								//삭제할 고객들을 서블릿으로 보내기
								location.href="<%=request.getContextPath()%>/master/clientDelete?delClientList="+tdArr;
			        		}
		        		}
					});
		        	
		        </script>
               
            </div>
</div>


<%@ include file="/views/common/footer.jsp"%>