package com.jb.master.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.vo.Client;
import com.jb.owner.model.service.OwnerService;

/**
 * Servlet implementation class MasterWaitOneOwnerAccept
 */
@WebServlet("/master/oneOwnerAccept")
public class MasterWaitOneOwnerAccept extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterWaitOneOwnerAccept() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Client loginClient = (Client) request.getSession().getAttribute("loginClient");
      if (loginClient==null || loginClient.getAuthority()!=1) {
         request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
         request.setAttribute("loc", "/");
         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
         return;
      }
      
      //승인(추가)할 업주 아이디 받아오기
      String oId = request.getParameter("oId");
      
      int result = new OwnerService().acceptOwner(oId);
      
      String msg = result>0?"업주 승인 완료":"업주 승인 실패";
      String loc = "/master/waitOwnerList";
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