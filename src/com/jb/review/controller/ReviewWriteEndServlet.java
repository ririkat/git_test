package com.jb.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jb.review.model.service.ReviewFileService;
import com.jb.review.model.service.ReviewService;
import com.oreilly.servlet.MultipartRequest;

import common.filerename.MyFileRenamePolicy;
import oracle.net.aso.e;

/**
 * Servlet implementation class ReviewWriteEndServlet
 */
@WebServlet("/review/reviewWriteEnd")
public class ReviewWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "리뷰게시판에러!![form:enctype 관리자에게 문의하세요!]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		String root = getServletContext().getRealPath("/");
		String saveDir = root+"/upload/review";
		
		File dir = new File(saveDir);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		
		int maxSize=1024*1024*50;
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		String pCode = mr.getParameter("pCode");
		
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");
		
//		String oriFile= mr.getOriginalFileName("upfile");//원래이름
//		String reFile = mr.getFilesystemName("upfile");//rename된 이름
		
		
//		Review r = new Reveiw(title, writer, content, oldFile, reFile);
		
		//리뷰DB추가 /dao insert후 시퀀스넘버반환
		int currval = new ReviewService().writeReview(title, writer, content, pCode);
		
		//객실 이미지 추가
		String file="";
		String oriFile = "";
		String reFile="";
		int imgRes = 0;
		Enumeration files = mr.getFileNames();
		while(files.hasMoreElements()) {
			file = (String)files.nextElement();
			oriFile = mr.getOriginalFileName(file);
			reFile = mr.getFilesystemName(file);
			imgRes = new ReviewFileService().addImages(currval, oriFile, reFile);
			if(!(imgRes>0)) {
				File remove = new File(saveDir+"/"+reFile);
				remove.delete();
			}
		}

		String msg= "";
		String loc="";
		
		if(currval>0 && imgRes>0) {
			msg = "리뷰 등록 완료";
			loc = "/review/clientReviewList?pensionCode="+pCode;
		}
		else {
			File remove = new File(saveDir+"/"+reFile);
			remove.delete();
			msg="리뷰 등록 실패";
			loc = "/review/clientReviewList?pensionCode="+pCode;
		}
		
//		request.setAttribute("pCode", pCode);
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
