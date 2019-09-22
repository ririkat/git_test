<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jb.review.model.vo.Review,com.jb.review.model.vo.ReviewFile,   java.util.List,java.util.ArrayList" %>
<%
	String pCode = request.getParameter("pCode");
	Review r = (Review)request.getAttribute("review");
	List<ReviewFile> reviewFileList = (List) request.getAttribute("reviewFileList");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMypage.jsp"%>


<section id="review-container" class="container">
	<div class="col-sm-9">
	<h2>리뷰</h2>
	<table id="tbl-review" class="table table-bordered">
		<tr>
			<td>게시번호</td>
			<td><%=r.getrNo() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=r.getrTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=r.getcId()%></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
			<% if(r !=null) {
			
			List<ReviewFile> curRfList = new ArrayList();
				for(ReviewFile rf : reviewFileList){
					if(rf.getrNo()==r.getrNo()){
						curRfList.add(rf);%>
		                 <%} %>
		                 <%} %>
						<%for(int i=0; i<curRfList.size(); i++) {%>
		                 <img class="img-responsive" src="<%=request.getContextPath() %>/upload/review/<%=curRfList.get(i).getpRenameFile()%>" 
		                 	alt="파일 없음" style="width:50%; ">
				<%} %>
			<%} %>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td style="height: 100px;"><%=r.getrContent() %></td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td colspan="2"> -->
<!-- 			</td> -->
<!-- 		</tr> -->
	</table>
	
	
	<input type="button" id="toList" class="btn btn-default pull-left" value="리뷰목록으로" onclick="toList()"/>
		<%if(loginClient!=null && (loginClient.getcId().equals(r.getcId()) || loginClient.getAuthority()==1)) { %>
			<input type="button" class="btn btn-default pull-right" value="삭제" onclick="deleteReview()"/>
			<input type="button" class="btn btn-default pull-right" value="수정" onclick="updateReview()"/>
		<%} %>
		<input type="button" class="btn btn-default pull-right" value="신고" onclick="out()"/>
	<script>
		function toList(){
			location.href="<%=request.getContextPath() %>/review/clientReviewList?pensionCode=<%=pCode%>";
		}
		function updateReview(){
			if(confirm("주의! 수정 시 기존 게시물의 사진들은 삭제됩니다!\n정말 수정하시겠습니까?"))
			location.href="<%=request.getContextPath()%>/review/updateReview?rNo=<%=r.getrNo() %>";
		}
		function deleteReview(){
			var result=confirm("정말로 삭제합니까?");
			if(result){
				location.href="<%=request.getContextPath() %>/review/deleteReview?pCode=<%=pCode%>&rNo=<%=r.getrNo()%>";
			}
		}
		function out(){  //신고
			location.href="<%=request.getContextPath() %>/review/outReview?rNo=<%=r.getrNo()%>";
		}
	</script>
	
</section>
<%@ include file="/views/common/footer.jsp"%>