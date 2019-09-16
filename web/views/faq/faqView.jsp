<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jb.faq.model.vo.Faq, com.jb.faq.model.vo.FaqComment, java.util.List"%>
	<%
	Faq f=(Faq)request.getAttribute("faq");
	List<FaqComment> list=(List)request.getAttribute("list");
	%>
<%@ include file="/views/common/header.jsp"%>
<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>
<section id="faq-container" class="container">
			<div class="col-sm-9">
				<h2>공지사항</h2>
				<table id="tbl-faq" class="table table-bordered">
					<tr>
						<th>제 목</th>
						<td><%=f.getfTitle()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>관리자</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<%if(f.getfOriginFilename()!=null){%>
							<a href="javascript:fn_filedown('<%=f.getfOriginFilename()%>','<%=f.getfRenamedFilename()%>')"><%=f.getfOriginFilename()%>
							<img src="<%=request.getContextPath()%>/images/file.png" width="16px" />
							</a>
							<%}%>
							<script>
					        	function fn_filedown(ori,ren){
					        		var ori=encodeURIComponent(ori);
					        		var ren=encodeURIComponent(ren);
					        		location.href="<%=request.getContextPath()%>/faq/faqFileDown?orifileName="+ori+"&refileName="+ren;
					        	}
					        </script>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=f.getfContent()%></td>
					</tr>
					<%if(loginClient.getAuthority()==1){ %>
					<tr>
						<td colspan="2" class="text-center">
						<input type="button" value="수정하기" onclick="faq_modify();" class="btn my-btn"/>
						<input type="button" value="삭제하기" onclick="faq_delete();" class="btn my-btn" /></td>
					</tr>
					<%} %>
				</table>

				<div id="comment-container">
					<div id="comment-editor">
						<form action="<%=request.getContextPath()%>/faq/faqCommentInsert" method="post">
							<input type="hidden" name="faqRef" value="<%=f.getfNo()%>"/>
							<input type="hidden" name="faqCommentWriter" value="<%=loginClient!=null?loginClient.getcId():""%>"/>
							<input type="hidden" name="faqCommentLevel" value="1"/>
							<input type="hidden" name="faqCommentRef" value="0"/>
							<textarea name="faqCommentContent" cols="60" rows="3"></textarea>
							<button type="submit" id="btn-insert">등록</button>
						</form>
					</div>
				</div>

				<table id="tbl-comment">
					<%
						if(list!=null&&!list.isEmpty()){
							for(FaqComment fc : list){
								if(fc.getfCommentLevel()==1){
					%>
						<tr class="level1">
							<td>
								<sub class="comment-writer"><%=fc.getfCommentWriter()%></sub>
								<sub class="comment-date"><%=fc.getfCommentDate()%></sub><br/>
								<%=fc.getfCommentContent()%>
							</td>
							<td>
									<button class="btn-reply" value="<%=fc.getfCommentNo()%>">답글</button>
									<%
										if(loginClient.getAuthority()==1||fc.getfCommentWriter().equals(loginClient.getcId())){
									%>
									<button class="btn-delete" value="<%=fc.getfCommentNo()%>">삭제</button>
									<%
										}
									%>
							</td>
						</tr>
						<%
						}else{
						%>
						<tr class="level2">
							<td>
								<sub><%=fc.getfCommentWriter()%></sub>
								<sub><%=fc.getfCommentDate()%></sub><br/>
								<%=fc.getfCommentContent()%>
							</td>
						</tr>
						<%
						}
						}
					}
					%>
				</table>
			</div>
			<script>
				//게시글 버튼 이벤트
				//게시글 수정
				function faq_modify(){
					location.href="<%=request.getContextPath()%>/faq/faqUpdate?faqNo=<%=f.getfNo()%>";
				}
				//게시글 삭제
				function faq_delete(){
					location.href="<%=request.getContextPath()%>/faq/faqDelete?faqNo=<%=f.getfNo()%>";
				}
				
				//코멘트
				$(function(){
					//로그인 하지 않은 사용자 댓글 등록 불가능 
					$("textarea[name=faqCommentContent]").focus(function(){
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
								"action":"<%=request.getContextPath()%>/faq/faqCommentInsert",
								"method":"post"
							});
							var faqRef=$("<input>").attr({
								"type":"hidden","name":"faqRef",
								"value":"<%=f.getfNo()%>"
							});
							var writer=$("<input>").attr({
								"type":"hidden","name":"faqCommentWriter",
								"value":"<%=loginClient!=null?loginClient.getcId():""%>"
							});
							var level = $("<input>").attr({
								"type" : "hidden",
								"name" : "faqCommentLevel",
								"value" : "2"
							});
							var content = $("<textarea>").attr({
								"name" : "faqCommentContent",
								"cols" : "60",
								"rows" : "2"
							});
							var commentRef=$("<input>").attr({
								"type":"hidden","name":"faqCommentRef",
								"value":$(this).val()
							});
							var btn = $("<button>").attr({
								"type" : "submit",
								"class" : "btn-insert2"
							}).html("등록");
							form.append(faqRef).append(writer).append(level).append(commentRef).append(content).append(btn);
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
							location.href="<%=request.getContextPath()%>/faq/faqCommentDelete?no=<%=f.getfNo()%>&commentNo="+$(this).val();
						}
					})
				});
			</script>
		</section>
	</div>
	</div>

<%@ include file="/views/common/footer.jsp"%>