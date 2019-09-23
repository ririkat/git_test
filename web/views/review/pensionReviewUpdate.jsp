<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client, com.jb.review.model.vo.Review" %>
<%
   Review r = (Review) request.getAttribute("review");
   String pCode = (String) request.getAttribute("pCode");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMypage.jsp"%>

      <section id="review-container">
         <div class="container">
         <div class="col-sm-9">
            <h2 class="text-center">리뷰 수정</h2>
              <form action="<%=request.getContextPath() %>/review/reviewUpdateEnd"
               method="post" enctype="multipart/form-data">

               <table id="tbl-review" class="table table-bordered">
                  <tr>
                     <th>제목</th>
                     <td><input type="text" name="title" class="form-control" value="<%=r.getrTitle()%>" required></td>
                  </tr>
                  <tr>
                     <th>작성자</th>
                     <td><input type="text" name="writer" class="form-control" value="test1" readonly/></td>  <%--나중에 loginClient(이거)또는 c.getcId()로 바꾸기 --%>
                  </tr>
                  <tr>
                     <th>첨부파일</th>
                     <td>
                        <input type="button" id="addFile" value="파일 추가" class="form-control" style="width:100px;">
                        <input type="file" name="upFile1" id="upFile" >
                     </td>
                  </tr>
                  <tr>
                     <th>내용</th>
                     <td><textarea rows="5" cols="30" name="content" class="form-control"><%=r.getrContent()%></textarea></td>
                  </tr>
                  <tr>
                     <td colspan="2" style="text-align: center">
                     <input type="submit" value="등록" class="btn my-btn" onclick="">
                     <input type="reset" value="취소" class="btn my-btn" onclick="history.back();"></td>
                  </tr>
               </table>
               <input type="hidden" name="rNo" id="rNo" value="<%=r.getrNo()%>">
               <input type="hidden" name="pCode" id="pCode" value="<%=r.getpCode()%>">
               
            </form>
            </div>
            </div>
      </section>
      
      <script>
         var cnt=2;
         $("#addFile").click(function(){
            var input = $('<input>').attr({"type":"file","name":"upFile"+cnt,"id":"upFile"});
            $("#addFile").parent().append(input);
            console.log(cnt);
            cnt++;
         })
      </script>
      
<%@ include file="/views/common/footer.jsp"%>