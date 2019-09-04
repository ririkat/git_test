package com.jb.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.notice.model.service.NoticeService;
import com.jb.notice.model.vo.Notice;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/notice/noticeList")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//리스트를 불러오기에 앞서,
		//게시판에 기본적으로 필요한 페이징 처리를 먼저 해준 뒤에
		//NoticeList를 불러올 것.
		//---페이징처리----
		//1.현재 보고 있는 페이지가 몇페인지의 정보를 담아줌.
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;//처음 게시판에 호출되면 cPage가 설정되어 있지 않으므로 기본적으로 1로 호출되도록 예외처리 해줌.
		}
		
		//2.페이지당 몇개의 게시글을 출력할건지
		int numPerPage=10;
		
		//3.db에 접근해서 필요한 데이터만큼만 잘라서 가져오기(해당 페이지의 게시글만 가져옴)
		NoticeService service = new NoticeService();
		int totalNotice = service.selectNoticeCount();
		List<Notice> list=service.selectNoticeList(cPage,numPerPage);
		
		//4.pageBar구성
		int totalPage=(int)Math.ceil((double)totalNotice/numPerPage);
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;//페이지바 시작 넘버
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>&lt</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList?cPage="+(pageNo-1)+"'>&lt</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList?cPage="+(pageNo)+"'>"+(pageNo)+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>&gt</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList?cPage="+(pageNo)+"'>&gt</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/notice/noticeList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
