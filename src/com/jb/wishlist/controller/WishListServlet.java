package com.jb.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.wishlist.model.service.WishListService;
import com.jb.wishlist.model.vo.WishList;

/**
 * Servlet implementation class WishListServlet
 */
@WebServlet("/client/wishList")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//찜하기 누르면 여기로 넘겨달라고 말하기 (to 장덕철) !!
		String pImage = request.getParameter("pImage");
		String pName = request.getParameter("pName");
		String pAddr = request.getParameter("pAddr");
		String pTel = request.getParameter("pTel");
		String pCode = request.getParameter("pCode");
		String cid=request.getParameter("cid");
		
		WishList w=new WishList(pCode, pAddr, pImage, pName, pTel, cid);
		WishListService service = new WishListService();
		int result = service.insertWishList(w);
		
		List<WishList> list=new ArrayList<WishList>();
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			request.setAttribute("list", list);
			loc="/views/client/wishList.jsp";
			request.getRequestDispatcher(loc).forward(request, response);
		}else {
			msg="찜 실패, 관리자에게 문의하세요.";
			loc="/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}		
		
		
		
//        request.getRequestDispatcher("/views/wishList.jsp").forward(request, response);

	        
	        
	        
	        
	        
	        //세션으로 만들기 
//	        HttpSession session = request.getSession();
//	        if (session.getAttribute("wishList") == null) { // 비어있으면 새 것으로 초기화를 해준다.
//	        	wishList = new ArrayList<WishList>();
//	        } else {
//	        	wishList = (ArrayList<WishList>) session.getAttribute("wishList"); // 비어있지 않으면 지금까지를 데이터 배열(List)을 담는다.
//	        }
//	        session.setAttribute("wishList", wishList); 
	        // WishListServlet에서 wishList.jsp를 보여준다.
		//쿠키로 만들기 
		
//		String pImage = request.getParameter("pImage");
//		String pName = request.getParameter("pName");
//		String pAddr = request.getParameter("pAddr");
//		String pTel = request.getParameter("pTel");
//		String pCode = request.getParameter("pCode");
//		
//		//찜하기 체크버튼
//		
//		String wishCheck = request.getParameter("wishCheck");
//		
//		WishList wList = new WishList(pImage,pName,pAddr,pTel,pCode);
//		
//		
//		
//		//찜하기 체크버튼 클릭한다면 쿠키생성해서 저장
//		
//		if(wishCheck!=null && wishCheck.trim().equals("on")) {
//			
//			Cookie cookie = new Cookie("pCode", pCode);
//			//쿠키의 유효기간을 1년으로 설정하였음
//		    cookie.setMaxAge(60*60*24*365);
//		    cookie.setValue(pImage);
//		    cookie.setValue(pName);
//		    cookie.setValue(pAddr);
//		    cookie.setValue(pTel);
//		    
//		    response.addCookie(cookie);
//		}
//		
//		
//		request.getRequestDispatcher("/views/client/wishList.jsp").forward(request, response);
//		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
