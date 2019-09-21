<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.report.model.vo.Report" %>

<%
 	int cPage=(int)request.getAttribute("cPage");
	String pageBar=(String)request.getAttribute("pageBar");
 	List<Report> list=(List)request.getAttribute("list");
 	
%>
    
<%@ include file="/views/common/header.jsp"%>

<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideMaster.jsp"%>
	<section>
		<div class="col-sm-9">
			<div class="container">
		<h2> 신고내역 </h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>신고번호</th>
                    <th>분류</th>
                    <th>내용</th>
                    <th>신고자</th>
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
        <hr/>
        
        <div class="text-center">
            <ul class="pagination">
                <li><%=request.getAttribute("pageBar") %></li>
            </ul>
		</div>
    		</div>
		</div>
	</section>
    </div>
</div>

<%@ include file="/views/common/footer.jsp"%>