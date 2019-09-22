package com.jb.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.review.model.service.ReviewFileService;
import com.jb.review.model.service.ReviewService;
import com.jb.review.model.vo.Review;
import com.jb.review.model.vo.ReviewFile;

/**
 * Servlet implementation class OwnerReviewViewServlet
 */
@WebServlet("/review/ownerReviewView")
public class OwnerReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerReviewViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pCode = request.getParameter("pCode");
		int rNo= Integer.parseInt(request.getParameter("rNo"));
		Review r = new ReviewService().selectReviewOne(rNo);
		List<ReviewFile> reviewFileList = new ReviewFileService().selectImages();
		System.out.println("view서블릿에서 view.jsp로 객체 내용 :"+r);
		
		request.setAttribute("pCode", pCode);
		request.setAttribute("reviewFileList", reviewFileList);
		request.setAttribute("review", r);
		request.getRequestDispatcher("/views/review/ownerPensionReviewView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
