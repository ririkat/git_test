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
			<div class="container">
		<h2> 게시판 </h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            <%if(list!=null && !list.isEmpty()){
            	for(Board b : list){%>
            	<tr>
                    <td><%=b.getbNo() %></td>
                    <td>
                    	<a href="<%=request.getContextPath()%>/board/boardView?bNo=<%=b.getbNo() %>">
                    	<%=b.getTitle() %></a>
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
        <input type="button" value="글쓰기" class="btn btn-default pull-right" onclick="writeBoard()"/>
        <input type="button" value="검색" class="btn btn-default pull-left" onclick="findBoard()"/>

        <div class="text-center">
            <ul class="pagination">
                <li><%=request.getAttribute("pageBar") %></li>
            </ul>
		</div>
    		</div>
			    <script>
			       	function writeBoard(){
			       		location.href="<%=request.getContextPath()%>/board/boardForm";
			       	}
			    </script>
		</div>
	</section>
    </div>
</div>



<%@ include file="/views/common/footer.jsp"%>