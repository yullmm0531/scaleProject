package com.scale.user.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxSendEmail
 */
@WebServlet("/sendEmail.us")
public class AjaxSendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 메일 관련 정보
        String host = "smtp.gmail.com";
        String username = "scale.doremipasola@gmail.com";
        String password = "qecs vnex qpyx qgfp";
         
        // 메일 내용
        String code = String.valueOf((int)(Math.random() * 99999 + 10000));
        String recipient = request.getParameter("email");
        String subject = "SCALE 회원가입 이메일 인증";
        String body = "SCALE 회원가입을 위한 이메일 인증입니다. 인증코드를 입력해주세요.\n 인증코드 : ["+code+"]";
         
        //properties 설정
        Properties props = new Properties();
        props.put("mail.smtps.auth", "true");
        // 메일 세션
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session);
 
        // 메일 관련
        try {
			msg.setSubject(subject);
			msg.setText(body);
			msg.setFrom(new InternetAddress(username));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			
			// 발송 처리
			Transport transport = session.getTransport("smtps");
			transport.connect(host, username, password);
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();     
		} catch (MessagingException e) {
			e.printStackTrace();
		}
        
        response.getWriter().print(code);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
