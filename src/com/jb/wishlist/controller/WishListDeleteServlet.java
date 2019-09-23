package com.jb.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jb.wishlist.model.vo.WishList;

/**
 * Servlet implementation class wishListDeleteServlet
 */
@WebServlet("/client/wishListDelete")
public class WishListDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session==null) {
			return;
		}
		
		ArrayList<WishList> wishList = (ArrayList<WishList>)session.getAttribute("wishList");
		
		if(wishList==null) {
			
			return;
		}
		
		//해당 클라이언트의 모든 섹션 삭제
		
//	     session.invalidate();
		
		
		//상품목록 세션삭제
		session.removeAttribute("wishList");
		
		
			
		
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
