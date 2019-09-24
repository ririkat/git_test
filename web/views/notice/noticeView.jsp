<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jb.notice.model.vo.Notice, com.jb.notice.model.vo.NoticeComment, java.util.List"%>
<%
    	Notice n = (Notice)request.getAttribute("notice");
		List<NoticeComment> list = (List)request.getAttribute("list");
    %>
<%@ include file="/views/common/header.jsp"%>
<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>
		<section id="notice-container" class="container">
			<div class="col-sm-9">
				<h2>공지사항</h2>
				<table id="tbl-notice" class="table table-bordered">
					<tr>
						<th>제 목</th>
						<td><%=n.getnTitle()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>관리자</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<%if(n.getnOriginFile()!=null){%>
							<a href="javascript:fn_filedown('<%=n.getnOriginFile()%>','<%=n.getnRenamedFile()%>')"><%=n.getnOriginFile()%>
							<img src="<%=request.getContextPath()%>/images/file.png" width="16px" />
							</a>
							<%}%>
							<script>
					        	function fn_filedown(ori,ren){
					        		var ori=encodeURIComponent(ori);
					        		var ren=encodeURIComponent(ren);
					        		location.href="<%=request.getContextPath()%>/notice/noticeFileDown?orifileName="+ori+"&refileName="+ren;
					        	}
					        </script>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=n.getnContent()%></td>
					</tr>
					<%if(loginClient!=null&&loginClient.getAuthority()==1){ %>
					<tr>
						<td colspan="2" class="text-center">
						<input type="button" value="수정하기" onclick="notice_modify();" class="btn my-btn"/>
						<input type="button" value="삭제하기" onclick="notice_delete();" class="btn my-btn" /></td>
					</tr>
					<%} %>
				</table>


			</div>
			<script>
				//게시글 버튼 이벤트
				//게시글 수정
				function notice_modify(){
					if(confirm("게시물을 수정하시겠습니까?"))
					location.href="<%=request.getContextPath()%>/notice/noticeUpdate?noticeNo=<%=n.getnNo()%>";
				}
				//게시글 삭제
				function notice_delete(){
					if(confirm("정말로 게시물을 삭제하시겠습니까?"))
					location.href="<%=request.getContextPath()%>/notice/noticeDelete?noticeNo=<%=n.getnNo()%>";
				}
				
				//코멘트
				$(function(){
					//로그인 하지 않은 사용자 댓글 등록 불가능 
					$("textarea[name=noticeCommentContent]").focus(function(){
						if(<%=loginClient==null%>){
							alert("로그인 후 등록할 수 있습니다.");
						}
					})
				});
				//답글버튼
				$(function(){
					$('.btn-reply').click(function(){
						if(<%=loginClient != null%>){
							var tr=$('<tr>');
							var td=$('<td>').css({"display":"none","text-align":"left"}).attr("colspan",2);
							var form=$('<form>').attr({
								"action":"<%=request.getContextPath()%>/notice/noticeCommentInsert",
								"method":"post"
							});
							var noticeRef=$("<input>").attr({
								"type":"hidden","name":"noticeRef",
								"value":"<%=n.getnNo()%>"
							});
							var writer=$("<input>").attr({
								"type":"hidden","name":"noticeCommentWriter",
								"value":"<%=loginClient!=null?loginClient.getcId():""%>"
							});
							var level = $("<input>").attr({
								"type" : "hidden",
								"name" : "noticeCommentLevel",
								"value" : "2"
							});
							var content = $("<textarea>").attr({
								"name" : "noticeCommentContent",
								"cols" : "60",
								"rows" : "2"
							});
							var commentRef=$("<input>").attr({
								"type":"hidden","name":"noticeCommentRef",
								"value":$(this).val()
							});
							var btn = $("<button>").attr({
								"type" : "submit",
								"class" : "btn-insert2"
							}).html("등록");
							form.append(noticeRef).append(writer).append(level).append(commentRef).append(content).append(btn);
							td.append(form);
							tr.html(td);
							tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
							$(this).off("click");
							//자료저장 이벤트 등록
							tr.find("form").submit(function(e){
								if(<%=loginClient==null%>){
									alert("로그인 후에 이용해주세요!");
									e.preventDefault();
								}
								var len=$(this).children("textarea").val().trim().length;
								if(len==0){
									alert("내용을 입력하세요");
									e.preventDefault();
								}
							});
						} else {
							alert("로그인 후 등록할 수 있습니다.");
						}
					})
				});
				
				//댓글삭제
				$(function(){
					$(".btn-delete").click(function(){
						if(<%=loginClient==null%>){
							alert("로그인 후에 이용해주세요!");
							return;
						}
						if(confirm("정말로 삭제하시겠습니까?")){
							location.href="<%=request.getContextPath()%>/notice/noticeCommentDelete?no=<%=n.getnNo()%>&commentNo="+$(this).val();
						}
					})
				});
			</script>
		</section>
	</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>