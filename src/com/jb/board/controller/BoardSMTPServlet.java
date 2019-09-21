package com.jb.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class BoardSMTPServlet
 */
@WebServlet("/board/SMTPout")
public class BoardSMTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSMTPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cmmNo=request.getParameter("cmmNo");
		String category=request.getParameter("category");
		String content=request.getParameter("content");
		
		
		String host="smtp.gmail.com";
		String user="ehquf8011@gmail.com";
		String password="ryustarWkd!1";
		
		String msgText="";
		msgText+=cmmNo+"번에 게시물에 대한 신고 내용입니다.<br/>";
		msgText+="신고유형 : "+category+"<br/>";
		msgText+="신고내용 : "+content+"<br/>";
		msgText+="<a href='rclass.iptime.org:9999/"+request.getContextPath()+"/board/boardView?cmmNo="+cmmNo+"'>글내용확인하기</a>";
		
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.starttls.trust", "smtp.gmail.com");
		
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("ohgunchul94@naver.com"));
			message.setSubject("커뮤니티 "+cmmNo+"번 게시글에 대한 신고가 접수되었습니다.");
			message.setContent(msgText,"text/html;charset=utf-8");
			
			Transport.send(message);
			
		}catch(AddressException e) {
			e.printStackTrace();
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
