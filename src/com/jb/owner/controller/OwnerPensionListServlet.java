package com.jb.owner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.PensionFileService;
import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.PensionFile;

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
		String oId = request.getParameter("oId");
		
		//승인대기중인 펜션 리스트
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 10;
		int totalWaitPension = new PensionService().selectWaitPension(oId);
		List<Pension> waitPensions = new PensionService().selectWaitList(cPage, numPerPage, oId);
		int totalPage = (int)Math.ceil((double)totalWaitPension/numPerPage);
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		if (pageNo == 1) { // 1일때는 이전이 없다
			pageBar += "<span>&laquo;</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/owner/pensionList?oId="+oId+"&cPage=" + (pageNo - 1) + ">&laquo;</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/owner/pensionList?oId="+oId+"&cPage=" + pageNo + ">" + pageNo
						+ "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>&raquo;</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/owner/pensionList?oId="+oId+"&cPage=" + (pageNo) + ">&raquo;</a>";
		}

		//승인된 펜션
		List<Pension> accPensions = new PensionService().selectAccList(oId);
		
		//펜션 이미지파일
		List<PensionFile> pensionFiles = new PensionFileService().selectImages();
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("waitPensions", waitPensions);
		request.setAttribute("accPensions", accPensions);
		request.setAttribute("pensionFiles", pensionFiles);
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
