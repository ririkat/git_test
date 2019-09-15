package com.jb.owner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.vo.Owner;
import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.vo.Pension;

/**
 * Servlet implementation class OwnerPensionEnrollServlet
 */
@WebServlet("/owner/pensionList")
public class OwnerPensionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerPensionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//업주 아이디 받아와서 업주소유의 펜션만 불러오기.
		//리스트 위쪽에 추가버튼 필요.
		//펜션 리스트에는 승인여부도 표시해주기
		//승인된 펜션은 클릭-> 정보 띄워주고 수정버튼, 아래에 객실리스트 및 객실 추가버튼
		
		String oId = request.getParameter("oId");
		
		//승인대기중인 펜션 리스트
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 3;
		int totalWaitPension = new PensionService().selectWaitPension(oId);
		List<Pension> pensions = new PensionService().selectWaitList(cPage, numPerPage, oId);
		int totalPage = (int)Math.ceil((double)totalWaitPension/numPerPage);
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		if (pageNo == 1) { // 1일때는 이전이 없다
			pageBar += "<span>&laquo;</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/owner/pensionList?cPage=" + (pageNo - 1) + ">&laquo;</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/owner/pensionList?cPage=" + pageNo + ">" + pageNo
						+ "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>&raquo;</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/owner/pensionList?cPage=" + (pageNo) + ">&raquo;</a>";
		}

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("waitPensions", pensions);
		request.getRequestDispatcher("/views/owner/pensionManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
