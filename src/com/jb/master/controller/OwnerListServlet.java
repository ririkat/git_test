package com.jb.master.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.master.model.service.MasterService;
import com.jb.master.model.vo.Master;
import com.jb.owner.model.vo.Owner;

/**
 * Servlet implementation class OwnerListServlet
 */
@WebServlet("/master/ownerList")
public class OwnerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Master loginMaster = (Master)request.getSession().getAttribute("loginMaster");
//		if(loginMaster==null) {
//			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			return;
//		}
		
		//페이징 처리!!
		int cPage;//현재보고있는 페이지
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage=5;//페이지당 출력할 데이터
		//DB에서 데이터 현황(총수), 필요한 데이터 만큼만 조회해서
		//가져옴(공식에 의해)
		int totalOwner=new MasterService().selectCountOwner();
		System.out.println(totalOwner);
		List<Owner> list=new MasterService().selectListPage(cPage,numPerPage);
		System.out.println(list);
		
		//pageBar구성! 구성하는 문자열작성(코드)
//		int totalPage=(int)Math.ceil((double)totalOwner/numPerPage);
//		String pageBar="";
//		int pageSizeBar=5;   //   12345/678910/...
//		System.out.println("cpage : "+cPage);
//		int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
//		System.out.println("pageNo : "+(cPage-1)/pageSizeBar*pageSizeBar);
//		int pageEnd=pageNo+pageSizeBar-1;
//		if(pageNo==1) {
//			pageBar+="<span>[이전]</span>";
//		}
//		else {
//			pageBar+="<a href="+request.getContextPath()+"/master/ownerList?cPage="+(pageNo-1)+">[이전]</a>";
//		}
//		while(!(pageNo>pageEnd||pageNo>totalPage)) {
//			if(pageNo==cPage) {
//				pageBar+="<span class='cPage'>"+pageNo+"</span>";
//			}
//			else {
//				pageBar+="<a href="+request.getContextPath()+"/master/ownerList?cPage="+pageNo+">"+pageNo+"</a>";
//			}
//			pageNo++;
//		}
//		if(pageNo>totalPage) {
//			pageBar+="<span>[다음]</span>";
//		}
//		else {
//			pageBar+="<a href="+request.getContextPath()+
//			"/master/ownerList?cPage="+(pageNo)+">[다음]</a>";
//		}
		
		int totalPage=(int)Math.ceil((double)totalOwner/numPerPage);
		String pageBar="";
		int pageSizeBar=5;   //   12345/678910/...
		System.out.println("cpage : "+cPage);
		int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
		System.out.println("pageNo : "+(cPage-1)/pageSizeBar*pageSizeBar);
		int pageEnd=pageNo+pageSizeBar-1;
		if(pageNo==1) {
			pageBar+="<span>이전</span>";
		}
		else {
			pageBar+="<a href="+request.getContextPath()+"/master/ownerList?cPage="+(pageNo-1)+">[이전]</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='cPage'>"+pageNo+"</span>";
			}
			else {
				pageBar+="<a href="+request.getContextPath()+"/master/ownerList?cPage="+pageNo+">"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>다음</span>";
		}
		else {
			pageBar+="<a href="+request.getContextPath()+
			"/master/ownerList?cPage="+(pageNo)+">다음</a>";
		}
		
		
		
		
		//view페이지에 데이터 전송
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("owners", list);
		request.getRequestDispatcher("/views/master/ownerList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
