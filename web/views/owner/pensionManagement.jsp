<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.Pension, com.jb.pension.model.vo.PensionFile" %>
<%
	int cPage = (int)request.getAttribute("cPage");
	List<Pension> waitPensions = (List)request.getAttribute("waitPensions");
	List<Pension> accPensions = (List)request.getAttribute("accPensions");
	List<PensionFile> pensionFiles = (List)request.getAttribute("pensionFiles");
%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>

<div class="col-md-10">
	<br><br><br>
	 <center><p class="title" style="color: #6a60a9;">나의 펜션 리스트</p></center>
   <br><br>
	<br><br>
	
	<div>
		<h3 align="center">승인대기중인 펜션 목록</h3><hr>
		<button id="addBtn">펜션추가</button>
		<button id="deleteBtn" class="pull-right">삭제</button>		
		<table id="tbl-clientList" class="table table-hover">
			<thead>
				<tr>
					<th style="text-align:left"><input type="checkbox" name="selected_all"></th>
					<th style="text-align:center">펜션코드</th>
					<th style="text-align: center">펜션이름</th>
					<th style="text-align: center">소재지</th>
					<th style="text-align: center">전화번호</th>
					<th style="text-align: center">등록날짜</th>
					<th style="text-align: center">승인여부</th>
				</tr>
			</thead>
			<tbody>
				<% if(waitPensions!=null && !waitPensions.isEmpty()) {
					for(Pension p : waitPensions) { %>
				<tr>
					<td style="text-align:left"><input type="checkbox" name="selected" value="ROW"></td>
		    		<td style="cursor:pointer">
		            	<a href="<%=request.getContextPath()%>/owner/waitDetail?pensionCode=<%=p.getpCode()%>">
		                	<%=p.getpCode() %>
		            	</a>
		            </td>
		    		<td><%=p.getpName() %></td>
					<td><%=p.getpAddr() %></td>
					<td><%=p.getpTel() %></td>
					<td><%=p.getpEnrollDate() %></td>
					<td><%=p.getEnrollYn() %></td>
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
	</div>
	<br><br>
	
	<h3 align="center">운영중인 펜션</h3><hr>
	<% if(accPensions!=null && !accPensions.isEmpty()) {
		for(Pension p : accPensions) { %>
		<div class="row pensionList">
			<div class="col-lg-6 col-md-6">
				<p>
					<%String imgSrc = ""; %>
					<%for(PensionFile pf : pensionFiles) {%>
						<%if(p.getpCode().equals(pf.getpCode())) {%>
							<%imgSrc = pf.getpRenameFile();%>
						<%} %>
					<%} %>
					<img class="img-responsive" src="<%=request.getContextPath() %>/upload/pension/<%=imgSrc%>" alt="이미지 준비중" style="width:500px; height:300px;">
				</p>
			</div>
			<div class="col-lg-6 col-md-6">
				<h2><%=p.getpName() %></h2>
				<h6><br></h6>
				<h4>주소 : <%=p.getpAddr()%></h4>
				<h4>전화번호 : <%=p.getpTel()%></h4>
				<h4>영업시작일 : <%=p.getpEnrollDate()%></h4>
				<h4>블랙카운트 : <%=p.getpBlcount()%></h4>
				<a class="btn btn-primary" href="<%=request.getContextPath()%>/owner/pensionDetail?pensionCode=<%=p.getpCode()%>&imgSrc=<%=imgSrc%>">Detail <span class="glyphicon glyphicon-chevron-right"></span></a>
				<a class="btn btn-primary" href="<%=request.getContextPath()%>/review/ownerReviewList?pensionCode=<%=p.getpCode()%>">Reviews <span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
		<br><br>
	<%	}
	}%>
	
</div>

<script>
	$("#addBtn").click(function(){
		console.log("<%=loginOwner.getoEaYN()%>");
		if("<%=loginOwner.getoEaYN()%>".trim()=="Y"){
			location.href="<%=request.getContextPath()%>/owner/addPension?oId=<%=loginOwner.getoId()%>";
		} else {
			alert("관리자의 승인을 대기중입니다. 승인 후 펜션등록이 가능합니다.");
		}
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
				
				//삭제할 펜션들을 서블릿으로 보내기
				location.href="<%=request.getContextPath()%>/owner/waitDelete?oId=<%=loginOwner.getoId()%>&delPensionList="+tdArr;
    		}		        			
		}
	});
</script>

<%@ include file="/views/common/footer.jsp"%>