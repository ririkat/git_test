package com.jb.owner.controller;

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
@WebServlet("/owner/reviewView")
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
		int rNo= Integer.parseInt(request.getParameter("rNo"));
		Review r = new ReviewService().selectReviewOne(rNo);
		List<ReviewFile> list = new ReviewFileService().selectImages();
		

		request.setAttribute("list", list);
		request.setAttribute("review", r);
		request.getRequestDispatcher("/views/owner/pensionReviewView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
