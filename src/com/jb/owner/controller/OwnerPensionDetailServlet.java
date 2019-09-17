package com.jb.owner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.PensionFacilitiesService;
import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.service.RoomService;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.PensionFacilities;
import com.jb.pension.model.vo.Room;

/**
 * Servlet implementation class OwnerPensionDetailServlet
 */
@WebServlet("/owner/pensionDetail")
public class OwnerPensionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerPensionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pCode = request.getParameter("pensionCode");
		
		String imgSrc = request.getParameter("imgSrc");
		Pension pInfo = new PensionService().selectPension(pCode);
		List<Room> roomList = new RoomService().selectRoomList(pCode);
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

		
		// 객실 리스트
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 10;
		int totalRoom = new RoomService().selectCountRoom(pCode);
		List<Room> rooms = new RoomService().selectListPage(cPage, numPerPage, pCode);
		int totalPage = (int) Math.ceil((double) totalRoom / numPerPage);
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		if (pageNo == 1) { // 1일때는 이전이 없다
			pageBar += "<span>&laquo;</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/owner/pensionDetail?pCode=" + pCode + "&cPage="
					+ (pageNo - 1) + ">&laquo;</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/owner/pensionDetail?pCode=" + pCode + "&cPage=" + pageNo
						+ ">" + pageNo + "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>&raquo;</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/owner/pensionDetail?pCode=" + pCode + "&cPage=" + (pageNo)
					+ ">&raquo;</a>";
		}
		
		request.setAttribute("imgSrc", imgSrc);
		request.setAttribute("pInfo", pInfo);
		request.setAttribute("roomList", roomList);
		request.setAttribute("pFac", pFac);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/owner/pensionDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
