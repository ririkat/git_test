<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.board.model.vo.Board" %>

<%
 	int cPage=(int)request.getAttribute("cPage");
	String pageBar=(String)request.getAttribute("pageBar");
 	List<Board> list=(List)request.getAttribute("list");
 	
%>
    
<%@ include file="/views/common/header.jsp"%>

<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>
	<section>
		<div class="col-sm-9">
			<div>
			<br><br><br><br>
			
		<center><p class="title" style="color: #6a60a9;">게시판</p></center>
		<br>
		<br>
		<br>
		<hr>
	
		 <div class="container">
               <div class = "input-group" style="float:right;">
                <form method="get" action="<%=request.getContextPath()%>/notice/noticeFinder">
                <input type="text"  style="width:300px;" name="keyword" placeholder="키워드를 입력하세요(제목)"/>
                                                       
                    <button type="submit"  style="height:29px;" style="vertical-align:middle;"class = "btn btn-warning">검색</button>   <br><br>                                         
                  </form>
            </div>
            <br><br><br><br>
		<br>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>첨부파일</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            <%if(list!=null && !list.isEmpty()){
            	for(Board b : list){%>
            	<tr>
                    <td><%=b.getCmmNo() %></td>
                    <td>
                    	<a href="<%=request.getContextPath()%>/board/boardView?cmmNo=<%=b.getCmmNo() %>">
                    	<%=b.getTitle() %></a>
                    </td>
                    <td>
						<%
							if (b.getOriginalFilename() != null) {
						%>
						<img src="<%=request.getContextPath()%>/images/file.png" alt="첨부파일" width="16px" />
						<%
						 }
						%>
					</td>
                    <td><%=b.getcId() %></td>
                    <td><%=b.getEntDate() %></td>
                    <td><%=b.getViewCnt() %></td>
                </tr>
            <%}
            }
            %>
            </tbody>
        </table>
        
        <hr/>

        <!-- 글쓰기 버튼 좌우 정렬 pull-right / pull-left -->
        <!-- 로그인시에만 보이는 보이는 로직 필요 -->
        
        <br><br><br><br><br>
        <div class="text-center">
           <center>
    		<input type="button" value="글쓰기" class="btn btn-warning" onclick="writeBoard()"/>
        <input type="button" value="검색" class="btn btn-warning" onclick="findBoard()"/>
        </center>
        <br><br><br><br>
            <ul class="pagination">
            
                <li><%=request.getAttribute("pageBar") %></li>
            </ul>
		</div>
    		</div>
    		
    		</div>
			    <script>
			       	function writeBoard(){
			       		location.href="<%=request.getContextPath()%>/board/boardForm";
			       	}
			       	function SMTP(){
			       		location.href="<%=request.getContextPath()%>/board/SMTPTest";
			       	}
			    </script>
		</div>
	</section>
    </div>
</div>

<%@ include file="/views/common/footer.jsp"%>