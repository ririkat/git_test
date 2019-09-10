package com.jb.faq.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jb.faq.model.service.FaqService;
import com.jb.faq.model.vo.Faq;
import com.oreilly.servlet.MultipartRequest;

import common.filerename.MyFileRenamePolicy;

/**
 * Servlet implementation class FaqWriteEndServlet
 */
@WebServlet("/faq/faqWriteEnd")
public class FaqWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "게시판에러!!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		//경로설정
		String saveDir=getServletContext().getRealPath(File.pathSeparator+"upload"+File.separator+"faq");
		
		File dir=new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		//업로드 파일크기 설정
		int maxSize=1024*1024*10;
		//multipartRequest 객체 생성
		MultipartRequest mr=new MultipartRequest(request,saveDir,maxSize,"UTF-8",new MyFileRenamePolicy());
		
		//정보 받아오기
		String title = mr.getParameter("title");
		String writer=mr.getParameter("writer");
		String content=mr.getParameter("content");
		String oldFile=mr.getOriginalFileName("up_file");
		String reFile=mr.getFilesystemName("up_file");
		
		Faq f=new Faq(title,writer,content,oldFile,reFile);
		int result=new FaqService().insertFaq(f);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="게시글 등록완료";
			loc="/faq/faqList";
		}else {
			File remove=new File(saveDir+f.getfRenamedFilename());
			remove.delete();
			msg="게시글 등록실패";
			loc="/faq/faqList";
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
