<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jb.review.model.vo.Review,com.jb.review.model.vo.ReviewFile, java.util.List" %>
<%
	String pCode = request.getParameter("pCode");
	Review r = (Review)request.getAttribute("review");
	List<ReviewFile> reviewFileList = (List) request.getAttribute("reviewFileList");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>


<section id="review-container" class="container">
	<div class="col-sm-9">
	<h2>게시판</h2>
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
			<%String imgSrc = ""; %>
				<%for(ReviewFile rf : reviewFileList){ %>
					<%if(r.getrNo()==rf.getrNo()){ %>
                      <%imgSrc = rf.getpRenameFile(); %>
                 <%}%>
                 <%}%>
                 <img class="img-responsive" src="<%=request.getContextPath() %>/upload/review/<%=imgSrc%>" 
                 	alt="(X)" style="width:200px; height:130px;">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=r.getrContent() %></td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td colspan="2"> -->
<!-- 			</td> -->
<!-- 		</tr> -->
	</table>
	
	
	<input type="button" id="toList" class="btn btn-default pull-left" value="리뷰목록으로" onclick="toList()"/>
<%-- 		<%if(loginClient!=null && (loginClient.getcId().equals(r.getcId()) || loginClient.getAuthority()==1)) { %> --%>
			<input type="button" class="btn btn-default pull-right" value="삭제" onclick="deleteReview()"/>
			<input type="button" class="btn btn-default pull-right" value="수정" onclick="updateReview()"/>
<%-- 		<%} %> --%>
		<input type="button" class="btn btn-default pull-right" value="신고" onclick="out()"/>
	<script>
		function toList(){
			location.href="<%=request.getContextPath() %>/review/pensionReviewList?pensionCode=<%=pCode%>";
		}
		function updateReview(){
			location.href="<%=request.getContextPath()%>/review/updateReview?rNo=<%=r.getrNo() %>";
		}
		function deleteReview(){
			var result=confirm("정말로 삭제합니까?");
			if(result){
				location.href="<%=request.getContextPath() %>/review/deleteReveiw?rNo=<%=r.getrNo() %>";
			}
		}
		function out(){  //신고
			location.href="<%=request.getContextPath() %>/review/outReview?rNo=<%=r.getrNo()%>";
		}
	</script>
	
</section>
<%@ include file="/views/common/footer.jsp"%>