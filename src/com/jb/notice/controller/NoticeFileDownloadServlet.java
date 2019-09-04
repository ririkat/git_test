package com.jb.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFileDownloadServlet
 */
@WebServlet("/notice/noticeFileDown")
public class NoticeFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.실제파일경로 가져오기
		String root=getServletContext().getRealPath("/");
		String saveDir=root+File.separator+"upload"+File.separator+"notice";
		
		String ori=request.getParameter("orifileName");
		String re=request.getParameter("refileName");
		//스트림열기
		//대상 파일을 HARD에서 RAM으로 불러온 것!
		File downFile=new File(saveDir+"/"+re);
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(downFile));
		//파일을 보낼곳 stream 열기
//		ServletOutputStream sos=response.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());

		//브라우저에 따른 인코딩처리
		//한글파일명을 보낼때 깨지지않게 인코딩처리
		String resFileName="";
		boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1
				||request.getHeader("user-agent").indexOf("Trident")!=-1;
		if(isMSIE) {
			resFileName=URLEncoder.encode(ori,"UTF-8").replaceAll("\\+","%20");
		}else {
			resFileName=new String(ori.getBytes("UTF-8"),"ISO-8859-1");
		}
		//response헤더 작성
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+resFileName);

		//파일전송
		int read=-1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		bos.close();
		bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
