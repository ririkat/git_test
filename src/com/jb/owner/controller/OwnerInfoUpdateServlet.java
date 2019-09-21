package com.jb.owner.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.service.OwnerService;
import com.jb.owner.model.vo.Owner;

/**
 * Servlet implementation class OwnerInfoUpdateServlet
 */
@WebServlet("/owner/ownerUpdate")
public class OwnerInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oId= request.getParameter("oId");
		
		
		//login하지 않으면 수정할수 없게?
//		HttpSession session = request.getSession();
//		Object loginOwner = session.getAttribute("loginOwner");
//		if(loginOwner == null	) {
//			response.sendRedirect("/");
//			return;
//		}
		
		
		//자신만 수정가능하게 로직
//		if(!loginOwner.equals(request.getParameter("oId"))) {
//			response.sendRedirect("/");
//			return;
//		}
		
		Owner o = new Owner();
		
		o.setoId(request.getParameter("oId"));
		o.setoPw(request.getParameter("oPw"));
		o.setoName(request.getParameter("oName"));
		o.setoGender(request.getParameter("oGender"));
		System.out.println("reqeust oGender : "+request.getParameter("oGender"));
		
		
		
		
		
		String oEmailId = request.getParameter("oEmailId");
		String oEmail2 = request.getParameter("oEmail2");
		String oEmail = oEmailId+"@"+oEmail2;
		System.out.println("업주 이메일 합친거 :"+oEmail);
		o.setoEmail(oEmail);
		
		
		o.setoPhone(request.getParameter("oPhone"));
		
		String obirthYY = request.getParameter("oBirthYY");
		String obirthMM = request.getParameter("oBirthMM");
		String obirthDD = request.getParameter("oBirthDD");
		String obirth = obirthYY+"-"+obirthMM+"-"+obirthDD;
		System.out.println("obirth합친: "+obirth);
		
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = new java.util.Date();
		try {
			utilDate = transFormat.parse(obirth);
		}catch(ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		System.out.println("utilDate: "+utilDate);
		System.out.println("sqlDate: "+sqlDate);
       o.setoBirth(sqlDate);
		
       
        String zonecode = request.getParameter("zonecode");
        String addr = request.getParameter("address");
		String addrEtc = request.getParameter("address_etc");
		String oAddr = "우)"+zonecode+"|"+addr+"|"+addrEtc;
		 
		o.setoAddr(oAddr);
		System.out.println("주소:"+oAddr);
       
		
		int result = new OwnerService().updateOwner(o);
		String msg=result>0?"회원수정이 완료되었습니다.":"회원수정을 실패하였습니다.";
        String loc="/owner/ownerInfo?oId="+oId;
        
        
        request.setAttribute("msg", msg);
        request.setAttribute("loc", loc);
     
        request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
