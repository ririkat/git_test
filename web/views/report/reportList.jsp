<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.report.model.vo.Report" %>

<%
 	int cPage=(int)request.getAttribute("cPage");
	String pageBar=(String)request.getAttribute("pageBar");
 	List<Report> list=(List)request.getAttribute("list");
 	
%>
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp"%>

<div class="col-sm-10">
    <div class="mContent">
        <br><br><br>
		<h2 class="mListTitle">신고내역</h2><br>
		
        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="text-align:center">신고번호</th>
                    <th style="text-align:center">분류</th>
                    <th style="text-align:center">내용</th>
                    <th style="text-align:center">신고자</th>
                </tr>
            </thead>
            <tbody>
            <%if(list!=null && !list.isEmpty()){
            	for(Report r : list){%>
            	<tr>
                    <td>
                    	<a href="<%=request.getContextPath()%>/report/reportView?refNo=<%=r.getRepNo() %>">
                    	<%=r.getRepNo()%></a>
                    </td>
                    <td><%=r.getCategory()%></td>
                    <td><%=r.getContent()%></td>
                    <td><%=r.getcId()%></td>
                </tr>
            <%}
            }
            %>
            </tbody>
        </table>
        
        <div class="text-center">
            <ul class="pagination">
                <li><%=request.getAttribute("pageBar") %></li>
            </ul>
		</div>
    </div>
</div>


<%@ include file="/views/common/footer.jsp"%>