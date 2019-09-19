<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jb.review.model.vo.Review,com.jb.review.model.vo.ReviewFile, java.util.List" %>
<%
	Review r = (Review)request.getAttribute("review");
	List<ReviewFile> rf = (List)request.getAttribute("list");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideOwner.jsp"%>


<section>
	<div class="col-sm-9">
	<h2>게시판</h2>
	<table>
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
			<td>첨부파일</td>
			<td>
				<% if (list != null && !list.isEmpty()) {
								for (ReviewFile rf : list) {  %>
				<%if(rf.  !=null){%>
                     <a href="javascript:fn_filedown('<%=b.getOriginalFilename()%>','<%=b.getRenameFilename()%>')">
                     <img src="<%=request.getContextPath()%>/images/file.png" width="16px"/><%=b.getOriginalFilename() %></a>
                 <%}%>
                 
                 <%}
					}%>
                 
				 <script>
                        function fn_filedown(ori,ren){
                           	var ori=encodeURIComponent(ori);
                           	var ren=encodeURIComponent(ren);
                           	location.href="<%=request.getContextPath()%>/board/boardFileDown?orifileName="+ori+"&refileName="+ren;
                        };
                 </script>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=b.getContent() %></td>
		</tr>
		<tr>
			<td colspan="2">
			</td>
		</tr>
	</table>
	<input type="button" id="toSend" class="btn btn-default pull-left" value="글목록으로" onclick="toList()"/>
		<%if(loginClient!=null && (loginClient.getcId().equals(b.getcId()) || loginClient.getcId().equals("admin"))) { %>
			<input type="button" class="btn btn-default pull-right" value="삭제" onclick="deleteBoard()"/>
			<input type="button" class="btn btn-default pull-right" value="수정" onclick="updateBoard()"/>
		<%} %>
		<input type="button" class="btn btn-default pull-right" value="신고" onclick="out()"/>
	<script>
		function toList(){
			location.href="<%=request.getContextPath() %>/board/boardList";
		}
		function updateBoard(){
			
<%-- 		location.href="<%=request.getContextPath()%>/board/updateBoard?cmmNo=<%=b.getCmmNo()%>"; --%>
			location.href="<%=request.getContextPath()%>/board/updateBoard?cmmNo=<%=b.getCmmNo() %>";
		}
		function deleteBoard(){
			var result=confirm("정말로 삭제합니까?");
			if(result){
				location.href="<%=request.getContextPath() %>/board/deleteBoard?cmmNo=<%=b.getCmmNo()%>";
			}
		}
		function out(){
			location.href="<%=request.getContextPath() %>/board/outBoard?cmmNo=<%=b.getCmmNo()%>";
		}
	</script>		
	
	<!-- 댓글  -->
	<div id="comment-container">
		<div class="comment-editor">
			<form action="<%=request.getContextPath() %>/boardcomment/commentInsert" method="post">
				<input type="hidden" name="cmmNo" value="<%=b.getCmmNo() %>"/>
				<input type="hidden" name="boardCommentWriter" value="<%=loginClient!=null?loginClient.getcId():"" %>"/>
				<input type="hidden" name="boardCommentLevel" value="1"/>
				<input type="hidden" name="boardCommentRef" value="0">
				<textarea name="boardCommentContent" rows="3" cols="60"></textarea>
				<button type="submit" id="btn-insert">등록</button> 
			</form>
		</div>
	</div>
	<script>
		$(function (){
			$("textarea[name=boardCommentContent]").focus(function(){
				if(<%=loginClient==null%>){
					alert("로그인 후 댓글을 이용할 수 있습니다.");
				}
			});
		});
	</script>
	<table id="tbl=comment">
		<%if(list!=null&&!list.isEmpty()){
			for(BoardComment bc : list){
				if(bc.getCommentLevel()==1){
			%>
			<tr class="level1">
				<td>
					<sub class="comment-writer">
						<%=bc.getcId() %>
					</sub>
					<sub class="comment-date">
						<%=bc.getCommentDate() %>
					</sub>
					<br/>
					<%=bc.getComment() %>
				</td>
				<td>
					<button class="btn-reply" value="<%=bc.getCommentNo() %>">답글</button>
					<%if(loginClient!=null
						&&("admin".equals(loginClient.getcId())||bc.getcId().equals(loginClient.getcId()))) {%>
						<button class="btn-delete" value="<%=bc.getCommentNo()%>">삭제</button>
						<%} %>
					</td>
				</tr>
			<%}else{ %>
			<tr class="level2">
				<td>
					<sub>
						<%=bc.getcId() %>
					</sub>
					<sub>
						<%=bc.getCommentDate() %>
					</sub>
					<br/>
					<%=bc.getComment() %>
				</td>
				<td>
					<%if(loginClient!=null
						&&("admin".equals(loginClient.getcId())||bc.getcId().equals(loginClient.getcId()))) {%>
					<button class="btn-delete" value="<%=bc.getCommentNo()%>">삭제</button>
					<%} %>
				</td>
			</tr>
			<%}
			}
		}%>
	</table>
<script>
	$(function(){
		$('.btn-delete').click(function(){
			if(<%=loginClient==null%>){
				alert("로그인 후 사용가능합니다.");
				return
			}if(confirm("정말로 삭제하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/board/boardCommentDelete?cmmNo=<%=b.getCmmNo()%>&commentNo="+$(this).val();
			}
		})
		$('.btn-reply').click(function(){
			if(<%=loginClient!=null%>){
				var tr=$('<tr>');
				var td=$("<td>").css({"display":"none","text-align":"left"}).attr("colspan",2);
				
// 				대댓글
				var form=$("<form>").attr({
					"action":"<%=request.getContextPath()%>/board/boardCommentInsert","method":"post"
				});
				var cmmNo=$("<input>").attr({
					"type":"hidden","name":"cmmNo","value":"<%=b.getCmmNo()%>"
				});
				var writer=$("<input>").attr({
					"type":"hidden","name":"writer","value":"<%=loginClient!=null?loginClient.getcId():"" %>"
				});
				var level=$("<input>").attr({
					"type":"hidden","name":"level","value":"2"
					});
				var comment=$("<textarea>").attr({
						"name":"comment","cols":"60","rows":"2"
					});
				var commentRef=$("<input>").attr({
					"type":"hidden","name":"commentRef","value":$(this).val()
					});
				var btn=$("<button>").attr({
						"type":"submit","class":"btn-insert2"
					}).html("등록");
				
				form.append(cmmNo).append(writer).append(level).append(comment).append(commentRef).append(btn);
				td.append(form);
				tr.html(td);
				tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
				
				$(this).off("click");
				
				tr.find("form").submit(function(e){
					if(<%=loginClient==null%>){
						alert("로그인 후 이용해주세요!");
						e.preventDefault();
					}
					var len=$(this).children("textarea").val().trim().length;
					if(len==0){
						alert("내용을 입력하세요");
						e.preventDefault();
					}
				});
			}else{
				alert("로그인 후 이용할 수 있습니다.");
			}
		})
	});
</script>
	
</section>









<%@ include file="/views/common/footer.jsp"%>