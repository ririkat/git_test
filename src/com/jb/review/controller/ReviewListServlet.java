package com.jb.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.review.model.service.ReviewService;
import com.jb.review.model.vo.Review;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review/reviewList")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//리스트를 불러오기전 페이징처리 후 ReviewList를 불러오기
		
		//페이징 처리
		//1.현재 보고있는 페이지 정보
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		//2.페이지당 게시글 출력갯수
		int numPerPage=10;
		
		//3.DB에 접근하여 필요한 데이터 가져오기(해당페이지 게시글만 가져온다)
		ReviewService service = new ReviewService();
		int totalReview = service.selectReviewCount();
		List<Review> list=service.selectReviewList(cPage,numPerPage);
		
		//4.pageBar구성
		int totalPage=(int)Math.ceil((double)totalReview/numPerPage);
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;//페이지바 시작 넘버
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>&lt</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/review/reviewList?cPage="+(pageNo-1)+"'>&lt</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/review/reviewList?cPage="+(pageNo)+"'>"+(pageNo)+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>&gt</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/review/reviewList?cPage="+(pageNo)+"'>&gt</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/review/reviewList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
