<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.jb.owner.model.vo.Owner" %>
<%
	List<Owner> owners=(List)request.getAttribute("owners");
	int cPage = (int)request.getAttribute("cPage");
	String searchType = (String)request.getAttribute("searchType");
	String searchKey = (String)request.getAttribute("searchKeyword");

%>
	
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp" %>
    <!-- 헤더 끝 -->

    <style>
        th{
            text-align: center;
        }
        
    	.selected{ background-color: lightgray; }
	
    </style>
           <!-- 업주리스트 시작 -->
           
        <div class="col-md-10">
        <br><br><br>
        <h2 style="text-align: center;">업주 관리</h2>
        	
        	<div class="pull-left">
        		검색타입:
        		<select id="searchType" style="width:90px; height:25px;">
        			<option value="ownerId" <%="o_id".equals(searchType)?"selected":"" %>>아이디</option>
        			<option value="ownerName" <%="o_name".equals(searchType)?"selected":"" %>>이름</option>
        			<option value="ownerPhone" <%="o_phone".equals(searchType)?"selected":"" %>>전화번호</option>
        		</select>
        		<div id="search-ownerId">
        			<form action="<%=request.getContextPath() %>/master/ownerSearch">
                        <input type="hidden" name="searchType" value="o_id"/>
                        <input type="hidden" name="cPage" value="<%=cPage%>"/>
                        <input type="text" placeholder="아이디 검색" name="searchKeyword"
                            value='<%="o_id".equals(searchType)?searchKey:""%>' style="width: 150px; height: 25px"/>
                        <button type="submit">검색</button>
        			</form>
        		</div>
                <div id="search-ownerName">
                    <form action="<%=request.getContextPath()%>/master/ownerSearch">
                        <input type="hidden" name="searchType" value="o_name"/>
                        <input type="hidden" name="cPage" value="<%=cPage%>"/>
                        <input type="text" placeholder="이름 검색" name="searchKeyword"
                            value='<%="o_name".equals(searchType)?searchKey:""%>' style="width:150px; height:25px"/>
                        <button type="submit">검색</button>
                    </form>
                </div>
                <div id="search-ownerPhone">
               		<form action="<%=request.getContextPath()%>/master/ownerSearch">
               			<input type="hidden" name="searchType" value="o_phone"/>
               			<input type="hidden" name="cPage" value="<%=cPage %>"/>
               			<input type="text" placeholder="전화번호" name="searchKeyword"
               				value='<%="o_phone".equals(searchType)?searchKey:"" %>' style="width:150px;height:25px"/>
               			<button type="submit">검색</button>
               		</form>
               	</div>
        	</div>
        	
             <button class="pull-right" id="ownerDelete_btn" value="삭제" onclick="ownerDelete()">삭제</button>
            
        	<br><br><br>
<!--         	<div class="" style="padding: 10px  10px 10px 10px"> -->
<!--            		 <div class="table-responsive"> -->
                    <table class="table table-striped  table-sm" >
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="allCheck" onclick="allCheckClick()"></th>
                            <th>업주아이디</th>
                            <th>이름</th>
                            <th>생년월일</th>
                            <th>성별</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>가입일</th>
                            <th></th>
                        </tr>
                    </thead>
                       
                    <tbody id="ownerActive">
                        <%if(owners!=null&&!owners.isEmpty()){
                           for(Owner o : owners){%>
                        <tr> 
                            <td><input type="checkBox" id="chk_ownerId" name="name_ownerId" value="<%=o.getoId()%>"></td>
                            <td><%=o.getoId() %></td>
                            <td><%=o.getoName() %></td>
                            <td><%=o.getoBirth() %></td>
                            <td><%=o.getoGender() %></td>
                            <td><%=o.getoEmail() %></td>
                            <td><%=o.getoPhone() %></td>
                            <td><%=o.getoAddr() %></td>
                            <td><%=o.getoEd() %></td>
                            <td><button type="button" style="margin-top: -2px;" onclick="location.href='<%=request.getContextPath()%>/master/ownerView?oId=<%=o.getoId()%>'"
                                    onclick="modifyConfirm();">상세보기</button></td>
                        </tr>
                        <%} 
                         }%> 
				            
                    </tbody>
                    </table>

                    
                   
					<div class="text-center">
						<ul class="pagination" id='liactive'>
							<%=request.getAttribute("pageBar") %>
						</ul>
					</div>
                </div>
<!--             </div> -->
<!--           </div> -->
		  
     <!-- 업주리스트 끝 -->

     <%@ include file="/views/common/footer.jsp" %>
          <script>
          	 $(function(){
          		$('#mypageList li').removeClass("active");
				$('#mypageList li').eq(1).addClass("active");
          	 });
          
          	var o_id = $("#search-ownerId");
    		var o_name = $("#search-ownerName");
    		var o_phone = $("#search-ownerPhone");
    		var searchType = $("#searchType");
    		searchType.change(function(){
    			o_id.hide();
    			o_name.hide();
    			o_phone.hide();
    			$("#search-"+this.value).css("display","inline-block");
    		});
    		$("#searchType").trigger('change');
	          	 
	          /////////
              $("#ownerActive>tr").hover(function(){   //리스트에 마우스가 올라갔을때 active
            	  $(this).addClass('active');
              },  function(){
            	  $(this).removeClass('active');
                });
                
	          
                //List화면에서의 (전체포함)삭제
                function ownerDelete(){
                    var deleteConfirm = confirm('정말로 삭제하시겠습니까?');
                    if(deleteConfirm==true){
                        var chkOwnerId =[];
                        var chkLength;
                        var count=0;

<%--                         location.href="<%=request.getContextPath()%>/master/owenrMultiDelete"; --%>

                       
                        $("#chk_ownerId:checked").each(function(){  //체크 박스 값들
                            chkOwnerId += $(this).val()+',';
                            chkLength=$("#chk_ownerId:checked").length; 
                         });
                        alert('chkLength : '+chkLength+'\nchkOwnerId : '+chkOwnerId.substring(0,chkOwnerId.lastIndexOf(',')));
                         location.href='<%=request.getContextPath()%>/master/ownerMultiDelete?oIds='+chkOwnerId.substring(0,chkOwnerId.lastIndexOf(','));
                         }
                        
                    }
            

              function allCheckClick(){  //체크박스 전체선택
                  if($("#allCheck").prop("checked")){
                      //전체 checkbox 체크
                      $("input[type=checkbox]").prop("checked",true);
                  }else{
                    $("input[type=checkbox]").prop("checked",false);
                  }
              }

              
          </script>