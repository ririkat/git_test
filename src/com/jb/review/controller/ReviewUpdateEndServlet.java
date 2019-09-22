package com.jb.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jb.review.model.service.ReviewFileService;
import com.jb.review.model.service.ReviewService;
import com.oreilly.servlet.MultipartRequest;

import common.filerename.MyFileRenamePolicy;

/**
 * Servlet implementation class ReviewUpdateEndServlet
 */
@WebServlet("/review/reviewUpdateEnd")
public class ReviewUpdateEndServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      if(!ServletFileUpload.isMultipartContent(request)) {
         request.setAttribute("msg", "수정 오류! 관리자 문의 필요");
         request.setAttribute("loc", "/");
         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
         return;
      }
      
      String root=getServletContext().getRealPath("/");
      String saveDir=root+"/upload/review";
      
      File dir = new File(saveDir);
      if(!dir.exists()) {
         dir.mkdirs();
      }
      
      int maxSize=1024*1024*500;
      
      MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new MyFileRenamePolicy());
      
      String pCode = mr.getParameter("pCode");
      System.out.println("파라미터;"+pCode);
      int rNo= Integer.parseInt(mr.getParameter("rNo"));
      System.out.println("rNo ;"+rNo);
      String title = mr.getParameter("title");
      String writer = mr.getParameter("writer");
      String content = mr.getParameter("content");
      
      
      int result = new ReviewService().updateReview(rNo, title, writer, content, pCode);
      System.out.println("updateReview갔다온후 end서블릿 result : "+result);
      //객실 이미지 추가
      String file="";
      String oriFile = "";
      String reFile="";
      int imgRes = 0;
      Enumeration files = mr.getFileNames();
      while(files.hasMoreElements()) {
         file = (String)files.nextElement();
         oriFile = mr.getOriginalFileName(file);
         reFile = mr.getFilesystemName(file);
         imgRes = new ReviewFileService().addImages(rNo, oriFile, reFile);
         if(!(imgRes>0)) {
            File remove = new File(saveDir+"/"+reFile);
            remove.delete();
         }
      }
      
      String msg="";
      String loc="";
      
      if(result>0 && imgRes>=0) {
         msg="리뷰 수정완료";
         loc="/review/pensionReviewList?pensionCode="+pCode;
      }else {
         File remove=new File(saveDir+"/"+reFile);
         remove.delete();
         msg="게시글 수정 실패";
         loc="/review/pensionReviewList?pensionCode="+pCode;
      }
      request.setAttribute("msg", msg);
      request.setAttribute("loc", loc);
      request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}