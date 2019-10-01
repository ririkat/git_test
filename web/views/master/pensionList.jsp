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
<%@ include file="/views/common/sideMaster.jsp"%>
            <!--content영역-->
            <div class="col-md-10">
            	<div class="mContent">
	                <br><br><br>
	                 <center><p class="title" style="color: #6a60a9;">운영중인펜션관리</p></center>
	                
	                <div class="mSearch">
	                	검색타입 : 
	                	<select id="searchType" style="width:90px;height:25px;">
	                		<option value="pensionName" <%="p_name".equals(searchType)?"selected":"" %>>펜션이름</option>
	                		<option value="ownerId" <%="o_id".equals(searchType)?"selected":"" %> >업주 아이디</option>
	                	</select>
	                	<div id="search-pensionName">
	                		<form action="<%=request.getContextPath()%>/master/pensionSearch">
	                			<input type="hidden" name="searchType" value="p_name"/>
	                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
	                			<input type="text" placeholder="펜션이름으로 검색" name="searchKeyword"
	                				value='<%="p_name".equals(searchType)?searchKey:"" %>' style="width:150px;height:25px"/>
	                			<button type="submit">검색</button>
	                		</form>
	                	</div>
	                	<div id="search-ownerId">
	                		<form action="<%=request.getContextPath()%>/master/pensionSearch">
	                			<input type="hidden" name="searchType" value="o_id"/>
	                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
	                			<input type="text" placeholder="업주 아이디 검색" name="searchKeyword"
	                				value='<%="o_id".equals(searchType)?searchKey:"" %>' style="width:150px;height:25px"/>
	                			<button type="submit">검색</button>
	                		</form>
	                	</div>
	                </div>
	                <button id="deleteBtn" class="pull-right">삭제</button>
	                <br><br><br>
	                
	                                
	                <table id="tbl-pensionList" class="table table-hover">
	                    <thead>
	                        <tr>
	                        	<th style="text-align:left"><input type="checkbox" name="selected_all"></th>
	                            <th style="text-align:center">펜션코드</th>
	                            <th style="text-align:center">펜션이름</th>
	                            <th style="text-align:center">소재지</th>
	                            <th style="text-align:center">전화번호</th>
	                            <th style="text-align:center">펜션업주 아이디</th>
	                            <th style="text-align:center">승인날짜</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<% if(pensions!=null && !pensions.isEmpty()) {
		                    	 for(Pension p : pensions) { %>
			                        <tr>
			                        	<td style="text-align:left"><input type="checkbox" name="selected" value="ROW"></td>
			                            <td style="cursor:pointer">
			                            	<a href="<%=request.getContextPath()%>/master/roomList?pensionCode=<%=p.getpCode()%>">
			                            		<%=p.getpCode() %>
			                            	</a>
			                            </td>
			                            <td><%=p.getpName() %></td>
			                            <td><%=p.getpAddr() %></td>
			                            <td><%=p.getpTel() %></td>
			                            <td><%=p.getoId() %></td>
			                            <td><%=p.getpEnrollDate() %></td>
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
	               		//검색창 숨기기, 정렬
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
							
							$('#mypageList li').removeClass("active");
							$('#mypageList li').eq(0).addClass("active");
	
			        	});
	
			        	//전체 선택 및 해제
			        	$('input[name=selected_all]').on('change', function(){
			        		$('input[name=selected]').prop('checked', this.checked);
			        	});
			        	
			        	//삭제버튼 동작
			        	$("#deleteBtn").click(function(){
			        		var checkbox = $("input[name=selected]:checked");
			        		
			        		if(checkbox.length==0){
			        			alert("삭제할 펜션을 선택해주세요.");
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
										var pensionCode = td.eq(1).children().text().trim();
	
										console.log("펜션코드 : "+pensionCode);
										
										// 가져온 값을 배열에 담는다.
										tdArr.push(pensionCode);
									});
									console.log(tdArr);
									
									//삭제할 고객들을 서블릿으로 보내기
									location.href="<%=request.getContextPath()%>/master/pensionDelete?delPensionList="+tdArr;
				        		}		        			
			        		}
						});
			        	
			        </script>
		        </div>
            </div>
            
<%@ include file="/views/common/footer.jsp"%>