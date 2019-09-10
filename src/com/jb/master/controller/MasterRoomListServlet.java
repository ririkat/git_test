package com.jb.master.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.vo.Client;
import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.service.RoomService;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.Room;

/**
 * Servlet implementation class MasterRoomListServlet
 */
@WebServlet("/master/roomList")
public class MasterRoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterRoomListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pensionList.jsp에서 보낸 펜션이름 받아서 DB에서 펜션정보(펜션코드,이름,주소,번호,주인아이디) 불러와 roomList.jsp에 보내기
		//pensionList.jsp에서 보낸 펜션이름으로 그에 딸린 객실들도 불러와야함.
		
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
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 9;
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
			pageBar += "<a href=" + request.getContextPath() + "/master/roomList?cPage=" + (pageNo - 1) + ">&laquo;</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/master/roomList?cPage=" + pageNo + ">" + pageNo
						+ "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>&raquo;</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/master/roomList?cPage=" + (pageNo) + ">&raquo;</a>";
		}

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("rooms", rooms);
		request.setAttribute("pInfo", pInfo);
		request.getRequestDispatcher("/views/master/roomList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
