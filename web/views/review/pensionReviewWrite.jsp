<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jb.client.model.vo.Client" %>
<%
   String pCode = (String) request.getAttribute("pCode");
   System.out.println(pCode);
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMypage.jsp"%>

      <section id="review-container">
         <div class="container">
         <div class="col-sm-9">
           <div class="tit_contents">리뷰작성</div>
              <form action="<%=request.getContextPath() %>/review/reviewWriteEnd"
               method="post" enctype="multipart/form-data" onsubmit="return fnExtension();">

               <table id="tbl-review" class="table table-bordered">
                  <tr>
                     <th>제목</th>
                     <td><input type="text" name="title" class="form-control" required></td>
                  </tr>
                  <tr>
                     <th>작성자</th>
                     <td><input type="text" name="writer" class="form-control" value="<%=loginClient.getcId()%>" readonly/></td>  <%--나중에 loginClient또는 c.getcId()로 바꾸기 --%>
                  </tr>
                  <tr>
                     <th>첨부파일</th>
                     <td>
                        <input type="button" id="addFile" value="파일 추가" class="form-control" onclick="" style="width:100px;">
                        <input type="file" name="upFile1" id="upFile" >
                     </td>
                  </tr>
                  <tr>
                     <th>내용</th>
                     <td><textarea rows="5" cols="30" name="content" class="form-control"></textarea></td>
                  </tr>
                  <tr>
                     <td colspan="2" style="text-align: center">
                     <input type="submit" value="등록" class="btn my-btn">
                     <input type="reset" value="취소" class="btn my-btn" onclick="history.back();"></td>
                  </tr>
               </table>
               
               <input type="hidden" name="pCode" id="pCode" value="<%=pCode%>">
               
            </form>
            </div>
            </div>
      </section>
      
      <script>
         var cnt=2;
         $("#addFile").click(function(){
            var input = $('<input>').attr({"type":"file","name":"upFile"+cnt,"id":"upFile"});
            $("#addFile").parent().append(input);
            console.log("발발발"+$("#upFile").val());
            console.log(cnt);
            cnt++;
         })
         
         
         
         //파일 업로드 확장자 제한
         function fnExtension(){
        	 var file = $("#upFile").val();
        	 
        	 var fileExt = file.substring(file.lastIndexOf('.')+1);
        	 console.log("파일확장자:"+fileExt);
        	 if(!(fileExt.toUpperCase()=="JPG"||fileExt.toUpperCase()=="JPEG" || fileExt.toUpperCase()=="PNG" || fileExt.toUpperCase()=="GIF")){
               alert(fileExt+" 확장자 업로드 불가!");
               return false;		//preventDefault()로도 가능
            }
         }
      </script>
      
<%@ include file="/views/common/footer.jsp"%>