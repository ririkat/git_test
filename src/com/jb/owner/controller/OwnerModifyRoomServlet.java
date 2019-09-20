package com.jb.owner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.RoomFacilitiesService;
import com.jb.pension.model.service.RoomFileService;
import com.jb.pension.model.vo.RoomFacilities;
import com.jb.pension.model.vo.RoomFile;

/**
 * Servlet implementation class OwnerModifyRoomServlet
 */
@WebServlet("/owner/modifyRoom")
public class OwnerModifyRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerModifyRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rNo = request.getParameter("rNo");
		String pCode = request.getParameter("pCode");
		String pName = request.getParameter("pName");
		String rName = request.getParameter("rName");
		String rNop = request.getParameter("rNop");
		String rMaxNop = request.getParameter("rMaxNop");
		String rPrice = request.getParameter("rPrice");
		String rAddPrice = request.getParameter("rAddPrice");
		String rSize = request.getParameter("rSize");
		String rStruc = request.getParameter("rStruc");
		String rInfo = request.getParameter("rInfo");
		
		//이미지
		List<RoomFile> rImgs = new RoomFileService().curRoomFiles(rNo);
		//부대시설
		RoomFacilities rFacs = new RoomFacilitiesService().curRoomFac(rNo);
		
		request.setAttribute("rNo", rNo);
		request.setAttribute("pCode", pCode);
		request.setAttribute("pName", pName);
		request.setAttribute("rName", rName);
		request.setAttribute("rNop", rNop);
		request.setAttribute("rMaxNop", rMaxNop);
		request.setAttribute("rPrice", rPrice);
		request.setAttribute("rAddPrice", rAddPrice);
		request.setAttribute("rSize", rSize);
		request.setAttribute("rStruc", rStruc);
		request.setAttribute("rInfo", rInfo);
		request.setAttribute("rImgs", rImgs);
		request.setAttribute("rFacs", rFacs);
		
		request.getRequestDispatcher("/views/owner/modifyRoom.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
