package com.jb.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jb.notice.model.service.NoticeService;
import com.jb.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

import common.filerename.MyFileRenamePolicy;

/**
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet("/notice/noticeUpdateEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeUpdateEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "게시판에러!![form:enctype 관리자에게 문의하세요!]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}

		String root = getServletContext().getRealPath("/");
		String saveDir = root+"/upload/notice/";
		//경로 한번에 설정하기
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//2. 업로드 파일크기 설정
		int maxSize = 1024 * 1024 * 10;
		//Multipartrequest 객체 생성
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new MyFileRenamePolicy());

		int no = Integer.parseInt(mr.getParameter("noticeNo"));
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");
		String oldFile= mr.getOriginalFileName("up_file");//원래이름
		String reFile = mr.getFilesystemName("up_file");//rename된 이름
		Notice n = new Notice(no, title, writer, content, oldFile, reFile);


		int result = new NoticeService().updateNotice(n);
		String msg="";
		String loc="";

		if (result > 0) {
			String renFile=mr.getParameter("oriren");
			System.out.println(renFile);
			File remove=new File(saveDir+renFile);
			remove.delete();//원래 있던 파일은 삭제
			msg="게시글 수정 완료";
			loc="/notice/noticeView?no="+no;
		} else {
			File remove=new File(saveDir+n.getnRenamedFile());
			remove.delete();//파일삭제
			msg="게시글 수정실패";
			loc="/notice/noticeUpdate?noticeNo="+no;
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
