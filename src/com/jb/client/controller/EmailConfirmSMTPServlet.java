package com.jb.client.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

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

/**
 * Servlet implementation class EmailConfirmSMTPServlet
 */
@WebServlet("/member/emailConfirm")
public class EmailConfirmSMTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailConfirmSMTPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Random rand = new Random();
        String numStr = ""; //난수가 저장될 변수
        //6자리 난수 생성하기
        for(int i=0;i<6;i++) {
            //0~9 까지 난수 생성
            String ran = Integer.toString(rand.nextInt(10));
            numStr += ran;
        }
        System.out.println(numStr);

		String toEmail=request.getParameter("dataString");
		System.out.println(toEmail);
		
		String host="smtp.gmail.com";
		String user="ehquf8011@gmail.com";
		String password="ryustarWkd!1";
		
		String msgText="인증코드 : "+numStr+"을 입력하세요<br/>**유효시간이 지나면 자동으로 폐기됩니다.**";
		
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			
			message.setSubject("JAVABANG 인증코드 발송");
			message.setContent(msgText,"text/html;charset=utf-8");
			
			Transport.send(message);
			
			System.out.println("메세지 발신 성공~");
			
		}catch(AddressException e) {
			e.printStackTrace();
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		
//		response.getWriter().write(결과로 받아서 남길 값);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(numStr);
		
//		request.setAttribute("numStr", numStr);
//		request.getRequestDispatcher("/views/client/signUpclient.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
