<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.review.model.vo.Review, com.jb.pension.model.vo.Pension,java.util.List"%>
<%@ page import="com.jb.review.model.vo.ReviewFile" %>
<%
   Pension p = (Pension)request.getAttribute("pension");
   String pCode = (String)request.getAttribute("pCode");
   List<Review> reviewList = (List) request.getAttribute("reviewList");
   List<ReviewFile> reviewFileList = (List) request.getAttribute("reviewFileList");
   
   String pageBar = (String) request.getAttribute("pageBar");
   int cPage = (int) request.getAttribute("cPage");
%>


<%@ include file="/views/common/header.jsp"%>
<div class="container-fluid">
   <div class="row content">
<%@ include file="/views/common/sideMypage.jsp"%>

   <style>
        th{
            text-align: center;
        }
    </style>

   <div class="col-sm-9">
     
     <center><p class="title" style="color: #6a60a9;"><%=p.getpName() %>에 대한 리뷰</p></center>
          
            <div id="review-container">
<%--                <form method="get" action="<%=request.getContextPath()%>/notice/noticeFinder"> --%>
<!--                   <input type="text" name="keyword" placeholder="키워드를 입력하세요(제목)"/> -->
<!--                          <button type="submit">검색</button> -->
<!--                </form> -->
            </div>
            <form action="<%=request.getContextPath() %>/review/reviewWrite"
               method="post" enctype="multipart/form-data">
            <table id="tbl-review" class="table table-striped table-hover">
               <thead>
                  <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>내용</th>
                     <th>첨부파일</th>
                     <th>작성자</th>
                  </tr>
               </thead>
               <tbody>
                  <%
                     if(reviewList!=null && !reviewList.isEmpty()){
                        for(Review r : reviewList){ %>
                  <tr>
                     <td style="width: 50px;"><%=r.getrNo()%></td>
                     
                     <td id="content" style="width: 200px; height: 50px;">
                        <a href="<%=request.getContextPath()%>/review/clientReviewView?rNo=<%=r.getrNo()%>&pCode=<%=pCode%>">
                           <%=r.getrTitle()%></a>
                     </td>
                     
                     <td style="width: 250px;"><%=r.getrContent()%></td>
                     
                     <td style="width: 70px;">
                     <% for(ReviewFile rf : reviewFileList){
                        if( (rf.getrNo()==r.getrNo()) && (!rf.getpRenameFile().equals("null")) ){ //!!DB에서 null값을 가져올때 String으로 인식
                           %>
                              <img src="<%=request.getContextPath()%>/images/file.png" alt="첨부파일" width="16px" />
                        <%
                         }
                        }
                        %>
                     </td>
                     <td style="width: 90px;"><%=r.getcId() %></td>
                  </tr>
                     <%}
                        }%>
               </tbody>
            </table>
            
            <input type="hidden" name="pCode" id="pCode" value="<%=pCode%>">
            </form>
<%--             <%if(loginClient!=null&&loginOwner==null){ %> --%>
            <div>
               <button type="submit" id="btn-write" class="btn btn-default pull-left" onclick="writeReview();">등록</button>
            </div>
<%--             <%} %> --%>
            
            <div id="pageBar" class="text-center">
               <ul class="pagination">
                  <li><%=pageBar%></li>
               </ul>
            </div>
         </div>

   <script>
      $(function(){
           $('#mypageList li').removeClass("active");
         $('#mypageList li').eq(1).addClass("active");
         });
      
      function writeReview(){
         location.href="<%=request.getContextPath()%>/review/reviewWrite?pCode=<%=pCode%>";
      }
      
   </script>

<%@ include file="/views/common/footer.jsp"%>