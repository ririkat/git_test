package com.jb.owner.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jb.pension.model.service.RoomFacilitiesService;
import com.jb.pension.model.service.RoomFileService;
import com.jb.pension.model.service.RoomService;
import com.oreilly.servlet.MultipartRequest;

import common.filerename.MyFileRenamePolicy;

/**
 * Servlet implementation class OwnerModifyRoomEndServlet
 */
@WebServlet("/owner/modifyRoomEnd")
public class OwnerModifyRoomEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerModifyRoomEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "에러! form:enctype");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}

		String saveDir = getServletContext().getRealPath(File.separator+"upload"+File.separator+"room");
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		int maxSize = 1024*1024*1024;
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		// client가 보낸 값을 받아오기
		// 값을 가져올 때는 MultipartRequest객체에서 가져옴
		String rNo = mr.getParameter("rNo");
		String imgSrc = mr.getParameter("imgSrc");
		String pCode = mr.getParameter("pCode");
		String pName = mr.getParameter("pName");
		String rName = mr.getParameter("rName");
		int rNop = Integer.parseInt(mr.getParameter("rNop"));
		int rMaxNop = Integer.parseInt(mr.getParameter("rMaxNop"));
		int rPrice = Integer.parseInt(mr.getParameter("rPrice"));
		int rAddPrice = Integer.parseInt(mr.getParameter("rAddPrice"));
		String rSize = mr.getParameter("rSize");
		String rStruc = mr.getParameter("rStruc");
		String rInfo = mr.getParameter("rInfo");
		String[] facilities = mr.getParameterValues("facilities");

		System.out.println(pCode + " / " + rName + " / " + rNop + " / " + rMaxNop + " / " + rPrice + " / " + rAddPrice
				+ " / " + rSize + " / " + rStruc + " / " + rInfo);
		for (int i = 0; i < facilities.length; i++) {
			System.out.println(facilities[i]);
		}

		// 객실 수정
		int result = new RoomService().modifyRoom(rNo, rName, rNop, rMaxNop, rPrice, rAddPrice, rSize, rStruc, rInfo);

		// 부대시설 수정
		String[] facCheck = { "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "N",
				"N", "N" };
		String[] fac = { "bed", "dressTable", "table", "sofa", "dressCase", "bath", "spa", "washKit", "tv", "beam",
				"aircon", "fridge", "cookFac", "cookUten", "rice", "microwave", "rSmoked", "child", "oView", "iPool" };
		if (facilities != null) {
			for (int i = 0; i < facilities.length; i++) {
				for (int j = 0; j < fac.length; j++) {
					if (facilities[i].equals(fac[j])) {
						facCheck[j] = "Y";
						break;
					}
				}
			}
		}
		int facRes = new RoomFacilitiesService().modifyFacilities(rNo, facCheck);

		// 객실 이미지 추가
		String file = "";
		String oriFile = "";
		String reFile = "";
		int imgRes = 0;
		Enumeration files = mr.getFileNames();
		if(files!=null) {
			while (files.hasMoreElements()) {
				file = (String) files.nextElement();
				oriFile = mr.getOriginalFileName(file);
				reFile = mr.getFilesystemName(file);
				imgRes = new RoomFileService().addImages(rNo, oriFile, reFile);
				if (!(imgRes > 0)) {
					File remove = new File(saveDir + "/" + reFile);
					remove.delete();
				}
			}			
		}

		String msg = "";
		String loc = "";
		if (result > 0 && facRes > 0 && imgRes >= 0) {
			msg = "객실 수정 완료";
			loc = "/owner/pensionDetail?pensionCode=" + pCode + "&imgSrc=" + imgSrc;
		} else {
			File remove = new File(saveDir + "/" + reFile);
			remove.delete();
			msg = "객실 수정 실패";
			loc = "/owner/modifyRoom?rNo="+rNo+"&pCode="+pCode+"&imgSrc="+imgSrc+"&pName="+pName+"&rName="+rName+"&rNop="+rNop+"&rMaxNop="+rMaxNop+"&rPrice="+rPrice+"&rAddPrice="+rAddPrice+"&rSize="+rSize+"&rStruc="+rStruc+"&rInfo="+rInfo;
		}
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
