<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jb.faq.model.vo.Faq"%>
	<%
	Faq f=(Faq)request.getAttribute("faq");
	%>
<%@ include file="/views/common/header.jsp"%>
<div class="container-fluid">
	<div class="row content">
		<%@ include file="/views/common/sideBoard.jsp"%>
<section id="faq-container">
<div class="col-sm-9">
	<h2>FAQ 수정</h2>
	<form  action="<%=request.getContextPath() %>/faq/faqUpdateEnd?faqNo=<%=f.getfNo() %>" method="post" enctype="multipart/form-data">
        <table id="tbl-board">
        <tr>
            <th>제 목</th>
            <td><input type="text" name="title" id="title" value="<%=f.getfTitle()%>" required></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="writer" id="writer" value="<%=loginClient.getcId()%>" readonly /></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
            
            <input type="file" name="up_file" id="up_file" >
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><textarea rows="5" cols="50" name="content" id="content"   required><%=f.getfContent() %></textarea></td>
        </tr>
        <tr>
            <th colspan="2">
                <input type="submit" value="수정" onclick="return validate();">
                <input type="reset" value="취소" onclick="history.back();">
            </th>
        </tr>
    </table>
    <input type="hidden" value='<%=f.getfOriginFilename()!=null?f.getfOriginFilename():""%>' name="oriori"/>
    <input type="hidden" value='<%=f.getfRenamedFilename()!=null?f.getfRenamedFilename():""%>' name="oriren"/>
    </form>
    <script>
    	function validate(){
    		return true;
    	}
    </script>
</div>
</section>
</div>
</div>
<%@ include file="/views/common/footer.jsp"%>