package com.jb.owner.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.service.OwnerService;
import com.jb.owner.model.vo.Owner;

/**
 * Servlet implementation class signUpOwnerServlet
 */
@WebServlet(name="SignUpOwner",urlPatterns="/owner/signUp")
public class SignUpOwnerEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpOwnerEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("oid");
		String pw = request.getParameter("opass");
		String name = request.getParameter("oname");
		
		String birthYY = request.getParameter("obirthYY"); 
		String birthMM = request.getParameter("obirthMM"); 
		String birthDD = request.getParameter("obirthDD"); 
		Date birth = Date.valueOf(birthYY+"-"+birthMM+"-"+birthDD);
		
		
		String gender = request.getParameter("ogender");
		String email = request.getParameter("oemail");
		String phone = request.getParameter("ophone");
		
		String addr1 = request.getParameter("zonecode");
		String addr3 = request.getParameter("address");
		String addr4 = request.getParameter("address_etc");
		
		String addr = ("우)"+addr1+"|"+addr3+"|"+addr4);
		
		Owner o = new Owner(id,pw,name,birth,gender,email,phone,addr);
		OwnerService service = new OwnerService();
		int result = service.insertOwner(o);
		
		String msg = "";
		String loc = "/";
		msg = result>0? "회원가입 축하드립니다. (승인후 펜션등록이 가능합니다.)":"회원가입이 실패하였습니다.";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
