package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.PensionFacilitiesService;
import com.jb.pension.model.service.PensionFileService;
import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.PensionFacilities;

/**
 * Servlet implementation class OwnerWaitPensionDetailServlet
 */
@WebServlet("/owner/waitDetail")
public class OwnerWaitPensionDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerWaitPensionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String pCode = request.getParameter("pensionCode");
      Pension pInfo = new PensionService().selectPension(pCode);
      String imgSrc = new PensionFileService().selectImages(pCode).getpRenameFile();
      PensionFacilities pf = new PensionFacilitiesService().selectPensionFac(pCode);
      String pFac = "";
      if(pf.getStore().equals("Y")) {
         pFac += " 매점 /";
      }
      if(pf.getWifi().equals("Y")) {
         pFac += " 와이파이 /";
      }
      if(pf.getPet().equals("Y")) {
         pFac += " 애견가능 /";
      }
      if(pf.getPool().equals("Y")) {
         pFac += " 공용수영장 /";
      }
      if(pf.getsPool().equals("Y")) {
         pFac += " 어린이풀장 /";
      }
      if(pf.getSlide().equals("Y")) {
         pFac += " 워터슬라이드 /";
      }
      if(pf.getOpenBath().equals("Y")) {
         pFac += " 노천탕 /";
      }
      if(pf.getGrill().equals("Y")) {
         pFac += " 그릴 /";
      }
      if(pf.getSmoked().equals("Y")) {
         pFac += " 바베큐세트 /";
      }
      if(pf.getCafe().equals("Y")) {
         pFac += " 카페 /";
      }
      if(pf.getSing().equals("Y")) {
         pFac += " 노래방 /";
      }
      if(pf.getFoot().equals("Y")) {
         pFac += " 축구장 /";
      }
      if(pf.getHand().equals("Y")) {
         pFac += " 농구장 /";
      }
      if(pf.getCar().equals("Y")) {
         pFac += " 주차장 /";
      }
      pFac += " ...";
      
      request.setAttribute("pInfo", pInfo);
      request.setAttribute("imgSrc", imgSrc);
      request.setAttribute("pFac", pFac);
      request.getRequestDispatcher("/views/owner/waitPensionDetail.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}