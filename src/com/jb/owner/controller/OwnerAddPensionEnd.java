package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jb.pension.model.service.PensionService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class OwnerAddPensionEnd
 */
@WebServlet("/owner/addPensionEnd")
public class OwnerAddPensionEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerAddPensionEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "펜션추가 에러! form:enctype");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
		String saveDir = root + "/upload/pension";
		int maxSize = 1024 * 1024 * 500;	//500MB?? 몰라
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		// client가 보낸 값을 받아오기
		// 값을 가져올 때는 MultipartRequest객체에서 가져옴
		String oId = mr.getParameter("oId");
		String pName = mr.getParameter("pName");
		String addr = mr.getParameter("address")+" "+mr.getParameter("address_etc");
		String tel = mr.getParameter("tel1")+mr.getParameter("tel2")+mr.getParameter("tel3");
		String[] facilities = mr.getParameterValues("facilities");
		// 파일명 가져오기 !
		String fileName = mr.getFilesystemName("panorama");
		
		System.out.println(oId+" / "+pName+" / "+addr+" / "+tel+" / "+fileName);
		for(int i=0; i<facilities.length; i++) {
			System.out.println(facilities[i]);			
		}
		
		//펜션객체에 담아 DB에 추가하기
		int result = new PensionService().addPension(pName,addr,tel,oId);
		
		//이미지,부대시설은 따로 담아 DB에 추가(펜션부대시설 테이블)
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
