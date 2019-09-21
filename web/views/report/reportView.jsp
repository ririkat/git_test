<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.report.model.vo.Report, java.util.List"%>
<%
	Report r=(Report)request.getAttribute("report");
%>

<%@ include file="/views/common/header.jsp"%>

<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>

<section>
	<div class="col-sm-9">
	<h2>신고 상세</h2>
	<table>
		<tr>
			<td>신고번호</td>
			<td><%=r.getRepNo()%></td>
		</tr>
		<tr>
			<td>신고유형</td>
			<td><%=r.getCategory()%></td>
		</tr>
		<tr>
			<td>신고 내용</td>
			<td><%=r.getContent()%></td>
		</tr>
		<tr>
			<td>신고자 아이디</td>
			<td><%=r.getcId()%></td>
		</tr>
		<tr>
			<td>해당 커뮤니티글 번호</td>
			<td><%=r.getCmmNo()%></td>
		</tr>
	</table>
	<input type="button" id="toSend" class="btn btn-default pull-left" value="리스트 가기" onclick="toList()"/>
	<input type="button" class="btn btn-default pull-right" value="삭제" onclick="reportDelete()"/>
	
	<script>
		function toList(){
			location.href="<%=request.getContextPath() %>/report/reportList";
		}
		function reportDelete(){
			var result=confirm("정말로 삭제합니까?");
			if(result){
				location.href="<%=request.getContextPath() %>/report/deleteReport?repNo=<%=r.getRepNo()%>";
			}
		}
	</script>
	</div>
</section>



	</div>
</div>

	
    
    
<%@ include file="/views/common/footer.jsp"%>