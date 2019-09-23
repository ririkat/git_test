package com.jb.master.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.RoomFacilitiesService;
import com.jb.pension.model.service.RoomFileService;
import com.jb.pension.model.service.RoomService;
import com.jb.pension.model.vo.Room;
import com.jb.pension.model.vo.RoomFacilities;
import com.jb.pension.model.vo.RoomFile;

/**
 * Servlet implementation class MasterRoomDetailServlet
 */
@WebServlet("/master/roomDetail")
public class MasterRoomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterRoomDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pCode = request.getParameter("pCode");
		String rNo = request.getParameter("rNo");
		
		Room r = new RoomService().selectRoom(rNo);
		List<RoomFile> rFileList = new RoomFileService().curRoomFiles(rNo);
		RoomFacilities rFac = new RoomFacilitiesService().curRoomFac(rNo);
		
		request.setAttribute("pCode", pCode);
		request.setAttribute("r", r);
		request.setAttribute("rFileList", rFileList);
		request.setAttribute("rFac", rFac);
		request.getRequestDispatcher("/views/master/roomDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
