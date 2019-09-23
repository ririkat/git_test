package com.jb.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.vo.Pension;
import com.jb.review.model.service.ReviewFileService;
import com.jb.review.model.service.ReviewService;
import com.jb.review.model.vo.Review;
import com.jb.review.model.vo.ReviewFile;

/**
 * Servlet implementation class ClientReviewListServlet
 */
@WebServlet("/review/clientReviewList")
public class ClientReviewListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String pCode = (String) request.getParameter("pensionCode");
//      String pCode = "p1001";
      System.out.println("리뷰버튼 눌렀을때 넘어오는 pCode: "+pCode);
      Pension p = new PensionService().selectPension(pCode);
      System.out.println("pension정보하나: "+p);
      
      //pCode를 받아와서 자신의 예약내역에 있는지 확인
//      String resCheck = new
      
      //페이징 처리
      //1.현재 보고있는 페이지 정보
      int cPage;
      try {
         cPage=Integer.parseInt(request.getParameter("cPage"));
      }catch(NumberFormatException e) {
         cPage=1;
      }
      //2.페이지당 게시글 출력갯수
      int numPerPage=10;
      
      
      //3.DB에 접근하여 필요한 데이터 가져오기(해당페이지 게시글만 가져온다)
      ReviewService service = new ReviewService();
            
      int totalMyPensionReview = service.selectMyPensionReviewCount(pCode);
      System.out.println("totalMypensionReview : "+totalMyPensionReview);
      //리뷰 리스트
      List<Review> reviewList=service.selectMyPensionReviewList(pCode, cPage,numPerPage);
      //리뷰 파일리스트
      List<ReviewFile> reviewFileList = new ReviewFileService().selectImages();
      
      
      
      //4.pageBar구성
      int totalPage=(int)Math.ceil((double)totalMyPensionReview/numPerPage);
      String pageBar="";
      int pageBarSize=5;
      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;//페이지바 시작 넘버
      int pageEnd=pageNo+pageBarSize-1;
      
      if(pageNo==1) {
         pageBar+="<span>&lt</span>";
      }else {
         pageBar+="<a href='"+request.getContextPath()+"/review/clientReviewList?pensionCode="+pCode+"&cPage="+(pageNo-1)+"'>&lt</a>";
      }
      
      while(!(pageNo>pageEnd||pageNo>totalPage)) {
         if(pageNo==cPage) {
            pageBar+="<span>"+pageNo+"</span>";
         }else {
            pageBar+="<a href='"+request.getContextPath()+"/review/clientReviewList?pensionCode="+pCode+"&cPage="+(pageNo)+"'>"+(pageNo)+"</a>";
         }
         pageNo++;
      }
      
      if(pageNo>totalPage) {
         pageBar+="<span>&gt</span>";
      }else {
         pageBar+="<a href='"+request.getContextPath()+"/review/clientReviewList?pensionCode="+pCode+"&cPage="+(pageNo)+"'>&gt</a>";
      }
      
      request.setAttribute("pageBar", pageBar);
      request.setAttribute("cPage", cPage);
      request.setAttribute("pCode", pCode);
      request.setAttribute("pension", p); 
      request.setAttribute("reviewList", reviewList);
      request.setAttribute("reviewFileList", reviewFileList);
      request.getRequestDispatcher("/views/review/clientPensionReviewList.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}