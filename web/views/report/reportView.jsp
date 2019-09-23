<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.report.model.vo.Report, java.util.List"%>
<%
	Report r=(Report)request.getAttribute("report");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp"%>

<div class="col-sm-10">
    <div class="mContent">
	    <br><br><br>
		<div class="tit_contents">신고상세</div><br>
		
		<table id="tbl-faq" class="table table-bordered">
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
		<input type="submit" class="btn btn-default pull-right" value="신고 접수/경고주기" onclick="reportCon()"/>
		
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
			function reportCon(){
				var result=confirm("신고를 접수합니까? 확인을 누르시면 해당 게시물 작성자의 경고카운트가 올라게됩니다.");
				if(result){
					location.href="<%=request.getContextPath() %>/report/reportEnd?cmmNo=<%=r.getCmmNo()%>";
				}else{
					
				}
			}
		</script>
	</div>
</div>
	
    
    
<%@ include file="/views/common/footer.jsp"%>