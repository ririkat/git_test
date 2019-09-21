package com.jb.master.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.vo.Client;
import com.jb.pension.model.service.PensionFacilitiesService;
import com.jb.pension.model.service.PensionFileService;
import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.service.RoomService;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.PensionFacilities;
import com.jb.pension.model.vo.PensionFile;
import com.jb.pension.model.vo.Room;

/**
 * Servlet implementation class MasterWaitPensionDetailServlet
 */
@WebServlet("/master/waitDetail")
public class MasterWaitPensionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterWaitPensionDetailServlet() {
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
		
		//펜션정보 받아오기
		String pCode = request.getParameter("pensionCode");
		Pension pInfo = new PensionService().selectPension(pCode);
		
		//해당 펜션 사진 받아오기
		PensionFile pImg = new PensionFileService().selectImages(pCode);

		//해당 펜션 부대시설 받아오기
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
		
		request.setAttribute("pInfo", pInfo);	//선택된 펜션정보
		request.setAttribute("pImg", pImg);		//선택된 펜션 사진
		request.setAttribute("pFac", pFac);		//선택된 펜션 부대시설
		request.getRequestDispatcher("/views/master/waitPensionDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
