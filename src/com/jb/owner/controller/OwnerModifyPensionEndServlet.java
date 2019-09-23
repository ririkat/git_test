package com.jb.owner.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jb.pension.model.service.PensionFacilitiesService;
import com.jb.pension.model.service.PensionFileService;
import com.jb.pension.model.service.PensionService;
import com.oreilly.servlet.MultipartRequest;

import common.filerename.MyFileRenamePolicy;

/**
 * Servlet implementation class OwnerModifyPensionEndServlet
 */
@WebServlet("/owner/modifyPensionEnd")
public class OwnerModifyPensionEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerModifyPensionEndServlet() {
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

		String saveDir = getServletContext().getRealPath(File.separator+"upload"+File.separator+"pension");
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		int maxSize = 1024*1024*1024;
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		// client가 보낸 값들 받아오기
		String oId = mr.getParameter("oId");
		String pCode = mr.getParameter("pCode");
		String pName = mr.getParameter("pName");
		String pAddr = mr.getParameter("pAddr");
		String tel = mr.getParameter("tel1")+mr.getParameter("tel2")+mr.getParameter("tel3");
		String[] facilities = mr.getParameterValues("facilities");
		
		// 파일명 가져오기 !
		String oriFile = mr.getOriginalFileName("panorama");	//실제 올린 파일명
		String reFile = mr.getFilesystemName("panorama");		//새로 지정된 이름
				
		//펜션 테이블에서 값 수정
		int penRes = new PensionService().modifyPension(pCode,tel);
		
		//부대시설 테이블 수정
		String[] facCheck = {"N","N","N","N","N","N","N","N","N","N","N","N","N","N"};
		String[] fac = {"store","wifi","pet","pool","s_pool","slide","open_bath","grill","smoked","cafe","sing","foot","hand","car"};
		if(facilities!=null) {
			for(int i=0; i<facilities.length; i++) {
				for(int j=0; j<fac.length; j++) {
					if(facilities[i].equals(fac[j])) {
						facCheck[j]="Y";
						break;
					}
				}
			}			
		}
		int facRes = new PensionFacilitiesService().modifyFacilities(pCode,facCheck);
		
		String willDelImg = new PensionFileService().selectImages(pCode).getpRenameFile();	//펜션사진. 변경전 원본.
		int imgRes=0;
		//이미지 테이블 수정
		if(oriFile!=null && reFile!=null) {	//수정했으면
			imgRes = new PensionFileService().modifyImages(pCode,oriFile,reFile);	//사진 변경
		}
		String imgSrc = new PensionFileService().selectImages(pCode).getpRenameFile();	//펜션사진.(수정되면 된거 안되면 안된거!)
		
		String msg = "";
		String loc = "";
		if(penRes>0 && facRes>0 && imgRes>=0) {
			File remove = new File(saveDir+"/"+willDelImg);	//변경전 원본 삭제
			remove.delete();
			msg = "펜션 수정 완료";
			loc = "/owner/pensionDetail?pensionCode="+pCode+"&imgSrc="+imgSrc;
		} else {
			File remove = new File(saveDir+"/"+reFile);
			remove.delete();
			msg = "펜션 수정 실패";
			loc = "/owner/modifyPension?pCode="+pCode+"&oId="+oId+"&pName="+pName+"&pAddr="+pAddr;
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
